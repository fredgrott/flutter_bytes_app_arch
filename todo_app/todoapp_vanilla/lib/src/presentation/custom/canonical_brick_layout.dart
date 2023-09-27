// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Borrowed from the Flutter Adaptive Scaffold package
// Copyright 2013 The Flutter Authors. All rights reserved.
// Under BSD-clause-3 License




import 'package:flutter/material.dart';
import 'package:todoapp_vanilla/src/presentation/custom/canonical_brick_layout_delegate.dart';

class CanonicalBrickLayout extends StatelessWidget {
  const CanonicalBrickLayout({
    this.columns = 1,
    this.itemPadding = EdgeInsets.zero,
    this.columnSpacing = 0,
    required this.children,
  });

  final int columns;
  final double columnSpacing;
  final EdgeInsetsGeometry itemPadding;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    int i = -1;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Expanded(
          child: CustomMultiChildLayout(
            delegate: CanonicalBrickLayoutDelegate(
              columns: columns,
              columnSpacing: columnSpacing,
              itemPadding: itemPadding,
            ),
            children: children
                .map<Widget>(
                  (Widget child) => LayoutId(id: i += 1, child: child),
                )
                .toList(),
          ),
        ),
      ],
    );
  }
}
