// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:flutter/material.dart';
import 'package:flutter_adaptive_scaffold/flutter_adaptive_scaffold.dart';
import 'package:todoapp_vanilla/src/presentation/custom/window_breakpoints.dart';

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

/// A group of standard breakpoints built according to the material
/// specifications for screen width size.
///
/// See also:
///
///  * [AdaptiveScaffold], which uses some of these Breakpoints as defaults.
class AppBreakpoints {
  /// This is a standard breakpoint that can be used as a fallthrough in the
  /// case that no other breakpoint is active.
  ///
  /// It is active from a width of -1 dp to infinity.
  static const Breakpoint standard = WidthPlatformBreakpoint(begin: -1);

  /// A window whose width is less than 600 dp and greater than 0 dp.
  static const Breakpoint small = WidthPlatformBreakpoint(begin: compactBegin, end: mediumBegin);

  /// A window whose width is greater than 0 dp.
  static const Breakpoint smallAndUp = WidthPlatformBreakpoint(begin: 0);

  /// A desktop screen whose width is less than 600 dp and greater than 0 dp.
  static const Breakpoint smallDesktop =
      WidthPlatformBreakpoint(begin: compactBegin, end: mediumBegin, platform: desktop);

  /// A mobile screen whose width is less than 600 dp and greater than 0 dp.
  static const Breakpoint smallMobile =
      WidthPlatformBreakpoint(begin: compactBegin, end: mediumBegin, platform: mobile);

  /// A window whose width is between 600 dp and 840 dp.
  static const Breakpoint medium = WidthPlatformBreakpoint(begin: mediumBegin, end: expandedBegin);

  /// A window whose width is greater than 600 dp.
  static const Breakpoint mediumAndUp = WidthPlatformBreakpoint(begin: mediumBegin);

  /// A desktop window whose width is between 600 dp and 840 dp.
  static const Breakpoint mediumDesktop =
      WidthPlatformBreakpoint(begin: mediumBegin, end: expandedBegin, platform: desktop);

  /// A mobile window whose width is between 600 dp and 840 dp.
  static const Breakpoint mediumMobile =
      WidthPlatformBreakpoint(begin: mediumBegin, end: expandedBegin, platform: mobile);

  /// A window whose width is greater than 840 dp.
  static const Breakpoint large = WidthPlatformBreakpoint(begin: expandedBegin, end: giganticBegin);

  /// A desktop window whose width is greater than 840 dp.
  static const Breakpoint largeDesktop =
      WidthPlatformBreakpoint(begin: expandedBegin, end: giganticBegin, platform: desktop);

  /// A mobile window whose width is greater than 840 dp.
  static const Breakpoint largeMobile =
      WidthPlatformBreakpoint(begin: expandedBegin, end: giganticBegin, platform: mobile);

  /// Window greater than 1240dp
  static const Breakpoint gigantic = WidthPlatformBreakpoint(begin: giganticBegin);

  /// A desktop window greater than 1240dp
  static const Breakpoint giganticDesktop = WidthPlatformBreakpoint(begin: giganticBegin, platform: desktop);

  /// A mobile window greater than 1240dp
  /// i.e. both AndroidTV and iOSTV
  static const Breakpoint giganticMobile = WidthPlatformBreakpoint(begin: giganticBegin, platform: mobile);
}
