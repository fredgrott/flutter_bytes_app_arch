// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Original created by Sangam Kumar Shrestha under
// Mit License copyright 2023, see
// https://github.com/2shrestha22/dynamik_theme


import 'package:flutter/material.dart';
import 'package:todoapp_vanilla/src/presentation/themes/dynamik_theme/theme_state.dart';

/// 
/// Collection of [ThemeState] for normal use. It has light mode, dark mode and
/// dynamik mode with [ThemeMode.system].
/// 
enum SimpleThemeType {
  /// [ColorMode.dynamik] with [ThemeMode.system].
  dynamik(ThemeState(
    themeMode: ThemeMode.system,
    colorMode: ColorMode.dynamik,
  ),),

  /// [ThemeMode.light]
  light(ThemeState(themeMode: ThemeMode.light)),

  /// [ThemeMode.dark]
  dark(ThemeState(themeMode: ThemeMode.dark));

  /// 
  const SimpleThemeType(this.themeState);

  /// 
  final ThemeState themeState;
}
