library paginate_response_model;

import 'package:equatable/equatable.dart';
import 'package:flutter_app/core/entites/paginate_list.dart';
import 'package:json_annotation/json_annotation.dart';

part 'paginate_response_model.g.dart';

@JsonSerializable()
class PaginateResponseModel<T extends Equatable> extends PaginateList {
  @JsonKey(name: 'total')
  final int page;
  @JsonKey(name: 'data')
  @_Converter()
  final List<T> data;

  PaginateResponseModel({this.page, this.data});

  factory PaginateResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PaginateResponseModelFromJson<T>(json);
}

class _Converter<T> implements JsonConverter<T, Object> {
  const _Converter();

  @override
  T fromJson(Object json) {
    // if (json is Map<String, dynamic> &&
    //     T.toString() == NotificationsModel.className) {
    //   return NotificationsModel.fromJson(json) as T;
    // }
    return json as T;
  }

  @override
  Object toJson(T object) {
    // This will only work if `object` is a native JSON type:
    //   num, String, bool, null, etc
    // Or if it has a `toJson()` function`.
    return object;
  }
}
