import 'package:json_annotation/json_annotation.dart';

part 'responses.g.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: 'status')
  int? status;
  @JsonKey(name: 'message')
  String? message;
}

@JsonSerializable()
class CustomerResp {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'numOfNotif')
  int? numOfNotif;

  CustomerResp({this.id, this.name, this.numOfNotif});
  factory CustomerResp.fromJson(Map<String, dynamic> json) =>
      _$CustomerRespFromJson(json);
  Map<String, dynamic> toJson() => _$CustomerRespToJson(this);
}

@JsonSerializable()
class CustomerContacts {
  @JsonKey(name: 'phone')
  int? phone;
  @JsonKey(name: 'email')
  String? email;
  @JsonKey(name: 'link')
  String? link;
  CustomerContacts({this.phone, this.email, this.link});
  factory CustomerContacts.fromJson(Map<String, dynamic> json) =>
      _$CustomerContactsFromJson(json);
  Map<String, dynamic> toJson() => _$CustomerContactsToJson(this);
}

@JsonSerializable()
class AuthResponse extends BaseResponse {
  @JsonKey(name: 'contacts')
  CustomerResp? contacts;
  @JsonKey(name: 'customer')
  CustomerContacts? customer;
  AuthResponse({this.contacts, this.customer, int? status, String? message});
  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}
