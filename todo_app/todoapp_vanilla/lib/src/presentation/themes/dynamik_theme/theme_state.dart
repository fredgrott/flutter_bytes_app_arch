// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Original created by Sangam Kumar Shrestha under
// Mit License copyright 2023, see
// https://github.com/2shrestha22/dynamik_theme


import 'dart:convert';

import 'package:flutter/material.dart';

/// Describes which color mode will be used with [DynamikThemeBuilder].
enum ColorMode {
  /// Use sytem color. For supported platforms see. dynamic_color
  /// https://pub.dev/packages/dynamic_color
  dynamik,

  /// Manually provide seed color.
  custom,
}

/// 
/// State used by [DynamikTheme] to determine [ThemeData] and [ThemeMode].
/// 
class ThemeState {
  /// Describes which theme will be used by [MaterialApp].
  final ThemeMode themeMode;

  /// If [colorMode] is null then [seed] will be ignored.
  ///
  /// When null [colorMode] default color scheme is used provide in
  /// [ThemeConfig].
  final ColorMode? colorMode;

  /// If [colorMode] is null then [seed] will be ignored.
  final Color? seed;

  /// 
  const ThemeState({
    required this.themeMode,
    this.colorMode,
    this.seed,
  });

  /// Creates a copy of this theme state but with the given fields replaced
  /// with the new values.
  ThemeState copyWith({
    ThemeMode? themeMode,
    ColorMode? colorMode,
    Color? seed,
  }) {
    return ThemeState(
      themeMode: themeMode ?? this.themeMode,
      colorMode: colorMode ?? this.colorMode,
      seed: seed ?? this.seed,
    );
  }

  /// Returns Map representation of [ThemeState].
  Map<String, dynamic> toMap() {
    return {
      'themeMode': themeMode.name,
      'colorMode': colorMode?.name,
      'seed': seed?.value,
    };
  }

  /// Returns [ThemeState] from provided valid Map object.
  factory ThemeState.fromMap(Map<String, dynamic> map) {
    return ThemeState(
      themeMode: ThemeMode.values.byName(map['themeMode'] as String),
      colorMode: map['colorMode'] != null
          ? ColorMode.values.byName(map['colorMode'] as String)
          : null,
      seed: map['seed'] != null ? Color(map['seed'] as int) : null,
    );
  }

  /// Encoded [ThemeData] to JSON String.
  String toJson() => json.encode(toMap());

  /// Returns [ThemeState] from encoded JSON String.
  factory ThemeState.fromJson(String source) =>
      ThemeState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ThemeData(themeMode: $themeMode, colorMode: $colorMode, seed: $seed)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ThemeState &&
        other.themeMode == themeMode &&
        other.colorMode == colorMode &&
        other.seed == seed;
  }

  @override
  int get hashCode => themeMode.hashCode ^ colorMode.hashCode ^ seed.hashCode;
}
