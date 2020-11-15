import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

class PaginateList<T extends Equatable> extends Equatable {
  final List<T> data;

  final int page;

  PaginateList({@required this.data, @required this.page})
      : super([data, page]);

  void addChild(T entity) {
    data.add(entity);
  }

  void addAll(PaginateList<T> entities) {
    this.data.addAll(entities.data);
  }

  void replace(List<T> entities) {
    this.data.replaceRange(0, this.data.length, entities);
  }
}