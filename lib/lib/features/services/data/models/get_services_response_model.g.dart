// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_services_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetServicesResponseModel _$GetServicesResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetServicesResponseModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      image: json['image'] as String,
      videoUrl: json['video_url'] as String,
      duration: (json['duration'] as num).toInt(),
      serviceUrl: json['service_url'] as String,
      price: json['price'] as String,
      startDate: json['start_date'] as String,
      endDate: json['end_date'] as String,
      stars: (json['stars'] as num).toInt(),
      createdAt: json['created_at'] as String,
      updatedAt: json['updated_at'] as String,
      ratings: json['ratings'] as List<dynamic>,
    );

Map<String, dynamic> _$GetServicesResponseModelToJson(
        GetServicesResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'video_url': instance.videoUrl,
      'duration': instance.duration,
      'service_url': instance.serviceUrl,
      'price': instance.price,
      'start_date': instance.startDate,
      'end_date': instance.endDate,
      'stars': instance.stars,
      'created_at': instance.createdAt,
      'updated_at': instance.updatedAt,
      'ratings': instance.ratings,
    };
