// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.




// Example definition of light custom tones config.
import 'package:flex_color_scheme/flex_color_scheme.dart';

const FlexTones myLightTones = FlexTones.light(
  primaryTone: 30, // Default is 40.
  onPrimaryTone: 96, // Default is 100
  onSecondaryTone: 96, // Default is 100
  onTertiaryTone: 96, // Default is 100
  onErrorTone: 96, // Default is 100
  primaryMinChroma: 55, // Default is 48
  secondaryChroma: 25, // Default is 16
  tertiaryChroma: 40, // Default is 24
  neutralChroma: 5, // Default is 4, avoid very high values in light mode.
  neutralVariantChroma: 10, // Default is 8
  paletteType: FlexPaletteType.extended, // Use extended palette type
);

// Example definition of dark custom tones config.
const FlexTones myDarkTones = FlexTones.dark(
  primaryTone: 70, // Default is 80.
  onPrimaryTone: 6, // Default is 20
  onSecondaryTone: 6, // Default is 20
  onTertiaryTone: 6, // Default is 20
  onErrorTone: 6, // Default is 20
  primaryMinChroma: 55, // Default is 48
  secondaryChroma: 25, // Default is 16
  tertiaryChroma: 40, // Default is 24
  neutralChroma: 7, // Default is 4, you can go higher in dark mode than light.
  neutralVariantChroma: 14, // Default is 8
  paletteType: FlexPaletteType.extended, // Use extended palette type
);

// For iOS we need HC tones for ColorSchemes
// Borrowed from FLexSeedScheme source see:
// https://github.com/rydmike/flex_seed_scheme/blob/master/lib/src/flex/flex_tones.dart

const FlexTones myLightHCTones = FlexTones.light(
  primaryTone: 30,
  tertiaryTone: 30,
  tertiaryContainerTone: 95,
  errorContainerTone: 95,
  surfaceTintTone: 30,
  //
  primaryMinChroma: 65,
  secondaryMinChroma: 55,
  tertiaryMinChroma: 55,
);

const FlexTones myDarkHCTones = FlexTones.dark(
  onPrimaryTone: 10,
  onSecondaryTone: 10,
  onTertiaryTone: 10,
  onErrorTone: 10,
  primaryContainerTone: 20,
  secondaryContainerTone: 20,
  tertiaryContainerTone: 20,
  errorContainerTone: 20,
  onErrorContainerTone: 90,
   //
  primaryMinChroma: 65,
  secondaryMinChroma: 55,
  tertiaryMinChroma: 55,

);