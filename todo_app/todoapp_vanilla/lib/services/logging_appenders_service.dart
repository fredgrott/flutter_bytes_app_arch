// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// ignore_for_file: empty_constructor_bodies


import 'package:todoapp_vanilla/services/init_logging.dart';
import 'package:todoapp_vanilla/services/set_up_appenders.dart';

class LoggingAppendersService {
  LoggingAppendersService() {}

  Future<void> initialize() async {
    // initialize logging
    initLogging();

    // initialize the logging appenders
    setUpAppenders();
  }
}
