// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_products_response_mode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetProductsResponseModel _$GetProductsResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetProductsResponseModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      price: json['price'] as String?,
      stars: (json['stars'] as num?)?.toInt(),
      isFavorite: (json['is_favorite'] as num?)?.toInt(),
      userId: (json['userId'] as num?)?.toInt(),
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$GetProductsResponseModelToJson(
        GetProductsResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'image': instance.image,
      'price': instance.price,
      'stars': instance.stars,
      'is_favorite': instance.isFavorite,
      'userId': instance.userId,
      'user': instance.user,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
