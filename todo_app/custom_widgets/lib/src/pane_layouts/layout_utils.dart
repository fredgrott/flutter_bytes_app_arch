// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Originally part of Material3 Layout package
// Copyright 2023 Egor Taqbula
// BSD-clause-3 license.
// see https://github.com/egortabula/material3_layout

import 'package:custom_widgets/src/md_window.dart';
import 'package:flutter/material.dart';


mixin LayoutUtils {
  /// Horizontal margin for compact layout
  double get compactLayoutMargin => 16.0;

  /// Horizontal margin for medium layout
  double get mediumLayoutMargin => 24.0;

  /// Horizontal margin for extended layout
  double get exdendedLayoutMargin => 24.0;

  /// Spacing between panes
  double get paneSpacing => 24.0;

  /// Returns the EdgeInsetsGeometry for the given vertical and horizontal padding based on the current breakpoint.
  ///
  /// Throws an UnimplementedError if the current breakpoint is not supported.
  EdgeInsetsGeometry layoutSpacing(double verticalPadding, BuildContext context) {
    if (MDWindow.isCompact(context)) {
      return EdgeInsets.symmetric(
        horizontal: compactLayoutMargin,
        vertical: verticalPadding,
      );
    } else if (MDWindow.isMedium(context)) {
      return EdgeInsets.symmetric(
        horizontal: mediumLayoutMargin,
        vertical: verticalPadding,
      );
    } else if (MDWindow.isExtended(context)) {
      return EdgeInsets.symmetric(
        horizontal: exdendedLayoutMargin,
        vertical: verticalPadding,
      );
    } else {
      throw UnimplementedError('Bad breakpoint');
    }
  }
}
