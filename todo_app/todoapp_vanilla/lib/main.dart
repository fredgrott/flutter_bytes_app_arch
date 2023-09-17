// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:catcher/core/catcher.dart';
import 'package:domain_layer_non_rxdart/domain_layer_non_rxdart.dart';
import 'package:flutter/material.dart';
import 'package:todoapp_vanilla/infrastructure/catcher/catcher_navigator_key.dart';
import 'package:todoapp_vanilla/infrastructure/catcher/catcher_options.dart';

import 'package:todoapp_vanilla/my_app.dart';
import 'package:todoapp_vanilla/services/app_services.dart';
import 'package:todoapp_vanilla/services/services_provider.dart';


// Flutter 3.3 and beyond we no longer use runGuardedZone
// Note, there is a move in framework code to
// supply app initialization callbacks which has not
// yet made it to beta and stable see
// https://github.com/flutter/flutter/issues/64288
// Note, that riverpod and provider differ in
// how one loads the services before the Catcher
//  rootWidget MyApp call.
//
// Specifically in Flutter 3.3 custom Zones is no
// longer used as it slowed down app load time and thus
// moved to PlatformDispatcher.onError callback which
// is used in the new Catcher code.

// Theme Persistance Notes:
// if using hive would be:
// ```dart
// class HiveStorage extends SDKThemeStorage {
//  final box = Hive.box<String>(_boxName);
//  final key = 'theme';
//  @override
//  Future<void> delete() async {
//    await box.clear();
//  }
//
//  @override
//  SDLThemeState? read() {
//    final res = box.get(key);
//    if (res == null) return null;
//    return SDKThemeState.fromJson(res);
//  }
//
//  @override
//  Future<void> write(SDKThemeState state) async {
//    await box.put(key, state.toJson());
//  }
//}
//
// ```




Future<void> main() async {
  // then include hive init in AppServices
  final myServices = await AppServices.initialize();

  Catcher(
    runAppFunction: () {
      runApp(
        ServicesProvider(
          services: myServices,
          child: MyApp(catcherNavigatorKey),
        ),
      );
    },
    debugConfig: debugOptions,
    releaseConfig: releaseOptions,
    navigatorKey: catcherNavigatorKey,
  );
}
