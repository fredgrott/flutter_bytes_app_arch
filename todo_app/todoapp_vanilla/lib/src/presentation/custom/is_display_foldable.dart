// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.




import 'package:dual_screen/dual_screen.dart';
import 'package:flutter/material.dart';

/// Returns a boolean value whether the display has a hinge that splits the
/// screen into two, left and right sub-screens. Horizontal splits (top and
/// bottom sub-screens) are ignored for this application.
bool isDisplayFoldable(BuildContext context) {
  final hinge = MediaQuery.of(context).hinge;
  if (hinge == null) {
    return false;
  } else {
    // Vertical
    return hinge.bounds.size.aspectRatio < 1;
  }
}
