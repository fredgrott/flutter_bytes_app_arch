



import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:todoapp_vanilla/src/presentation/themes/custom_color_schemes.dart';
import 'package:todoapp_vanilla/src/presentation/themes/custom_flex_tones.dart';

ColorScheme customLightColorScheme = SeedColorScheme.fromSeeds(
    primaryKey: mySeed,
    primary: mySeed,
    tones: myLightTones,
  );

ColorScheme customDarkColorScheme = SeedColorScheme.fromSeeds(
    primaryKey: mySeed,
    tones: myDarkTones,
    brightness: Brightness.dark,
  );




ColorScheme customLightHCColorScheme = SeedColorScheme.fromSeeds(
    primaryKey: mySeed,
    primary: mySeed,
    tones: myLightHCTones,
  );


ColorScheme customDarkHCColorScheme = SeedColorScheme.fromSeeds(
    primaryKey: mySeed,
    tones: myDarkHCTones,
    brightness: Brightness.dark,
  );
