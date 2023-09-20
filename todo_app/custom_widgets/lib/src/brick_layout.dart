


import 'package:flutter/material.dart';

class BrickLayout extends StatelessWidget {
  const BrickLayout({
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
            delegate: BrickLayoutDelegate(
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

class BrickLayoutDelegate extends MultiChildLayoutDelegate {
  BrickLayoutDelegate({
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
  bool shouldRelayout(BrickLayoutDelegate oldDelegate) {
    return itemPadding != oldDelegate.itemPadding ||
        columnSpacing != oldDelegate.columnSpacing;
  }
}
