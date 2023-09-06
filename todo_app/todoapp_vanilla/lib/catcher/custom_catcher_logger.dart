// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:developer';

import 'package:catcher/catcher.dart';

class CustomCatcherLogger extends CatcherLogger {
  @override
  void info(String message) {
    log("Custom Catcher Logger | Info | $message");
  }

  @override
  void fine(String message) {
    log("Custom Catcher Logger | Fine | $message");
  }

  @override
  void warning(String message) {
    log("Custom Catcher Logger | Warning | $message");
  }

  @override
  void severe(String message) {
    log("Custom Catcher Logger | Servere | $message");
  }
}
