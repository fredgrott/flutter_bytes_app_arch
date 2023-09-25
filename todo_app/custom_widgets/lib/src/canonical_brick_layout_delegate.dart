// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Borrowed from the Flutter Adaptive Scaffold package
// Copyright 2013 The Flutter Authors. All rights reserved.
// Under BSD-clause-3 License


import 'package:flutter/material.dart';

class CanonicalBrickLayoutDelegate extends MultiChildLayoutDelegate {
  CanonicalBrickLayoutDelegate({
    this.columns = 1,
    this.columnSpacing = 0,
    this.itemPadding = EdgeInsets.zero,
  });

  final int columns;
  final EdgeInsetsGeometry itemPadding;
  final double columnSpacing;

  @override
  void performLayout(Size size) {
    final BoxConstraints looseConstraints = BoxConstraints.loose(size);
    final BoxConstraints fullWidthConstraints =
        looseConstraints.tighten(width: size.width);

    final List<Size> childSizes = <Size>[];
    int childCount = 0;
    // Count how many children we have.
    for (; hasChild(childCount); childCount += 1) {}
    final BoxConstraints itemConstraints = BoxConstraints(
      maxWidth: fullWidthConstraints.maxWidth / columns -
          columnSpacing / 2 -
          itemPadding.horizontal,
    );

    for (int i = 0; i < childCount; i += 1) {
      childSizes.add(layoutChild(i, itemConstraints));
    }

    int columnIndex = 0;
    int childId = 0;
    final double totalColumnSpacing = columnSpacing * (columns - 1);
    final double columnWidth = (size.width - totalColumnSpacing) / columns;
    final double topPadding = itemPadding.resolve(TextDirection.ltr).top;
    final List<double> columnUsage =
        List<double>.generate(columns, (int index) => topPadding);
    for (final Size childSize in childSizes) {
      positionChild(
        childId,
        Offset(
          columnSpacing * columnIndex +
              columnWidth * columnIndex +
              (columnWidth - childSize.width) / 2,
          columnUsage[columnIndex],
        ),
      );
      columnUsage[columnIndex] += childSize.height + itemPadding.vertical;
      columnIndex = (columnIndex + 1) % columns;
      childId += 1;
    }
  }

  @override
  bool shouldRelayout(CanonicalBrickLayoutDelegate oldDelegate) {
    return itemPadding != oldDelegate.itemPadding ||
        columnSpacing != oldDelegate.columnSpacing;
  }
}
