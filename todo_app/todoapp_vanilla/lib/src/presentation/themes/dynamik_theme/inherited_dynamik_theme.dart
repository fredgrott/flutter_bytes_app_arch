
// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Original created by Sangam Kumar Shrestha under
// Mit License copyright 2023, see
// https://github.com/2shrestha22/dynamik_theme


import 'package:flutter/material.dart';
import 'package:todoapp_vanilla/src/presentation/themes/dynamik_theme/theme_config.dart';
import 'package:todoapp_vanilla/src/presentation/themes/dynamik_theme/theme_state.dart';

/// 
/// [InheritedWidget] that allows to update [ThemeState] from anywhere in the
/// widget tree.
/// 
class InheritedDynamikTheme extends InheritedWidget {
  /// 
  const InheritedDynamikTheme({
    super.key,
    required this.config,
    required this.themeState,
    required this.onStateUpdate,
    required super.child,
  });

  /// 
  final ThemeState themeState;

  /// 
  final ThemeConfig config;

  /// Higher order function that allows to update [ThemeState].
  final void Function(ThemeState Function(ThemeState) updater) onStateUpdate;

  @override
  bool updateShouldNotify(covariant InheritedDynamikTheme oldWidget) {
    return themeState != oldWidget.themeState;
  }

  static InheritedDynamikTheme? _maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedDynamikTheme>();
  }

  /// 
  /// Method that allows widgets to access a [InheritedDynamikTheme] instance.
  ///
  /// ```dart
  /// DynamikTheme.of(context);
  /// ```
  /// 
  static InheritedDynamikTheme of(BuildContext context) {
    final InheritedDynamikTheme? result = _maybeOf(context);
    assert(result != null, 'No DynamicTheme found in the context.');
    return result!;
  }

  /// Set new [ThemeState].
  void setTheme(ThemeState value) => onStateUpdate((_) => value);

  /// Set new [ThemeMode] without chaning other values in [ThemeState].
  void setThemeMode(ThemeMode value) => onStateUpdate(
        (state) => state.copyWith(themeMode: value),
      );

  /// Set ColorMode.dynamik
  void setDynamikColorMode() => onStateUpdate(
        (state) => state.copyWith(colorMode: ColorMode.dynamik),
      );

  /// Set ColorMode.custom
  void setCustomColorMode(Color value) => onStateUpdate(
        (state) => state.copyWith(seed: value, colorMode: ColorMode.custom),
      );
}
