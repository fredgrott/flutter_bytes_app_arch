// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Modified from conduit_codable 
// BSD 2-Clause License
// Copyright (c) 2018, stable/kernel
// see https://github.com/conduit-dart/codable


import 'package:domain_layer_non_rxdart/src/codable/resolver.dart';

abstract class Referencable {
  void resolveOrThrow(ReferenceResolver resolver);
}
