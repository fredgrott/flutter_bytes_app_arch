// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


// ignore_for_file: empty_constructor_bodies

import 'package:flutter/services.dart';

class LoadingFontService {
  LoadingFontService() {}

  Future<void> initialize() async {
    // I am not updated on the recent AssetManifest API that recently
    // was added in the Flutter stable channel and so doing it
    // this way instead.
    //
    // Since we are not using GoogleFonts as it is not
    // fully support variable fonts yet we have to manually
    // load fonts into the cache
    final fontDataOne = await rootBundle.load(
      'assets/google_fonts/RobotoFlex-VariableFont_GRAD,XTRA,YOPQ,YTAS,YTDE,YTFI,YTLC,YTUC,opsz,slnt,wdth,wght.ttf',
    );
    final fontLoaderOne = FontLoader('RobotoFlex');
    fontLoaderOne.addFont(fontDataOne as Future<ByteData>);
    await fontLoaderOne.load();

    final fontDataTwo =
        await rootBundle.load('assets/google_fonts/RobotoSerif-Italic-VariableFont_GRAD,opsz,wdth,wght.ttf');
    final fontLoaderTwo = FontLoader('RobotoSerif-Italian');
    fontLoaderTwo.addFont(fontDataTwo as Future<ByteData>);
    await fontLoaderTwo.load();

    final fontDataThree =
        await rootBundle.load('assets/google_fonts/RobotoSerif-VariableFont_GRAD,opsz,wdth,wght.ttf');
    final fontLoaderThree = FontLoader('RobotoSerif');
    fontLoaderThree.addFont(fontDataThree as Future<ByteData>);
    await fontLoaderThree.load();

    final fontDataFour = await rootBundle.load('assets/google_fonts/RobotoSlab-VariableFont_wght.ttf');
    final fontLoaderFour = FontLoader('RobotoSlab');
    fontLoaderFour.addFont(fontDataFour as Future<ByteData>);
    await fontLoaderThree.load();
  }
}
