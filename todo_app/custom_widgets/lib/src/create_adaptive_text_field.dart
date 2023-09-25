// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:custom_widgets/src/running_platform.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// An adaptive text field
Widget createAdaptiveTextField(BuildContext context) {
  const border = OutlineInputBorder(
    borderSide: BorderSide(color: CupertinoColors.lightBackgroundGray),
  );

  const iOSDecoration = InputDecoration(
    border: border,
    enabledBorder: border,
    focusedBorder: border,
    filled: true,
    fillColor: CupertinoColors.white,
    hoverColor: CupertinoColors.white,
    contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
  );

  return RunningPlatform.isIOS(context) || RunningPlatform.isMacOS(context)
      ? const SizedBox(
          height: 36.0,
          child: TextField(
            decoration: iOSDecoration,
          ),
        )
      : const TextField();
}
