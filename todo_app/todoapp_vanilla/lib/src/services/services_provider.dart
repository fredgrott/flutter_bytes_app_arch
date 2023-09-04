
// To assist organize stuff as the change 
// to runApp to have callback initializations
// exposed is not in beta or stable yet
import 'package:flutter/material.dart';
import 'package:todoapp_vanilla/src/services/app_services.dart';

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
