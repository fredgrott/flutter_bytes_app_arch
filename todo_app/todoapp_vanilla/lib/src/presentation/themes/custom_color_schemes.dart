// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.



// Note: Under MD2 we copyWith'd to keep brand colors.
//       While we could use the same approach for MD3 
//       it would conflict with supporting Material You
//       dynamic color. A better approach is to accept
//       that brand colors will only show up in the logo 
//       of the app in appbar and that theme will at times
//       show tone and chroma of brand colors but not the 
//       hue in dynamic color themes.

import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:todoapp_vanilla/src/presentation/themes/custom_flex_tones.dart';

Color mySeed = Colors.indigoAccent;






ColorScheme customLightColorScheme = SeedColorScheme.fromSeeds(
  
  primaryKey: mySeed ,
  primary: mySeed,
  tones: myLightTones,

);

ColorScheme customDarkColorScheme = SeedColorScheme.fromSeeds(
  brightness: Brightness.dark,
  primaryKey:  mySeed,
  tones: myDarkTones,

);

ColorScheme customLightHCColorScheme = SeedColorScheme.fromSeeds(
  
  primaryKey:  mySeed,
  primary: mySeed,
  tones: myLightHCTones,

);

ColorScheme cusgtomDarkHCColorScheme = SeedColorScheme.fromSeeds (
  brightness: Brightness.dark,
  primaryKey:  mySeed,
  tones: myDarkHCTones,


);
