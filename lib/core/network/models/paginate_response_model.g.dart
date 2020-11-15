// GENERATED CODE - DO NOT MODIFY BY HAND

part of paginate_response_model;

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginateResponseModel<T> _$PaginateResponseModelFromJson<T extends Equatable>(
    Map<String, dynamic> json) {
  return PaginateResponseModel<T>(
    page: json['total'] as int,
    data: (json['data'] as List)?.map(_Converter<T>().fromJson)?.toList(),
  );
}

Map<String, dynamic> _$PaginateResponseModelToJson<T extends Equatable>(
        PaginateResponseModel<T> instance) =>
    <String, dynamic>{
      'total': instance.page,
      'data': instance.data?.map(_Converter<T>().toJson)?.toList(),
    };
