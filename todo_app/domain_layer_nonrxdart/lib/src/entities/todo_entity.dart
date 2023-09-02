// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Originla code by Flutter Architecture Sample authors under BSD-clause-3
// copyright  2017
// see https://github.com/brianegan/flutter_architecture_samples

// ignore_for_file: prefer_constructors_over_static_methods

import 'package:flutter/foundation.dart';

// Always make your entity immutable and never ever
// extend an entity!

// Okay some Dart Basics:
//    FUNCTIONS
// Functions have parameters and those functions in classes can act as the
// class constructor.
//         Named Parameters
//             void enableFlags({bool? bold, bool? hidden}) {...}
//          Optional Parameters
//             String say(String from, String msg, [String? device]) {}
//     CLASS CONSTRUCTORS
//          Generative Constructor
//            class Point {
//              double x = 0;
//              double y = 0;
//
//              Point(double x, double y) {
//
//                   this.x = x;
//                   this.y = y;
//              }
//            }
//          Named Constructor
//           const double xOrigin = 0;
//           const double yOrigin = 0;
//
//           class Point {
//             final double x;
//             final double y;
//
//             Point(this.x, this.y);
//
//
//            Point.origin()
//              : x = xOrigin,
//                y = yOrigin;
//           }
//
//        So why can we not extend the Entity? 
//          Entity is a business rule or business rules

@immutable
class TodoEntity {
  final bool complete;
  final String id;
  final String note;
  final String task;

  const TodoEntity(this.task, this.id, this.note, this.complete);

  @override
  int get hashCode => complete.hashCode ^ task.hashCode ^ note.hashCode ^ id.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TodoEntity &&
          runtimeType == other.runtimeType &&
          complete == other.complete &&
          task == other.task &&
          note == other.note &&
          id == other.id;

  Map<String, Object> toJson() {
    return {
      'complete': complete,
      'task': task,
      'note': note,
      'id': id,
    };
  }

  @override
  String toString() {
    return 'TodoEntity{complete: $complete, task: $task, note: $note, id: $id}';
  }

  static TodoEntity fromJson(Map<String, Object> json) {
    return TodoEntity(
      json['task']! as String,
      json['id']! as String,
      json['note']! as String,
      json['complete']! as bool,
    );
  }
}
