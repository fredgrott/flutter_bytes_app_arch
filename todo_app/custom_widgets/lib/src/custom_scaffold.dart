// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.



import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';

/// Google over engineered Adaptive Scaffold in
/// that with Navigation API 2.0 one should route
/// the screen widget through the body slot and 
/// screen layout wrapper then handles morphing 
/// from small mobile to fold open and to the 
/// other screen breakpoints where morph to 
/// two pane or split pane depending upon the Layout Pane
/// type enum.
///
/// @author Fredrick Allan Grott
Widget customScaffold(List<NavigationDestination> navs, Widget bodyChild) {

  return AdaptiveScaffold(
    destinations: navs,
    bodyRatio: 1.0,
    smallBody: (_) => bodyChild,
    body: (_) => bodyChild,
    largeBody: (_) => bodyChild,
    smallSecondaryBody: AdaptiveScaffold.emptyBuilder,
    secondaryBody: AdaptiveScaffold.emptyBuilder,
    largeSecondaryBody: AdaptiveScaffold.emptyBuilder,
  );
}
