// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.

import 'package:uuid/uuid.dart';
import 'package:validators/validators.dart';

/// Class that emulates as closely as possible the C# Guid type.
class Guid {
  static const String _defaultGuid = "00000000-0000-0000-0000-000000000000";

  /// The Guid whose value is the default sequence of characters
  /// that represent a 'zero-value' UUID in .Net "00000000-0000-0000-0000-000000000000"
  String? _value;

  /// Constructor, expects a valid UUID and will throw an exception if the value provided is invalid.
  Guid(String v) {
    _failIfNotValidGuid(v);
    _value = v;
  }

  Guid.defaultValue() {
    _value = _defaultGuid;
  }

  /// Generates a new v4 UUID and returns a GUID instance with the new UUID.
  Guid.newGuid() {
    _value = const Uuid().v4();
  }

  /// Checks whether a value is a valid [Guid]
  /// Returns false if [guid] is null or has an invalid value
  /// Returns true if [guid] is valid
  static bool isValid(Guid? guid) {
    if (guid == null) {
      return false;
    } else {
      return isUUID(guid.value);
    }
  }

  void _failIfNotValidGuid(String? v) {
    String temp = '';

    if (v == null || v.isEmpty) {
      temp = _defaultGuid;
    } else {
      temp = v;
    }

    final isInvalid = isUUID(temp) == false;
    if (isInvalid) {
      throw InvalidGuidError("Value '$temp' is not a valid UUID");
    }
  }

  /// Gets the UUID value contained by the Guid object as a string.
  String get value {
    if (_value == null || _value!.isEmpty) {
      return _defaultGuid;
    } else {
      return _value!;
    }
  }

  /// Performs a case insensitive comparison on the UUIDs contained in two Guid objects.
  /// Comparison is by value and not by reference.
  @override
  bool operator ==(Object other) {
    return value.toLowerCase() == other.toString().toLowerCase();
  }

  /// Returns the hashCode.
  @override
  int get hashCode {
    return super.hashCode;
  }

  /// Gets the UUID value contained by the Guid object as a string.
  @override
  String toString() {
    return value;
  }
}

class InvalidGuidError extends Error {
  final String message;

  InvalidGuidError(this.message);
}
