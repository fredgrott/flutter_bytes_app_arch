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
