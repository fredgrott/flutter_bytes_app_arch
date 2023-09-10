// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'dart:developer' as developer;

import 'package:logging/logging.dart';

// app logger for the app
// so that we can do things like
// ```
//    appLogger.i("my log message");
// ```
//
// lazy set as first reference will call it.
final appLogger = Logger("ToDoApp");

void initLogging() {
  // disable hierarchical logger
  hierarchicalLoggingEnabled = false;
  // change to another level as needed.
  Logger.root.level = Level.INFO;
  // skip logging stactrace below the SEVERE level.
  recordStackTraceAtLevel = Level.SEVERE;
  assert(() {
    recordStackTraceAtLevel = Level.WARNING;
    // print all logs on debug build.
    Logger.root.level = Level.ALL;
    return true;
  }());
  Logger.root.onRecord.listen((event) {
    developer.log(
      event.message,
      time: event.time,
      sequenceNumber: event.sequenceNumber,
      level: event.level.value,
      name: event.loggerName,
      zone: event.zone,
      error: event.error,
      stackTrace: event.stackTrace,
    );
  });
}
