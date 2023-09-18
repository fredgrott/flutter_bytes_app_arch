// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.



// Note: This is ThemeData merges Typography
// and TextThemes:
// ```dart
// typography ??= useMaterial3
//     ? Typography.material2021(platform: platform, //colorScheme: colorScheme)
//     : Typography.material2014(platform: platform);
//  TextTheme defaultTextTheme = isDark ? typography.white : // typography.black;
//  TextTheme defaultPrimaryTextTheme = primaryIsDark ?
// typography.white : typography.black;
//   if (fontFamily != null) {
//    defaultTextTheme = defaultTextTheme.apply(fontFamily: //fontFamily);
// defaultPrimaryTextTheme = //defaultPrimaryTextTheme.apply(fontFamily: fontFamily);
//  }
// if (fontFamilyFallback != null) {
//    defaultTextTheme = //defaultTextTheme.apply(fontFamilyFallback: //fontFamilyFallback);
//    defaultPrimaryTextTheme = //defaultPrimaryTextTheme.apply(fontFamilyFallback: //fontFamilyFallback);
//    }
//   if (package != null) {
//      defaultTextTheme = defaultTextTheme.apply(package: // package);
//   defaultPrimaryTextTheme = //defaultPrimaryTextTheme.apply(package: package);
//    }
//    textTheme = defaultTextTheme.merge(textTheme);
//    primaryTextTheme = //defaultPrimaryTextTheme.merge(primaryTextTheme);
//
// Since under MD3 surface colors take into account the
// black with lightColorScheme and white with darkColorScheme
// we only need to set up a TextTheme with the right
// custom fonts and the right script settings.
//
// For English scripts its englishlike, for Asian
// scripts its dense, and for South, Southeast Asian
// and Middle East its tall.
// see ThemeData source
// https://github.com/flutter/flutter/blob/367f9ea16bfae1ca451b9cc27c1366870b187ae2/packages/flutter/lib/src/material/typography.dart

import 'dart:ui';

import 'package:flutter/material.dart';

TextTheme customTextTheme = const TextTheme(
  displayLarge: TextStyle(
    debugLabel: 'englishLike displayLarge 2021',
    inherit: false,
    fontFamily: 'RobotoSlab',
    fontSize: 57.0,
    fontWeight: FontWeight.w400,
    fontVariations: <FontVariation> [ FontVariation('wght', 400)],
    letterSpacing: -0.25,
    height: 1.12,
    textBaseline: TextBaseline.alphabetic,
    leadingDistribution: TextLeadingDistribution.even,
  ),
  displayMedium: TextStyle(
    debugLabel: 'englishLike displayMedium 2021',
    inherit: false,
    fontFamily: 'RobotoSlab',
    fontSize: 45.0,
    fontWeight: FontWeight.w400,
    fontVariations: <FontVariation>[FontVariation('wght', 400)],
    letterSpacing: 0.0,
    height: 1.16,
    textBaseline: TextBaseline.alphabetic,
    leadingDistribution: TextLeadingDistribution.even,
  ),
  displaySmall: TextStyle(
      debugLabel: 'englishLike displaySmall 2021',
      inherit: false,
      fontFamily: 'RobotoSlab',
      fontSize: 36.0,
      fontWeight: FontWeight.w400,
      fontVariations: <FontVariation>[FontVariation('wght', 400)],
      letterSpacing: 0.0,
      height: 1.22,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,),
  headlineLarge: TextStyle(
      debugLabel: 'englishLike headlineLarge 2021',
      inherit: false,
      fontFamily: 'RobotoSerif',
      fontSize: 32.0,
      fontWeight: FontWeight.w400,
      fontVariations: <FontVariation>[FontVariation('wght', 400)],
      letterSpacing: 0.0,
      height: 1.25,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,),
  headlineMedium: TextStyle(
      debugLabel: 'englishLike headlineMedium 2021',
      inherit: false,
      fontFamily: 'RobotoSerif',
      fontSize: 28.0,
      fontWeight: FontWeight.w400,
      fontVariations: <FontVariation>[FontVariation('wght', 400)],
      letterSpacing: 0.0,
      height: 1.29,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,),
  headlineSmall: TextStyle(
      debugLabel: 'englishLike headlineSmall 2021',
      inherit: false,
      fontFamily: 'RobotoSerif',
      fontSize: 24.0,
      fontWeight: FontWeight.w400,
      fontVariations: <FontVariation>[FontVariation('wght', 400)],
      letterSpacing: 0.0,
      height: 1.33,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,),
  titleLarge: TextStyle(
      debugLabel: 'englishLike titleLarge 2021',
      inherit: false,
      fontFamily: 'RobotoSlab',
      fontSize: 22.0,
      fontWeight: FontWeight.w400,
      fontVariations: <FontVariation>[FontVariation('wght', 400)],
      letterSpacing: 0.0,
      height: 1.27,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,),
  titleMedium: TextStyle(
      debugLabel: 'englishLike titleMedium 2021',
      inherit: false,
      fontFamily: 'RobotoSlab',
      fontSize: 16.0,
      fontWeight: FontWeight.w500,
      fontVariations: <FontVariation>[FontVariation('wght', 500)],
      letterSpacing: 0.15,
      height: 1.50,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,),
  titleSmall: TextStyle(
      debugLabel: 'englishLike titleSmall 2021',
      inherit: false,
      fontFamily: 'RobotoSlab',
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      fontVariations: <FontVariation>[FontVariation('wght', 500)],
      letterSpacing: 0.1,
      height: 1.43,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,),
  labelLarge: TextStyle(
      debugLabel: 'englishLike labelLarge 2021',
      inherit: false,
      fontFamily: 'RobotoFlex',
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      fontVariations: <FontVariation>[FontVariation('wght', 500)],
      letterSpacing: 0.1,
      height: 1.43,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,),
  labelMedium: TextStyle(
      debugLabel: 'englishLike labelMedium 2021',
      inherit: false,
      fontFamily: 'RobotoFlex',
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      fontVariations: <FontVariation>[FontVariation('wght', 500)],
      letterSpacing: 0.5,
      height: 1.33,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,),
  labelSmall: TextStyle(
      debugLabel: 'englishLike labelSmall 2021',
      inherit: false,
      fontFamily: "RobotoFlex",
      fontSize: 11.0,
      fontWeight: FontWeight.w500,
      fontVariations: <FontVariation>[FontVariation('wght', 500)],
      letterSpacing: 0.5,
      height: 1.45,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,),
  bodyLarge: TextStyle(
      debugLabel: 'englishLike bodyLarge 2021',
      inherit: false,
      fontFamily: 'RobotoFlex',
      fontSize: 16.0,
      fontWeight: FontWeight.w400,
      fontVariations: <FontVariation>[FontVariation('wght', 400)],
      letterSpacing: 0.5,
      height: 1.50,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,),
  bodyMedium: TextStyle(
      debugLabel: 'englishLike bodyMedium 2021',
      inherit: false,
      fontFamily: "RobotoFlex",
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      fontVariations: <FontVariation>[FontVariation('wght', 400)],
      letterSpacing: 0.25,
      height: 1.43,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,),
  bodySmall: TextStyle(
      debugLabel: 'englishLike bodySmall 2021',
      inherit: false,
      fontFamily: "RobotoFlex",
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      fontVariations: <FontVariation>[FontVariation('wght', 400)],
      letterSpacing: 0.4,
      height: 1.33,
      textBaseline: TextBaseline.alphabetic,
      leadingDistribution: TextLeadingDistribution.even,),
);
