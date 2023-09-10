// Copyright 2023 Fredrick Allan Grott. All rights reserved.
// Use of this source code is governed by a BSD-style
// license that can be found in the LICENSE file.


import 'package:domain_layer_non_rxdart/src/codable/coding.dart';
import 'package:domain_layer_non_rxdart/src/codable/keyed_archive.dart';
import 'package:equatable/equatable.dart';

// Example of a Rich Model with the 
// business logic in how it is modified usually
// via copyWith
//
// Keep in mind that Lists in Models require 
// deep copy as Lists are mutable, for example:
//  ```dart
//  Model copyWith({
//    List<Product> mostBuyProducts,
//  }) =>
//      Model(
//        mostBuyProducts: mostBuyProducts ?? 
// [...this.mostBuyProducts],
//      );
//
// Keep in mind that on web platform the json
// stuff is converted to List(Map).



class Todo  extends Coding with EquatableMixin {
  late final bool complete;
  late final String id;
  late final String note;
  late final String task;

  Todo({required this.task, required this.id, required this.note, required this.complete});

  // simple biz logic, more complex models
  // might call for a Map Todo.fromMap and toMap
  // combination.

  Todo copyWith({
    bool? complete,
    String? id,
    String? note,
    String? task,
  }) {
    return Todo(
      complete: complete ?? this.complete,
      id: id ?? this.id,
      note: note ?? this.note,
      task: task ?? this.task,
   );
  }

 
 @override
  void decode(KeyedArchive object) {
    // must call super
    super.decode(object);

    complete = object.decode("complete") as bool;   
    id = object.decode("id") as String;
    note = object.decode("note") as String;
    task = object.decode("task") as String;
  }

 @override
  void encode(KeyedArchive object) {
    object.encode("complete", complete);
    object.encode("id", id);
    object.encode("note", note);
    object.encode("task", task);
  }



  
  
  @override
  List<Object> get props => [complete, id, note, task];

}
