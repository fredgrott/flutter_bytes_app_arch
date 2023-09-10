// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// To assist organize stuff as the change
// to runApp to have callback initializations
// exposed is not in beta or stable yet
import 'package:domain_layer_non_rxdart/src/services/app_services.dart';
import 'package:flutter/material.dart';



class ServicesProvider extends InheritedWidget {
  final AppServices services;

  const ServicesProvider({super.key, required this.services, required super.child});

  @override
  bool updateShouldNotify(ServicesProvider old) {
    if (services != old.services) {
      throw Exception('Services must be constant!');
    }
    return false;
  }
}
