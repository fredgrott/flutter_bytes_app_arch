// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:custom_widgets/src/running_platform.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// A show adaptive dialog that is platform adaptive compliant.
/// Note that Flutter Docs is still wrong, we need to use the 
/// [RunningPlatform] class methods to make sure we access platform
/// via Theme.of to ensure we still can test simulate platforms.
void showAdaptiveDialog(
  BuildContext context, {
  required Text title,
  required Text content,
  required List<Widget> actions,
}) {
  RunningPlatform.isIOS(context) || RunningPlatform.isMacOS(context)
      ? showCupertinoDialog<String>(
          context: context,
          builder: (BuildContext context) => CupertinoAlertDialog(
            title: title,
            content: content,
            actions: actions,
          ),
        )
      : showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: title,
            content: content,
            actions: actions,
          ),
        );
}
