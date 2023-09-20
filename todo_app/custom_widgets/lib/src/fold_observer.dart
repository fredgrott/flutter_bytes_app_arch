// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.



import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Global so that we know when we have
/// displayable second foldable screen as we can only
/// use a non-null in our if logic inside the smallSecondBody
/// and secondBody of the Flutter Adaptive Scaffold package.
///
/// @author Fredrick Allan Grott
bool unfolding = false;

/// Current MediaQuery does not track when device unfolds
/// see
/// https://github.com/flutter/flutter/issues/124876
///
/// To use stick in the nav observers slot of MaterialApp
/// ```dart
///  runApp(MaterialApp(
///    home: Container(),
///    navigatorObservers: [FoldObserver],
///  ));
/// ```
/// And in the builders of Adaptive Layout of the
/// Flutter Adaptive Scaffold package:
/// ```dart
///  builder: (_) {
///      if (unfolding){
///           return ActualSecondScreen();
///      } else {
///        return AdaptiveScaffold.emptyBuilder;
///   }
/// ```
///
/// Note: The Flutter Adaptive Scaffold adaptive layout
/// demo is wrong as you have to wrap it in a scaffold putting
/// your custom layout in the body slot. In my own code bases
/// I generally repeat the adaptive scaffold impl in the
/// Flutter Adaptive Scaffold package with my own modifications.
///
/// @author Fredrick Allan Grott
class FoldObserver extends WidgetsBindingObserver {
  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    final view = ui.PlatformDispatcher.instance.implicitView!;
    final logicalSize = view.physicalSize / view.devicePixelRatio;

    // Make sure app doesn't get letterboxed.
    if (!unfolding) {
      unfolding = view.displayFeatures
          .any((ui.DisplayFeature feature) => feature.state == ui.DisplayFeatureState.postureHalfOpened);
    } else {
      unfolding =
          !view.displayFeatures.any((ui.DisplayFeature feature) => feature.state == ui.DisplayFeatureState.postureFlat);
    }

    if (unfolding || logicalSize.shortestSide >= 600) {
      SystemChrome.setPreferredOrientations([]);
    } else if (logicalSize.shortestSide < 600) {
      SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    }
  }
}
