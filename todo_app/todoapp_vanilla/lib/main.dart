import 'package:catcher/core/catcher.dart';
import 'package:flutter/material.dart';
import 'package:todoapp_vanilla/catcher_navigator_key.dart';
import 'package:todoapp_vanilla/catcher_options.dart';
import 'package:todoapp_vanilla/my_app.dart';
import 'package:todoapp_vanilla/src/services/app_services.dart';
import 'package:todoapp_vanilla/src/services/services_provider.dart';


// Flutter 3.3 and beyond we no longer use runGuardedZone
// Note, there is a move in framework code to 
// supply app initialization callbacks which has not
// yet made it to beta and stable see
// https://github.com/flutter/flutter/issues/64288
// Note, that riverpod and provider differ in
// how one loads the services before the Catcher
//  rootWidget MyApp call.
Future<void> main() async {

  final myServices = await AppServices.initialize();
  

Catcher(
    runAppFunction: () {
      runApp(ServicesProvider(
        services: myServices,
        child: MyApp(catcherNavigatorKey),
       ),);
    },
    debugConfig: debugOptions,
    releaseConfig: releaseOptions,
    navigatorKey: catcherNavigatorKey,
  );
}
