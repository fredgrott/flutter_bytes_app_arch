// ignore_for_file: empty_constructor_bodies

import 'package:flutter/material.dart';
import 'package:todoapp_vanilla/asset_image_list.dart';

class AssetImageLoadingService {
  
  AssetImageLoadingService() {}

  Future<void> initialize() async {
    //for many initialize things including asset caching
  // needed as we do not have access to same line
  // in the runApp function as we call it before 
  // the runApp function.
  final binding = WidgetsFlutterBinding.ensureInitialized();

    // asset image caching part using Flutter Engine lifecyle 
  // frame hooks. Note, google fonts and rive have
  // their own cache loading included with those libraries.
  binding.addPostFrameCallback((_) async {
    final BuildContext context = binding.rootElement!;
    if(context != null)
      {
        for(final asset in assetImageList)
        {
          precacheImage(AssetImage(asset as String), context);
        }
      }
  });





  }

  }
