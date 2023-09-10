// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

// ignore_for_file: empty_constructor_bodies


// binary objects need to be cached
import 'package:domain_layer_non_rxdart/src/models/asset_image_list.dart';
import 'package:flutter/material.dart';

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
      if (context != null) {
        for (final asset in assetImageList) {
          precacheImage(AssetImage(asset as String), context);
        }
      }
    });
  }
}
