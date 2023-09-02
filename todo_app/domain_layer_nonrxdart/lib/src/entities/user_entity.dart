// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Originla code by Flutter Architecture Sample authors under BSD-clause-3
// copyright  2017
// see https://github.com/brianegan/flutter_architecture_samples

import 'package:flutter/foundation.dart';

// Always make your entity immutable and never ever
// extend an entity!

@immutable
class UserEntity {
  final String id;
  final String displayName;
  final String photoUrl;

  const UserEntity({required this.id, required this.displayName, required this.photoUrl});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserEntity &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          displayName == other.displayName &&
          photoUrl == other.photoUrl;

  @override
  int get hashCode => id.hashCode ^ displayName.hashCode ^ photoUrl.hashCode;

  @override
  String toString() {
    return 'UserEntity{id: $id, displayName: $displayName, photoUrl: $photoUrl}';
  }
}
