// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.



import 'package:dual_screen/dual_screen.dart';
import 'package:flutter/material.dart';

/// Route that auto-removes itself if the app spanned horizontally.
class SingleScreenExclusiveRoute<T> extends MaterialPageRoute<T> {
  SingleScreenExclusiveRoute({
    required super.builder,
  });

  @override
  Widget buildContent(BuildContext context) {
    if (MediaQuery.of(context).hinge?.bounds.top == 0.0) {
      navigator?.removeRoute(this);
    }
    return super.buildContent(context);
  }
}
