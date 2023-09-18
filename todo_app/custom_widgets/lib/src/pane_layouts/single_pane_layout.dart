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
import 'package:custom_widgets/src/pane_layouts/layout_utils.dart';
import 'package:flutter/material.dart';


/// A layout that displays a single pane on the screen.
class SinglePaneLayout extends StatelessWidget with LayoutUtils, BaseLayout {
  /// The child widget to display within this layout.
  final Widget child;

  /// The amount of vertical padding to apply to the layout.
  final double verticalPadding;

  SinglePaneLayout({
    super.key,
    this.verticalPadding = 0,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final layout = MDWindow.getLayout(context);
    if (layout == MDWindowEnum.compact) {
      return Container(
        width: double.infinity,
        height: double.infinity,
        margin: layoutSpacing(verticalPadding, context),
        child: child,
      );
    }
    return Material(
      color: theme.colorScheme.surface,
      surfaceTintColor: theme.colorScheme.surfaceTint,
      shadowColor: Colors.transparent,
      elevation: 2,
      child: Container(
        margin: layoutSpacing(verticalPadding, context),
        width: double.infinity,
        height: double.infinity,
        child: child,
      ),
    );
  }
}
