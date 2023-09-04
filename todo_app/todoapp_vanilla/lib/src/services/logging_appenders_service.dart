// ignore_for_file: empty_constructor_bodies

import 'package:domain_layer_non_rxdart/domain_layer_non_rxdart.dart';

class LoggingAppendersService {
  
  LoggingAppendersService() {}

  Future<void> initialize() async {
       // initialize logging
    initLogging();

    // initialize the logging appenders
    setUpAppenders();

  }

  }
  