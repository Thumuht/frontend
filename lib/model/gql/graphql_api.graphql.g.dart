// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'graphql_api.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NewPost$Mutation$Post _$NewPost$Mutation$PostFromJson(
        Map<String, dynamic> json) =>
    NewPost$Mutation$Post()..title = json['title'] as String?;

Map<String, dynamic> _$NewPost$Mutation$PostToJson(
        NewPost$Mutation$Post instance) =>
    <String, dynamic>{
      'title': instance.title,
    };

NewPost$Mutation _$NewPost$MutationFromJson(Map<String, dynamic> json) =>
    NewPost$Mutation()
      ..createPost = NewPost$Mutation$Post.fromJson(
          json['createPost'] as Map<String, dynamic>);

Map<String, dynamic> _$NewPost$MutationToJson(NewPost$Mutation instance) =>
    <String, dynamic>{
      'createPost': instance.createPost.toJson(),
    };

Register$Mutation$User _$Register$Mutation$UserFromJson(
        Map<String, dynamic> json) =>
    Register$Mutation$User()
      ..id = json['id'] as int
      ..loginName = json['loginName'] as String;

Map<String, dynamic> _$Register$Mutation$UserToJson(
        Register$Mutation$User instance) =>
    <String, dynamic>{
      'id': instance.id,
      'loginName': instance.loginName,
    };

Register$Mutation _$Register$MutationFromJson(Map<String, dynamic> json) =>
    Register$Mutation()
      ..createUser = Register$Mutation$User.fromJson(
          json['createUser'] as Map<String, dynamic>);

Map<String, dynamic> _$Register$MutationToJson(Register$Mutation instance) =>
    <String, dynamic>{
      'createUser': instance.createUser.toJson(),
    };

Login$Mutation _$Login$MutationFromJson(Map<String, dynamic> json) =>
    Login$Mutation()..login = json['login'] as String;

Map<String, dynamic> _$Login$MutationToJson(Login$Mutation instance) =>
    <String, dynamic>{
      'login': instance.login,
    };

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

NewPostArguments _$NewPostArgumentsFromJson(Map<String, dynamic> json) =>
    NewPostArguments(
      userId: json['userId'] as int,
      title: json['title'] as String?,
      content: json['content'] as String?,
    );

Map<String, dynamic> _$NewPostArgumentsToJson(NewPostArguments instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'title': instance.title,
      'content': instance.content,
    };

RegisterArguments _$RegisterArgumentsFromJson(Map<String, dynamic> json) =>
    RegisterArguments(
      loginName: json['loginName'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$RegisterArgumentsToJson(RegisterArguments instance) =>
    <String, dynamic>{
      'loginName': instance.loginName,
      'password': instance.password,
    };

LoginArguments _$LoginArgumentsFromJson(Map<String, dynamic> json) =>
    LoginArguments(
      loginName: json['loginName'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$LoginArgumentsToJson(LoginArguments instance) =>
    <String, dynamic>{
      'loginName': instance.loginName,
      'password': instance.password,
    };
