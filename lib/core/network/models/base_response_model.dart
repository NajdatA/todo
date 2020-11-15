library base_response_model;

import 'package:json_annotation/json_annotation.dart';

part 'base_response_model.g.dart';

@JsonSerializable()
class BaseResponseModel<T> {
  @JsonKey(name: 'status')
  final bool status;
  @JsonKey(name: 'message')
  final String message;
  @JsonKey(name: 'data', fromJson: _dataFromJson, toJson: _dataToJson, nullable: true)
  final T data;

  BaseResponseModel({this.status, this.message, this.data});

  factory BaseResponseModel.fromJson(Map<String, dynamic> json) {
    return _$BaseResponseModelFromJson<T>(json);
  }
}

T _dataFromJson<T>(Map<String, dynamic> data) {
  print('T is ${T.toString()}');
 // else if (T.toString() == NotificationsModel.paginateName) {
 //    final x = PaginateResponseModel<NotificationsModel>.fromJson(data) as T;
 //    print('after paginate response model');
 //    return x;
 //  }
  throw Exception('parse error');
}

Map<String, dynamic> _dataToJson<T, S, U>(T input, [S other1, U other2]) =>
    {'data': input};
