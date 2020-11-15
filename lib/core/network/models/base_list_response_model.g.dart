// GENERATED CODE - DO NOT MODIFY BY HAND

part of base_list_response_model;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseListResponseModel<T> _$BaseListResponseModelFromJson<T>(
    Map<String, dynamic> json) {
  return BaseListResponseModel<T>(
    status: json['status'] as bool,
    message: json['message'] as String,
    data: (json['data'] as List)?.map(_Converter<T>().fromJson)?.toList(),
  );
}

Map<String, dynamic> _$BaseListResponseModelToJson<T>(
        BaseListResponseModel<T> instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'data': instance.data?.map(_Converter<T>().toJson)?.toList(),
    };
