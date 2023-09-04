import 'package:catcher/catcher.dart';
import 'package:todoapp_vanilla/catcher_report_modes.dart';

import 'package:todoapp_vanilla/custom_catcher_logger.dart';

CatcherOptions debugOptions = CatcherOptions(pageReportMode, [
    ConsoleHandler(),
  ],
  logger: CustomCatcherLogger(),


);
  CatcherOptions releaseOptions = CatcherOptions(pageReportMode, [
    EmailManualHandler(["recipient@email.com"]),
  ],);
