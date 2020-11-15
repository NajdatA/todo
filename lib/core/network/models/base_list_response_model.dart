library base_list_response_model;

import 'package:json_annotation/json_annotation.dart';

part 'base_list_response_model.g.dart';

@JsonSerializable()
class BaseListResponseModel<T> {
  @JsonKey(name: 'status')
  final bool status;
  @JsonKey(name: 'message')
  final String message;
  @JsonKey(name: 'data')
  @_Converter()
  final List<T> data;

  BaseListResponseModel({this.status, this.message, this.data});

  factory BaseListResponseModel.fromJson(Map<String, dynamic> json) =>
      _$BaseListResponseModelFromJson<T>(json);
}

class _Converter<T> implements JsonConverter<T, Object> {
  const _Converter();

  @override
  T fromJson(Object json) {
    print('t is ${T.toString()}');
 // else if (T.toString() == DataModel.className) {
 //      return DataModel.fromJson(json) as T;
 //    }
    throw Exception('parse error');
  }

  @override
  Object toJson(T object) {
    // This will only work if `object` is a native JSON type:
    //   num, String, bool, null, etc
    // Or if it has a `toJson()` function`.
    return object;
  }
}
