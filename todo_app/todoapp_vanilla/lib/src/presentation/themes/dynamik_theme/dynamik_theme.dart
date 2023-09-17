// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Original created by Sangam Kumar Shrestha under
// Mit License copyright 2023, see
// https://github.com/2shrestha22/dynamik_theme

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:todoapp_vanilla/src/presentation/themes/custom_dynamic_color_builder.dart';
import 'package:todoapp_vanilla/src/presentation/themes/custom_flex_tones.dart';
import 'package:todoapp_vanilla/src/presentation/themes/dynamik_theme/inherited_dynamik_theme.dart';
import 'package:todoapp_vanilla/src/presentation/themes/dynamik_theme/theme_config.dart';
import 'package:todoapp_vanilla/src/presentation/themes/dynamik_theme/theme_state.dart';

///
/// [DynamikTheme] provides [ThemeData] and [ThemeMode] based on color scheme
/// or custom color.
///
/// Wrap [MaterialApp] with [DynamikTheme] and use [ThemeData] for light/dark
/// mode and [ThemeMode].
///
class DynamikTheme extends StatefulWidget {
  ///
  const DynamikTheme({
    super.key,
    required this.config,
    required this.builder,
  });

  ///
  static InheritedDynamikTheme of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<InheritedDynamikTheme>()!;

  ///
  final ThemeConfig config;

  /// ThemeData theme, ThemeData darkTheme, ThemeMode themeMode.
  final Widget Function(
    ThemeData theme,
    ThemeData darkTheme,
    ThemeMode themeMode,
  ) builder;

  @override
  State<DynamikTheme> createState() => _DynamikThemeState();
}

class _DynamikThemeState<T> extends State<DynamikTheme> {
  late final _storage = ThemeConfig.storage;
  late ThemeState themeState = _storage.read() ?? widget.config.defaultThemeState;

  void onStateUpdate(ThemeState Function(ThemeState state) updater) {
    final newState = updater(themeState);
    if (themeState == newState) return;
    setState(() {
      themeState = newState;
    });
    _storage.write(newState);
  }

  @override
  Widget build(BuildContext context) {
    return CustomDynamicColorBuilder(
      builder: (lightDynamic, darkDynamic) {
        return InheritedDynamikTheme(
          config: widget.config,
          themeState: themeState,
          onStateUpdate: onStateUpdate,
          child: Builder(
            builder: (context) {
              final themeState = InheritedDynamikTheme.of(context).themeState;
              final config = InheritedDynamikTheme.of(context).config;

              late ThemeData themeData;
              late ThemeData darkThemeData;

              if (themeState.colorMode == ColorMode.dynamik) {
                // use dynamic theming
                themeData = lightDynamic == null ? config.lightTheme : config.fromScheme(lightDynamic);
                darkThemeData = darkDynamic == null ? config.darkTheme : config.fromScheme(darkDynamic);
              } else if (themeState.colorMode == ColorMode.custom && themeState.seed != null) {
                // create new dynamic theme from custom color
                themeData = config.fromScheme(
                  // Need to flow this through
                  // Flex Seed Scheme SeedColorScheme extension
                  // instead
                  SeedColorScheme.fromSeeds(
                    primaryKey: themeState.seed!,
                    primary: themeState.seed,
                    tones: myLightTones,
                  ),
                );
                darkThemeData = config.fromScheme(
                  // Need to flow this through
                  // Flex Seed Scheme SeedColorScheme extension
                  // instead
                  SeedColorScheme.fromSeeds(
                    primaryKey: themeState.seed!,
                    brightness: Brightness.dark,
                    tones: myDarkTones,
                  ),
                );
              } else {
                // use default theming from theme config scheme.
                themeData = config.lightTheme;
                darkThemeData = config.darkTheme;
              }
              return widget.builder(
                themeData,
                darkThemeData,
                themeState.themeMode,
              );
            },
          ),
        );
      },
    );
  }
}
