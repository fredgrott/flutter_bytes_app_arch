// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.



import 'package:catcher/catcher.dart';
import 'package:todoapp_vanilla/infrastructure/catcher/catcher_report_modes.dart';
import 'package:todoapp_vanilla/infrastructure/catcher/custom_catcher_logger.dart';



CatcherOptions debugOptions = CatcherOptions(pageReportMode, [
    ConsoleHandler(),
  ],
  logger: CustomCatcherLogger(),


);
  CatcherOptions releaseOptions = CatcherOptions(pageReportMode, [
    EmailManualHandler(["recipient@email.com"]),
  ],);
