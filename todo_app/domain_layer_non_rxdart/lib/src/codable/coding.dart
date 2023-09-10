// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modified from conduit_codable 
// BSD 2-Clause License
// Copyright (c) 2018, stable/kernel
// see https://github.com/conduit-dart/codable



import 'package:domain_layer_non_rxdart/src/codable/cast.dart' as cast;
import 'package:domain_layer_non_rxdart/src/codable/keyed_archive.dart';
import 'package:flutter/foundation.dart';

/// A base class for encodable and decodable objects.
///
/// Types that can read or write their values to a document should extend this abstract class.
/// By overriding [decode] and [encode], an instance of this type will read or write its values
/// into a data container that can be transferred into formats like JSON or YAML.
abstract class Coding {
  Uri? referenceURI;
  Map<String, cast.Cast<dynamic>>? get castMap => null;

  @mustCallSuper
  void decode(KeyedArchive object) {
    referenceURI = object.referenceURI;
    object.castValues(castMap);
  }

  // would prefer to write referenceURI to object here, but see note in KeyedArchive._encodedObject
  void encode(KeyedArchive object);
}
