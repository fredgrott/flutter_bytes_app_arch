// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:flutter/material.dart';

/// Gutter value between different parts of the body slot depending on
/// material 3 design spec.
const double customKMaterialGutterValue = 8;

/// Margin value of the compact breakpoint layout according to the material
/// design 3 spec.
const double compactMargin = 8;

/// Margin value of the medium breakpoint layout according to the material
/// design 3 spec.
const double mediumMargin = 12;

//// Margin value of the expanded breakpoint layout according to the material
/// design 3 spec.
const double expandedMargin = 32;

/// My best guess
const double giganticMargin = 48;

/// twoPaneBreakpoint for TwoPane and
/// Canonical widgets
const double twoPaneBreakpoint = 841;

/// Microsoft's [Dual Screen] package does not account
/// for the left and right margins on Canonical Panes.
/// Hence these two class.
///
/// These two classes surround the Canonical Panes with
/// a container and the appropriate margin padding
/// per secreen breakpoint.
///
/// An examplpe:
/// ```
/// Widget build(BuildContext context) {
///  return TwoPane(
///    startPane: CanonicalPaneWrapper(child:PaneA()),
///    endPane: CanonicalPaneWrapper(child:PaneB()),
///    paneProportion: 0.5,
///    panePriority: MediaQuery.of(context).size.width > twoPaneBreakpoints ? TwoPanePriority.both :TwoPanePriority.pane1,
///  );
///}
/// ```
///
/// @author Fredrick Allan Grott
class CanonicalPaneWrapper extends StatelessWidget {
  final Widget child;

  const CanonicalPaneWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth < 601) {
          return Container(
            padding: const EdgeInsets.all(compactMargin),
            child: child,
          );
        } else if (constraints.maxWidth < 841) {
          return Container(
            padding: const EdgeInsets.all(mediumMargin),
            child: child,
          );
        } else if (constraints.maxWidth < 1241) {
          return Container(
            padding: const EdgeInsets.all(expandedMargin),
            child: child,
          );
        }
        return Container(
          padding: const EdgeInsets.all(giganticMargin),
          child: child,
        );
      },
    );
  }
}
