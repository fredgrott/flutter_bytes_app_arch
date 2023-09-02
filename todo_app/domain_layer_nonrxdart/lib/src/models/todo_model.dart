// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.
//
// Originla code by Flutter Architecture Sample authors under BSD-clause-3
// copyright  2017
// see https://github.com/brianegan/flutter_architecture_samples

// ignore_for_file: prefer_constructors_over_static_methods


import 'package:domain_layer_nonrxdart/src/entities/todo_entity.dart';
import 'package:domain_layer_nonrxdart/src/guid.dart';
import 'package:equatable/equatable.dart';

import 'package:flutter/foundation.dart';




@immutable
class TodoModel extends Equatable {
  final bool complete;
  final String id ;
  final String note;
  final String task;

  const TodoModel(this.task, {this.complete = false, this.note = '', required this.id})
      : super();

  TodoModel copyWith({required bool complete, required String id, required String note, required String task}) {
    return TodoModel(
      task,
      complete: complete,
      id: id,
      note: note,
    );
  }

  @override
  String toString() {
    return 'Todo { complete: $complete, task: $task, note: $note, id: $id }';
  }

  TodoEntity toEntity() {
    return TodoEntity(task, id, note, complete);
  }

  // app services hook which is why id is set here 
  // as opposed to wrongly having it set in the app services
  static TodoModel fromEntity(TodoEntity entity) {
    return TodoModel(
      entity.task,
      note: entity.note,
      id: Guid.newGuid() as String,
    );
  }
  
  @override
  List<Object?> get props => [task, id, note, complete];
}
