// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';


const Set<TargetPlatform> desktop = <TargetPlatform>{
  TargetPlatform.linux,
  TargetPlatform.macOS,
  TargetPlatform.windows,
};

const Set<TargetPlatform> mobile = <TargetPlatform>{
  TargetPlatform.android,
  TargetPlatform.fuchsia,
  TargetPlatform.iOS,
};

class AppCustomBreakpoints  {


  /// This is a standard breakpoint that can be used as a fallthrough in the
  /// case that no other breakpoint is active.
  ///
  /// It is active from a width of -1 dp to infinity.
  static const Breakpoint standard = WidthPlatformBreakpoint(begin: -1);

  /// A window whose width is less than 600 dp and greater than 0 dp.
  static const Breakpoint small = WidthPlatformBreakpoint(begin: 0, end: 600);

  /// A window whose width is greater than 0 dp.
  static const Breakpoint smallAndUp = WidthPlatformBreakpoint(begin: 0);

  /// A desktop screen whose width is less than 600 dp and greater than 0 dp.
  static const Breakpoint smallDesktop = WidthPlatformBreakpoint(begin: 0, end: 600, platform: desktop);

   /// A mobile screen whose width is less than 600 dp and greater than 0 dp.
  static const Breakpoint smallMobile = WidthPlatformBreakpoint(begin: 0, end: 600, platform: mobile);

  /// A window whose width is between 600 dp and 840 dp.
  static const Breakpoint medium = WidthPlatformBreakpoint(begin: 600, end: 840);

  /// A window whose width is greater than 600 dp.
  static const Breakpoint mediumAndUp = WidthPlatformBreakpoint(begin: 600);

  /// A desktop window whose width is between 600 dp and 840 dp.
  static const Breakpoint mediumDesktop = WidthPlatformBreakpoint(begin: 600, end: 840, platform: desktop);

  /// A mobile window whose width is between 600 dp and 840 dp.
  static const Breakpoint mediumMobile = WidthPlatformBreakpoint(begin: 600, end: 840, platform: mobile);

  /// A window whose width is greater than 840 dp.
  static const Breakpoint large = WidthPlatformBreakpoint(begin: 840, end: 1240);

  /// A desktop window whose width is greater than 840 dp.
  static const Breakpoint largeDesktop = WidthPlatformBreakpoint(begin: 840, end: 1240, platform: desktop);

  /// A mobile window whose width is greater than 840 dp.
  static const Breakpoint largeMobile = WidthPlatformBreakpoint(begin: 840, end: 1240, platform: mobile);

  /// A window whose width is greater than 1240 dp.
  static const Breakpoint gigantic = WidthPlatformBreakpoint(begin: 1240,);

  /// A desktop window whose width is greater than 1240 dp.
  static const Breakpoint giganticDesktop = WidthPlatformBreakpoint(begin: 1240,  platform: desktop);

  /// A mobile window whose width is greater than 1240 dp.
  static const Breakpoint giganticMobile = WidthPlatformBreakpoint(begin: 1240,  platform: mobile);

}
