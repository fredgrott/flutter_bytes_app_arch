// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

class DialogRouteFold<T> extends PopupRoute<T> {
  Widget child;
  DialogRouteFold({
    required this.child,
  });

  @override
  Widget buildPage(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
    return DisplayFeatureSubScreen(
      anchorPoint: Offset.infinite,
      child: child,
    );
  }

  @override
  Color? get barrierColor => Theme.of(navigator!.context).colorScheme.background;

  @override
  bool get barrierDismissible => true;

  @override
  String? get barrierLabel => "dismiss";

  @override
  Duration get transitionDuration => Durations.long1;
}
