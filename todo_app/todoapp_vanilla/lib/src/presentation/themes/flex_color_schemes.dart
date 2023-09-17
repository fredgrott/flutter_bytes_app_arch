// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// ignore_for_file: avoid_redundant_argument_values

import 'dart:ui';

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:todoapp_vanilla/src/presentation/themes/custom_color_schemes.dart';
import 'package:todoapp_vanilla/src/presentation/themes/custom_flex_tones.dart';

// These are the HC themes for iOS and thus do not flow
// through the custom dynamic color builder.
FlexColorScheme myLightHCFlexColorScheme = FlexColorScheme.light(
  colorScheme: SeedColorScheme.fromSeeds(
    primaryKey: mySeed,
    primary: mySeed,
    tones: myLightHCTones,
  ),

  surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,

  blendLevel: 0,

  appBarStyle: FlexAppBarStyle.material,

  appBarOpacity: 10,

  transparentStatusBar: true,

  appBarElevation: 0,

  bottomAppBarElevation: 0,

  tabBarStyle: FlexTabBarStyle.universal,

  lightIsWhite: false,

  swapLegacyOnMaterial3: false,

  swapColors: false,

  tooltipsMatchBackground: true,

  subThemesData: FlexSubThemesData(

    interactionEffects: true,

    tintedDisabledControls: true,

    blendOnLevel: 10,

    blendOnColors: true,

    blendTextTheme: true,

    useTextTheme: true,

    useM2StyleDividerInM3: false,

    thinBorderWidth: 4,

    thickBorderWidth: 8,

    useFlutterDefaults: false,

    adaptiveRemoveElevationTint: FlexAdaptive.all(),

    adaptiveElevationShadowsBack: FlexAdaptive.all(),

    adaptiveAppBarScrollUnderOff: FlexAdaptive.all(),

    adaptiveRadius: FlexAdaptive.all(),

    adaptiveSplash: FlexAdaptive.all(),

    splashType: FlexSplashType.defaultSplash,

    splashTypeAdaptive: FlexSplashType.defaultSplash,

    defaultRadius: null,

    defaultRadiusAdaptive: null,

    textButtonRadius: null,

    textButtonSchemeColor: null,

    filledButtonRadius: null,

    filledButtonSchemeColor: null,

    elevatedButtonRadius: null,

    elevatedButtonSchemeColor: null,

    elevatedButtonSecondarySchemeColor: null,

    elevatedButtonElevation: null,

    outlinedButtonRadius: null,

    outlinedButtonSchemeColor: null,

    outlinedButtonOutlineSchemeColor: null,

    outlinedButtonBorderWidth: null,

    outlinedButtonPressedBorderWidth: null,

    toggleButtonsRadius: null,

    toggleButtonsSchemeColor: null,

    toggleButtonsUnselectedSchemeColor: null,

    toggleButtonsBorderSchemeColor: null,

    toggleButtonsBorderWidth: null,

    segmentedButtonRadius: null,

    segmentedButtonSchemeColor: null,

    segmentedButtonUnselectedSchemeColor: null,

    segmentedButtonUnselectedForegroundSchemeColor: null,

    segmentedButtonBorderSchemeColor: null,

    segmentedButtonBorderWidth: null,
  ),
);

FlexColorScheme myDarkHCFlexColorScheme = FlexColorScheme.dark(
  colorScheme: SeedColorScheme.fromSeeds(
    primaryKey: mySeed,
    brightness: Brightness.dark,
    tones: myDarkHCTones,
  ),

  surfaceMode: FlexSurfaceMode.highBackgroundLowScaffold,

  blendLevel: 0,

  appBarStyle: FlexAppBarStyle.material,

  appBarOpacity: 10,

  transparentStatusBar: true,

  appBarElevation: 0,

  bottomAppBarElevation: 0,

  tabBarStyle: FlexTabBarStyle.universal,

  darkIsTrueBlack: false,

  swapLegacyOnMaterial3: false,

  swapColors: false,

  tooltipsMatchBackground: true,
);
