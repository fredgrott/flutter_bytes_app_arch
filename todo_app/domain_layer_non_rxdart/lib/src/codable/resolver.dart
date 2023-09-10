// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modified from conduit_codable 
// BSD 2-Clause License
// Copyright (c) 2018, stable/kernel
// see https://github.com/conduit-dart/codable


import 'package:domain_layer_non_rxdart/src/codable/keyed_archive.dart';

class ReferenceResolver {
  ReferenceResolver(this.document);

  final KeyedArchive document;

  /// resolves a reference of the form '#/yyy/xxx'
  /// To the value stored in a document
  ///
  /// e.g.
  /// if [ref] == '#/definitions/child' then we would
  /// return a [KeyedArchive] with the child named Sally.
  ///
  /// ```
  /// {
  ///   "definitions": {
  ///           "child": {"name": "Sally"}
  ///   },
  ///   "root": {
  ///       "name": "Bob",
  ///       "child": {"\$ref": "#/definitions/child"}
  ///}
  /// ```
  KeyedArchive? resolve(Uri ref) {
    final folded = ref.pathSegments.fold<KeyedArchive?>(document,
        (KeyedArchive? objectPtr, pathSegment) {
      if (objectPtr != null) {
        return objectPtr[pathSegment] as KeyedArchive?;
      } else {
        return null;
      }
    });

    return folded;
  }
}
