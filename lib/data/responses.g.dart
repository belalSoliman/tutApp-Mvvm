// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) => BaseResponse()
  ..status = (json['status'] as num?)?.toInt()
  ..message = json['message'] as String?;

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };

CustomerResp _$CustomerRespFromJson(Map<String, dynamic> json) => CustomerResp(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      numOfNotif: (json['numOfNotif'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CustomerRespToJson(CustomerResp instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'numOfNotif': instance.numOfNotif,
    };

CustomerContacts _$CustomerContactsFromJson(Map<String, dynamic> json) =>
    CustomerContacts(
      phone: (json['phone'] as num?)?.toInt(),
      email: json['email'] as String?,
      link: json['link'] as String?,
    );

Map<String, dynamic> _$CustomerContactsToJson(CustomerContacts instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'email': instance.email,
      'link': instance.link,
    };

AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) => AuthResponse(
      contacts: json['contacts'] == null
          ? null
          : CustomerResp.fromJson(json['contacts'] as Map<String, dynamic>),
      customer: json['customer'] == null
          ? null
          : CustomerContacts.fromJson(json['customer'] as Map<String, dynamic>),
      status: (json['status'] as num?)?.toInt(),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$AuthResponseToJson(AuthResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'contacts': instance.contacts,
      'customer': instance.customer,
    };
