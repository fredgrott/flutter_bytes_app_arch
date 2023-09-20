// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Originally part of the Flutter Adaptive Scaffold package
// Copyright 2013 by The Flutter Authors 
// and under BSD-clasue-3 License



import 'package:custom_widgets/src/app_custom_breakpoints.dart';
import 'package:custom_widgets/src/brick_layout.dart';

import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

/// Public helper method to be used for creating a staggered grid following m3
/// specs from a list of [Widget]s
Builder toMaterialGrid({
  List<Widget> thisWidgets = const <Widget>[],
  List<Breakpoint> breakpoints = const <Breakpoint>[
    AppCustomBreakpoints.small,
    AppCustomBreakpoints.medium,
    AppCustomBreakpoints.large,
    AppCustomBreakpoints.gigantic,
  ],
  double margin = 8,
  int itemColumns = 1,
  required BuildContext context,
}) {
  return Builder(builder: (BuildContext context) {
    Breakpoint? currentBreakpoint;
    for (final Breakpoint breakpoint in breakpoints) {
      if (breakpoint.isActive(context)) {
        currentBreakpoint = breakpoint;
      }
    }
    double? thisMargin = margin;

    if (currentBreakpoint == AppCustomBreakpoints.small) {
      if (thisMargin < kMaterialCompactMinMargin) {
        thisMargin = kMaterialCompactMinMargin;
      }
    } else if (currentBreakpoint == AppCustomBreakpoints.medium) {
      if (thisMargin < kMaterialMediumMinMargin) {
        thisMargin = kMaterialMediumMinMargin;
      }
    } else if (currentBreakpoint == AppCustomBreakpoints.large) {
      if (thisMargin < kMaterialExpandedMinMargin) {
        thisMargin = kMaterialExpandedMinMargin;
      }
    } else if (currentBreakpoint == AppCustomBreakpoints.gigantic){
      // TODO: temp is the same as expanded margin size?
      if (thisMargin < kMaterialExpandedMinMargin) {
          thisMargin = kMaterialExpandedMinMargin;
        }
    }
    return CustomScrollView(
      primary: false,
      controller: ScrollController(),
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.all(thisMargin),
            child: BrickLayout(
              columns: itemColumns,
              columnSpacing: kMaterialGutterValue,
              itemPadding: const EdgeInsets.only(bottom: kMaterialGutterValue),
              children: thisWidgets,
            ),
          ),
        ),
      ],
    );
  },);
}
