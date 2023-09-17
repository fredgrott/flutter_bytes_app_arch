
// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Original created by Sangam Kumar Shrestha under
// Mit License copyright 2023, see
// https://github.com/2shrestha22/dynamik_theme


import 'package:flutter/material.dart';
import 'package:todoapp_vanilla/src/presentation/themes/dynamik_theme/theme_state.dart';
import 'package:todoapp_vanilla/src/presentation/themes/dynamik_theme/theme_storage.dart';

class ThemeConfig {

  const ThemeConfig({
    required this.lightScheme,
    required this.darkScheme,
    required this.defaultThemeState,
    this.useMaterial3,
    this.textTheme,
    
  });


  /// Color scheme for light theme.
  final ColorScheme lightScheme;

  /// Color scheme for dark theme.
  final ColorScheme darkScheme;

  /// Default [ThemeState] to use when theme is not saved.
  final ThemeState defaultThemeState;

  /// `true` if we want to use Material3 theme.
  final bool? useMaterial3;

  /// [TextTheme] to be used.
  final TextTheme? textTheme;

  /// Create a [ThemeData] based on the colors in the given [scheme] and
  /// text styles of the optional [textTheme].
  ThemeData fromScheme(ColorScheme scheme) {
    final themeData = ThemeData.from(
      colorScheme: scheme,
      useMaterial3: useMaterial3,
      textTheme: textTheme,
    );
    
    return themeData;
  }



  /// [ThemeData] generated from provided config and [lightScheme].
  ThemeData get lightTheme => fromScheme(lightScheme);

  /// [ThemeData] generated from provided config and [darkScheme].
  ThemeData get darkTheme => fromScheme(darkScheme);

  static ThemeStorage? _storage;

  /// Setter for instance of [ThemeStorage] which will be used to
  /// persist [ThemeType].
  static set storage(ThemeStorage? storage) => _storage = storage;

  /// Instance of [ThemeStorage] which will be used to
  /// persist [ThemeType].
  static ThemeStorage get storage {
    if (_storage == null) return InMemoryThemeStorage();
    return _storage!;
  }
}
