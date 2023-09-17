// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modification of DynamicColorBuilder from Dynamic Color
// Original Apache License 2.0
// Flutter SDK and Material IO Teams, see
// https://github.com/material-foundation/flutter-packages/blob/main/packages/dynamic_color/lib/src/dynamic_color_builder.dart

// Note: While MaterialApp for iOS should have the HC themes
//       defined they are not needed for the dynamic color
//       supported platforms.

import 'package:dynamic_color/dynamic_color.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A stateful builder widget that provides a light and dark [ColorScheme].
///
/// Android: the [ColorScheme]s are constructed from the [CorePalette] provided
/// by the Android OS.
///
/// macOS, Windows and Linux: the [ColorScheme]s are constructed from the accent
/// [Color] provided by the system.
///
/// See also:
///
///  * [DynamicColorBuilder example](https://github.com/material-foundation/flutter-packages/tree/main/packages/dynamic_color/example/lib/dynamic_color_builder_example.dart)
///  * [Complete example](https://github.com/material-foundation/flutter-packages/tree/main/packages/dynamic_color/example/lib/complete_example.dart)
///    for obtaining dynamic colors and creating a harmonized color scheme
///  * [DynamicColorPlugin.getCorePalette] for requesting the [CorePalette]
///    directly, asynchronously.
///  * [DynamicColorPlugin.getAccentColor] for requesting the accent [Color]
///    [ColorScheme] directly, asynchronously.
class CustomDynamicColorBuilder extends StatefulWidget {
  const CustomDynamicColorBuilder({
    super.key,
    required this.builder, this.lightTones, this.darkTones,
  });

  // [FCS] and underlying [FSS} use tones to generate
  // ColorScheme from seeds
  final FlexTones? lightTones;
  final FlexTones? darkTones;

  /// Builds the child widget of this widget, providing a light and dark [ColorScheme].
  ///
  /// The [ColorScheme]s will be null if dynamic color is not supported on the
  /// platform, or if the OS has yet to respond.
  final Widget Function(
    ColorScheme? lightDynamic,
    ColorScheme? darkDynamic,
    
  ) builder;

  @override
  CustomDynamicColorBuilderState createState() => CustomDynamicColorBuilderState();
}

class CustomDynamicColorBuilderState extends State<CustomDynamicColorBuilder> {
  ColorScheme? _light;
  ColorScheme? _dark;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      final CorePalette? corePalette = (await DynamicColorPlugin.getCorePalette()) as CorePalette?;

      // If the widget was removed from the tree while the asynchronous platform
      // message was in flight, we want to discard the reply rather than calling
      // setState to update our non-existent appearance.
      if (!mounted) return;

      // android platform part
      if (corePalette != null) {
        debugPrint('dynamic_color: Core palette detected.');
        setState(() {
          // using the FSS extension to ColorScheme
          _light = SeedColorScheme.fromSeeds(
              primaryKey: Color(corePalette.primary.get(40)),
              tones: widget.lightTones,
              // per FCS and FSS docs we set this to keep
              // primary color on CS light only
              primary: Color(corePalette.primary.get(40)),);

          

          _dark = SeedColorScheme.fromSeeds(
            brightness: Brightness.dark,
            primaryKey: Color(corePalette.primary.get(40)),
            tones: widget.darkTones,
          );
        });
        return;
      }
    } on PlatformException {
      debugPrint('dynamic_color: Failed to obtain core palette.');
    }

    try {
      final Color? accentColor = await DynamicColorPlugin.getAccentColor();

      // Likewise above.
      if (!mounted) return;

      // desktop platforms
      if (accentColor != null) {
        debugPrint('dynamic_color: Accent color detected.');
        setState(() {
          _light = SeedColorScheme.fromSeeds(
              primaryKey: accentColor, primary: accentColor, tones: widget.lightTones,);
          _dark = SeedColorScheme.fromSeeds(brightness: Brightness.dark, primaryKey: accentColor, tones: widget.darkTones);
        });
        return;
      }
    } on PlatformException {
      debugPrint('dynamic_color: Failed to obtain accent color.');
    }

    debugPrint('dynamic_color: Dynamic color not detected on this device.');
  }

  @override
  Widget build(BuildContext context) {
    return widget.builder(_light, _dark);
  }
}
