// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'graphql_api.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetPostLists$Query$Post _$GetPostLists$Query$PostFromJson(
        Map<String, dynamic> json) =>
    GetPostLists$Query$Post()
      ..title = json['title'] as String?
      ..content = json['content'] as String?;

Map<String, dynamic> _$GetPostLists$Query$PostToJson(
        GetPostLists$Query$Post instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
    };

GetPostLists$Query _$GetPostLists$QueryFromJson(Map<String, dynamic> json) =>
    GetPostLists$Query()
      ..posts = (json['posts'] as List<dynamic>)
          .map((e) =>
              GetPostLists$Query$Post.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$GetPostLists$QueryToJson(GetPostLists$Query instance) =>
    <String, dynamic>{
      'posts': instance.posts.map((e) => e.toJson()).toList(),
    };
