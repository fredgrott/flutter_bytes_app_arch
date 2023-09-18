// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Originally part of Material3 Layout package
// Copyright 2023 Egor Tabula under BSD-clause-3 license

// ignore_for_file: avoid_classes_with_only_static_members, avoid_bool_literals_in_conditional_expressions

import 'package:flutter/material.dart';

/// Sets up [MDWIndow] class part of the Material Design 3 spec.
/// Provides three sizes of compact, medium, and expanded via
/// media queries of screen size. Designed to work as a
/// companion to the Flutter SDK team Flutter Adaptive Scaffold
/// package.
class MDWindow {
  static MDWindowEnum getLayout(BuildContext context) {
    if (isCompact(context)) {
      return MDWindowEnum.compact;
    } else if (isMedium(context)) {
      return MDWindowEnum.medium;
    } else if (isExtended(context)) {
      return MDWindowEnum.expanded;
    } else {
      throw Exception('Bad condition!');
    }
  }

  /// Determines if the screen is in the compact layout.
  ///
  /// Returns `true` if the screen width is less than 600 pixels, `false` otherwise.
  static bool isCompact(BuildContext context) {
    return MediaQuery.of(context).size.width < 600 ? true : false;
  }

  /// Determines if the screen is in the medium layout.
  ///
  /// Returns `true` if the screen width is between 600 and 840 pixels, `false` otherwise.
  static bool isMedium(BuildContext context) {
    final mediaQuery = MediaQuery.of(context).size;
    // do not need to state ? true: false at end as it equate true via logical and if both
    // are true and false if one of the conditions is false
    return mediaQuery.width >= 600 && mediaQuery.width < 840;
  }

  /// Determines if the screen is in the extended layout.
  ///
  /// Returns `true` if the screen width is greater than 840 pixels, `false` otherwise.
  static bool isExtended(BuildContext context) {
    return MediaQuery.of(context).size.width >= 840 ? true : false;
  }
}

enum MDWindowEnum {
  /// The compact layout, for screens with width less than 600 pixels.
  compact(0, 600),

  /// The medium layout, for screens with width between 600 and 840 pixels.
  medium(600, 840),

  /// The extended layout, for screens with width greater than 840 pixels.
  expanded(840, double.infinity);
 
  /// The beginning of the range of screen widths for this layout.
  final double? begin;

  /// The end of the range of screen widths for this layout.
  final double? end;

  /// Creates a new [MDWindowEnum] with the given [begin] and [end] values.
  const MDWindowEnum(this.begin, this.end);
}
