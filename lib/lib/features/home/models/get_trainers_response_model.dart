import 'package:json_annotation/json_annotation.dart';
part 'get_trainers_response_model.g.dart';

@JsonSerializable()
class GetTrainersResponseModel {
  final List<Trainer> trainers;

  GetTrainersResponseModel({
    required this.trainers,
  });

  factory GetTrainersResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetTrainersResponseModelFromJson(json);
}

@JsonSerializable()
class Trainer {
  final int? id;
  final String? name;
  final String? email;
  @JsonKey(name: 'license_path')
  final String? licensePath;
  @JsonKey(name: 'service_documents_path')
  final String? serviceDocumentsPath;
  final Profile? profile;

  Trainer({
    this.id,
    this.name,
    this.email,
    this.licensePath,
    this.serviceDocumentsPath,
    this.profile,
  });

  factory Trainer.fromJson(Map<String, dynamic> json) =>
      _$TrainerFromJson(json);
}

@JsonSerializable()
class Profile {
  final int? id;
  @JsonKey(name: 'user_id')
  final int? userId;
  final String? name;
  final String? image;
  final String? phone;
  @JsonKey(name: 'social_links')
  final List<String> socialLinks;
  @JsonKey(name: 'location_link')
  final String? locationLink;
  @JsonKey(name: 'service_video_url')
  final String? serviceVideoUrl;
  @JsonKey(name: 'slider_image')
  final String? sliderImage;

  Profile({
    this.id,
    this.userId,
    this.name,
    this.image,
    this.phone,
    this.socialLinks = const [],
    this.locationLink,
    this.serviceVideoUrl,
    this.sliderImage,
  });

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);
}
