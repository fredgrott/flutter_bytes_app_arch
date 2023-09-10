// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modified from conduit_codable 
// BSD 2-Clause License
// Copyright (c) 2018, stable/kernel
// see https://github.com/conduit-dart/codable

import 'dart:collection';

import 'package:domain_layer_non_rxdart/src/codable/codable.dart';
import 'package:domain_layer_non_rxdart/src/codable/keyed_archive.dart';
import 'package:domain_layer_non_rxdart/src/codable/resolver.dart';

/// A list of values in a [KeyedArchive].
///
/// This object is a [List] that has additional behavior for encoding and decoding [Coding] objects.
class ListArchive extends Object
    with ListMixin<dynamic>
    implements Referencable {
  final List<dynamic> _inner;

  ListArchive() : _inner = [];

  /// Replaces all instances of [Map] and [List] in this object with [KeyedArchive] and [ListArchive]s.
  ListArchive.from(List<dynamic> raw)
      : _inner = raw.map(_toAtchiveType).toList();

  @override
  dynamic operator [](int index) => _inner[index];

  @override
  int get length => _inner.length;

  @override
  set length(int length) {
    _inner.length = length;
  }

  @override
  void operator []=(int index, dynamic val) {
    _inner[index] = val;
  }

  @override
  void add(dynamic element) {
    _inner.add(element);
  }

  @override
  void addAll(Iterable<dynamic> iterable) {
    _inner.addAll(iterable);
  }

  List<dynamic> toPrimitive() {
    final out = [];
    for (final val in _inner) {
      if (val is KeyedArchive) {
        out.add(val.toPrimitive());
      } else if (val is ListArchive) {
        out.add(val.toPrimitive());
      } else {
        out.add(val);
      }
    }
    return out;
  }

  @override
  void resolveOrThrow(ReferenceResolver coder) {
    for (final i in _inner) {
      if (i is KeyedArchive) {
        i.resolveOrThrow(coder);
      } else if (i is ListArchive) {
        i.resolveOrThrow(coder);
      }
    }
  }
}

dynamic _toAtchiveType(dynamic e) {
  if (e is Map<String, dynamic>) {
    return KeyedArchive(e);
  } else if (e is List) {
    return ListArchive.from(e);
  }
  return e;
}
