//library int_base_response_model;
//
//import 'package:json_annotation/json_annotation.dart';
//
//part 'int_base_response_model.g.dart';
//
//@JsonSerializable()
//class IntBaseResponseModel {
//  @JsonKey(name: 'status')
//  final bool status;
//  @JsonKey(name: 'message')
//  final String message;
//  @JsonKey(name: 'data', nullable: true)
//  final int data;
//
//  IntBaseResponseModel({this.status, this.message, this.data});
//
//  factory IntBaseResponseModel.fromJson(Map<String, dynamic> json) {
//    return _$IntBaseResponseModelFromJson(json);
//  }
//}