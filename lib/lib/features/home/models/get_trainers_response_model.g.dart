// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_trainers_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetTrainersResponseModel _$GetTrainersResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetTrainersResponseModel(
      trainers: (json['trainers'] as List<dynamic>)
          .map((e) => Trainer.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetTrainersResponseModelToJson(
        GetTrainersResponseModel instance) =>
    <String, dynamic>{
      'trainers': instance.trainers,
    };

Trainer _$TrainerFromJson(Map<String, dynamic> json) => Trainer(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
      licensePath: json['license_path'] as String?,
      serviceDocumentsPath: json['service_documents_path'] as String?,
      profile: json['profile'] == null
          ? null
          : Profile.fromJson(json['profile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TrainerToJson(Trainer instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'license_path': instance.licensePath,
      'service_documents_path': instance.serviceDocumentsPath,
      'profile': instance.profile,
    };

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      id: (json['id'] as num?)?.toInt(),
      userId: (json['user_id'] as num?)?.toInt(),
      name: json['name'] as String?,
      image: json['image'] as String?,
      phone: json['phone'] as String?,
      socialLinks: (json['social_links'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      locationLink: json['location_link'] as String?,
      serviceVideoUrl: json['service_video_url'] as String?,
      sliderImage: json['slider_image'] as String?,
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'name': instance.name,
      'image': instance.image,
      'phone': instance.phone,
      'social_links': instance.socialLinks,
      'location_link': instance.locationLink,
      'service_video_url': instance.serviceVideoUrl,
      'slider_image': instance.sliderImage,
    };
