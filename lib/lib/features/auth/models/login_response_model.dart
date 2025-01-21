import 'package:json_annotation/json_annotation.dart';
part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel {
  final String? token;
  final User? user;

  LoginResponseModel({this.token, this.user});

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);
}

@JsonSerializable()
class User {
  final int? id;
  final String? name;
  final String? email;
  final String? role;
  @JsonKey(name: 'created_at')
  final String? createdAt;
  @JsonKey(name: 'updated_at')
  final String? updatedAt;
  @JsonKey(name: 'license_path')
  final String? licensePath;
  @JsonKey(name: 'service_documents')
  final String? serviceDocuments;

  User({
    this.id,
    this.name,
    this.email,
    this.role,
    this.createdAt,
    this.updatedAt,
    this.licensePath,
    this.serviceDocuments,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
}
