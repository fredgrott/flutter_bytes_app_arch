// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Original created by Sangam Kumar Shrestha under
// Mit License copyright 2023, see
// https://github.com/2shrestha22/dynamik_theme

import 'package:todoapp_vanilla/src/presentation/themes/dynamik_theme/theme_state.dart';

/// Interface which is used to persist and retrieve state changes.
abstract class ThemeStorage {
  /// Returns saved theme state.
  ThemeState? read();

  /// Saves theme to storage.
  Future<void> write(ThemeState state);

  /// Deletes saved theme state from storage.
  Future<void> delete();
}

/// Saves [ThemeState] in memory.
class InMemoryThemeStorage implements ThemeStorage {
  ThemeState? _state;

  @override
  Future<void> delete() async {
    _state = null;
  }

  @override
  ThemeState? read() {
    return _state;
  }

  @override
  Future<void> write(ThemeState state) async {
    _state = state;
  }
}
