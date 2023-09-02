// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:logging/logging.dart';
import 'package:logging_appenders/logging_appenders.dart';

late final BaseLogAppender appender;

// in main
// ```
//   setUpAppenders():
// ```
void setUpAppenders() {
  // to enabled 3rd party services
  // add after the call to setUpAppenders in
  // main with call logging appenders wrapper
  // to the 3rd party service
  appender = PrintAppender.setupLogging(stderrLevel: Level.SEVERE);
}
