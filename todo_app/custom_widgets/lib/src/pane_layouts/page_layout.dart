// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Originally part of Material3 Layout package
// Copyright 2023 Egor Taqbula
// BSD-clause-3 license.
// see https://github.com/egortabula/material3_layout

import 'package:custom_widgets/src/md_window.dart';
import 'package:custom_widgets/src/pane_layouts/base_layout.dart';
import 'package:custom_widgets/src/pane_layouts/utils.dart';
import 'package:flutter/material.dart';


/// A widget that displays a different layout based on the screen size.
class PageLayout extends StatelessWidget {
  /// The layout to use when the screen size is compact.
  /// Typically `SinglePaneLayout`
  final BaseLayout compactLayout;

  /// The layout to use when the screen size is medium.
  ///
  /// Tipically `SinglePaneLayout`, but in some case `SplitPaneLayout` or `TwoPaneLayout`
  final BaseLayout? mediumLayout;

  /// The layout to use when the screen size is extended.
  ///
  /// Typically `TwoPaneLayout`. but it can be `SinglePaneLayout` or `SplitPaneLayout``
  final BaseLayout? expandedLayout;

  const PageLayout({
    super.key,
    required this.compactLayout,
    required this.mediumLayout,
    required this.expandedLayout,
  });

  @override
  Widget build(BuildContext context) {
    final layout = MDWindow.getLayout(context);

    if (layout == MDWindowEnum.compact) {
      return compactLayout;
    }
    if (layout == MDWindowEnum.medium) {
      if (isNull(mediumLayout)) {
        return compactLayout;
      }
      return mediumLayout!;
    }
    if (layout == MDWindowEnum.expanded) {
      if (isNull(expandedLayout)) {
        return mediumLayout ?? const SizedBox.shrink();
      }
      return expandedLayout!;
    }
    throw Exception("Undefined breakpoint");
  }
}
