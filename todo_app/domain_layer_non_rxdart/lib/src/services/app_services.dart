// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:domain_layer_non_rxdart/src/services/asset_image_loading_service.dart';
import 'package:domain_layer_non_rxdart/src/services/logging_appenders_service.dart';
import 'package:domain_layer_non_rxdart/src/services/services_provider.dart';
import 'package:flutter/material.dart';


class AppServices {
  final LoggingAppendersService loggingAppendersService;
  final AssetImageLoadingService assetImageLoadingService;
  
  AppServices(this.loggingAppendersService, this.assetImageLoadingService, );

  static Future<AppServices> initialize() async {
    
    final loggingAppendersService = LoggingAppendersService();
    await loggingAppendersService.initialize();

    // service that depends on other services
    final assetImageLoadingService = AssetImageLoadingService();
    await assetImageLoadingService.initialize();

     
    return AppServices(loggingAppendersService, assetImageLoadingService);
  }

  static AppServices of(BuildContext context) {
    // A bit different from a normal inherited widget. Widgets can call this from initState,
    // and it is assumed that the services never change during the lifetime of the app
    final provider = context.getElementForInheritedWidgetOfExactType<ServicesProvider>()!.widget as ServicesProvider;
    return provider.services;
  }
}
