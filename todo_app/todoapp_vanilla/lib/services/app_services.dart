// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todoapp_vanilla/services/asseet_image_loading_service.dart';
import 'package:todoapp_vanilla/services/logging_appenders_service.dart';
import 'package:todoapp_vanilla/services/services_provider.dart';

class AppServices {
  final SharedPreferences sharedPrefs;
  final LoggingAppendersService loggingAppendersService;
  final AssetImageLoadingService assetImageLoadingService;

  AppServices(this.sharedPrefs, this.loggingAppendersService, this.assetImageLoadingService);

  static Future<AppServices> initialize() async {
    final sharedPrefs = await SharedPreferences.getInstance();

    final loggingAppendersService = LoggingAppendersService();
    await loggingAppendersService.initialize();

    // service that depends on other services
    final assetImageLoadingService = AssetImageLoadingService();
    await assetImageLoadingService.initialize();

    return AppServices(sharedPrefs, loggingAppendersService, assetImageLoadingService);
  }

  static AppServices of(BuildContext context) {
    // A bit different from a normal inherited widget. Widgets can call this from initState,
    // and it is assumed that the services never change during the lifetime of the app
    final provider = context.getElementForInheritedWidgetOfExactType<ServicesProvider>()!.widget as ServicesProvider;
    return provider.services;
  }
}
