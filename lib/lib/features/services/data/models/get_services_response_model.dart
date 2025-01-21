import 'package:json_annotation/json_annotation.dart';

part 'get_services_response_model.g.dart';

@JsonSerializable()
class GetServicesResponseModel {
  final int id;
  final String name;
  final String image;
  @JsonKey(name: 'video_url')
  final String videoUrl;
  final int duration;
  @JsonKey(name: 'service_url')
  final String serviceUrl;
  final String price;
  @JsonKey(name: 'start_date')
  final String startDate;
  @JsonKey(name: 'end_date')
  final String endDate;
  final int stars;
  @JsonKey(name: 'created_at')
  final String createdAt;
  @JsonKey(name: 'updated_at')
  final String updatedAt;
  final List<dynamic> ratings;

  GetServicesResponseModel({
    required this.id,
    required this.name,
    required this.image,
    required this.videoUrl,
    required this.duration,
    required this.serviceUrl,
    required this.price,
    required this.startDate,
    required this.endDate,
    required this.stars,
    required this.createdAt,
    required this.updatedAt,
    required this.ratings,
  });

  // Factory method for JSON serialization
  factory GetServicesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GetServicesResponseModelFromJson(json);

  // Method for JSON deserialization
  Map<String, dynamic> toJson() => _$GetServicesResponseModelToJson(this);
}
