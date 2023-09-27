// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Borrowed from the Flutter Adaptive Scaffold package
// Copyright 2013 The Flutter Authors. All rights reserved.
// Under BSD-clause-3 License



import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:todoapp_vanilla/src/presentation/custom/app_breakpoints.dart';
import 'package:todoapp_vanilla/src/presentation/custom/canonical_brick_layout.dart';
import 'package:todoapp_vanilla/src/presentation/custom/canonical_scaffold.dart';

/// Public helper method to be used for creating a staggered grid following m3
/// specs from a list of [Widget]s.
/// Note, this implies that Screen needs to be a
/// a Stateful Widget.
Builder toMaterialGrid({
    List<Widget> thisWidgets = const <Widget>[],
    List<Breakpoint> breakpoints = const <Breakpoint>[
      AppBreakpoints.small,
      AppBreakpoints.medium,
      AppBreakpoints.large,
      AppBreakpoints.gigantic,
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

      if (currentBreakpoint == AppBreakpoints.small) {
        if (thisMargin < kAppMaterialCompactMinMagin) {
          thisMargin = kAppMaterialCompactMinMagin;
        }
      } else if (currentBreakpoint == AppBreakpoints.medium) {
        if (thisMargin < kAppMaterialMediumMinMargin) {
          thisMargin = kAppMaterialMediumMinMargin;
        }
      } else if (currentBreakpoint == AppBreakpoints.large) {
        if (thisMargin < kAppMaterialExpandedMinMargin) {
          thisMargin = kAppMaterialExpandedMinMargin;
        }
      } else if (currentBreakpoint == AppBreakpoints.gigantic) {
        if (thisMargin < kAppMaterialGiganticMinMargin) {
          thisMargin = kAppMaterialGiganticMinMargin;
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
              child: CanonicalBrickLayout(
                columns: itemColumns,
                columnSpacing: kMaterialGutterValue,
                itemPadding:
                    const EdgeInsets.only(bottom: kMaterialGutterValue),
                children: thisWidgets,
              ),
            ),
          ),
        ],
      );
    },);
  }
