// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// ignore_for_file: avoid_classes_with_only_static_members, avoid_bool_literals_in_conditional_expressions

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Using Theme.of to detect platforms allow
/// simulating guest OS when testing. Usage is
///  in implementing the app scaffold and custom
/// widgets.
///
/// While The Platform Adaptations page of flutter docs covers
/// platform adaptations it still has stuff incorrect in that
/// one needs to use Theme.of to grab platform for the simulating
/// platform during testing to work. See
/// https://docs.flutter.dev/platform-integration/platform-adaptations
/// 
/// Note the automatic platform adaptations by constructor are:
///    Switch.adaptive()
///    Slider.adaptive()
///    CircularProgressIndicator.adaptive()
///    Checkbox.adaptive()
///    Radio.adaptive()
/// 
///  Other than the other adaptations in this subfolder such as the 
///  CanonicalScaffold, the Appbar should be:
/// 
/// ```dart
/// AppBar(
///        surfaceTintColor: RunningPlatform.isIOS(context) || RunningPlatform.isMacOS(context) ? Colors.transparent : null,
///        shadowColor: RunningPlatform.isIOS(context) || RunningPlatform.isMacOS(context) ? CupertinoColors.darkBackgroundGray : null,
///        scrolledUnderElevation: RunniingPlatform.isIOS(context) || RunnningPlatform.isMacOS(context) ? .1 : null,
///        toolbarHeight: RunningPlatform.isIOS(context) || RunningPlatform.isMacOS(context) ? 44 : null,
///        ...
///      ),
/// ```
///
/// @author Fredrick Allan Grott
class RunningPlatform {
  static TargetPlatform current(BuildContext context) => TargetPlatform.values[Theme.of(context).platform.index];

  static bool get isWeb => kIsWeb;

  static bool isIOS(BuildContext context) {
    if (isWeb) return false;
    return Theme.of(context).platform == TargetPlatform.iOS;
  }

  static bool isAndroid(BuildContext context) {
    if (isWeb) return false;
    return Theme.of(context).platform == TargetPlatform.android;
  }

  static bool isFuchsia(BuildContext context) {
    if (isWeb) return false;
    return Theme.of(context).platform == TargetPlatform.fuchsia;
  }

  static bool isMobile(BuildContext context) {
    if (isWeb) return false;
    final platform = Theme.of(context).platform;
    return (platform == TargetPlatform.iOS || platform == TargetPlatform.android || platform == TargetPlatform.fuchsia)
        ? true
        : false;
  }

  static bool isWindows(BuildContext context) {
    if (isWeb) return false;
    return Theme.of(context).platform == TargetPlatform.windows;
  }

  static bool isLinux(BuildContext context) {
    if (isWeb) return false;
    return Theme.of(context).platform == TargetPlatform.linux;
  }

  static bool isMacOS(BuildContext context) {
    if (isWeb) return false;
    return Theme.of(context).platform == TargetPlatform.macOS;
  }

  static bool isDesktop(BuildContext context) {
    if (isWeb) return true;
    final platform = Theme.of(context).platform;
    return (platform == TargetPlatform.macOS || platform == TargetPlatform.windows || platform == TargetPlatform.linux)
        ? true
        : false;
  }
}
