// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'graphql_api.graphql.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Dislike$Mutation _$Dislike$MutationFromJson(Map<String, dynamic> json) =>
    Dislike$Mutation()..dislikePost = json['dislikePost'] as bool;

Map<String, dynamic> _$Dislike$MutationToJson(Dislike$Mutation instance) =>
    <String, dynamic>{
      'dislikePost': instance.dislikePost,
    };

GetCommentLists$Query$Comment$Post _$GetCommentLists$Query$Comment$PostFromJson(
        Map<String, dynamic> json) =>
    GetCommentLists$Query$Comment$Post()..id = json['id'] as int;

Map<String, dynamic> _$GetCommentLists$Query$Comment$PostToJson(
        GetCommentLists$Query$Comment$Post instance) =>
    <String, dynamic>{
      'id': instance.id,
    };

GetCommentLists$Query$Comment$User _$GetCommentLists$Query$Comment$UserFromJson(
        Map<String, dynamic> json) =>
    GetCommentLists$Query$Comment$User()
      ..loginName = json['loginName'] as String;

Map<String, dynamic> _$GetCommentLists$Query$Comment$UserToJson(
        GetCommentLists$Query$Comment$User instance) =>
    <String, dynamic>{
      'loginName': instance.loginName,
    };

GetCommentLists$Query$Comment _$GetCommentLists$Query$CommentFromJson(
        Map<String, dynamic> json) =>
    GetCommentLists$Query$Comment()
      ..content = json['content'] as String?
      ..createdAt = json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String)
      ..post = json['post'] == null
          ? null
          : GetCommentLists$Query$Comment$Post.fromJson(
              json['post'] as Map<String, dynamic>)
      ..user = json['user'] == null
          ? null
          : GetCommentLists$Query$Comment$User.fromJson(
              json['user'] as Map<String, dynamic>);

Map<String, dynamic> _$GetCommentLists$Query$CommentToJson(
        GetCommentLists$Query$Comment instance) =>
    <String, dynamic>{
      'content': instance.content,
      'createdAt': instance.createdAt?.toIso8601String(),
      'post': instance.post?.toJson(),
      'user': instance.user?.toJson(),
    };

GetCommentLists$Query _$GetCommentLists$QueryFromJson(
        Map<String, dynamic> json) =>
    GetCommentLists$Query()
      ..comment = (json['comment'] as List<dynamic>)
          .map((e) =>
              GetCommentLists$Query$Comment.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$GetCommentLists$QueryToJson(
        GetCommentLists$Query instance) =>
    <String, dynamic>{
      'comment': instance.comment.map((e) => e.toJson()).toList(),
    };

GetPostLists$Query$Post _$GetPostLists$Query$PostFromJson(
        Map<String, dynamic> json) =>
    GetPostLists$Query$Post()
      ..id = json['id'] as int
      ..title = json['title'] as String?
      ..content = json['content'] as String?
      ..view = json['view'] as int?
      ..like = json['like'] as int?
      ..commentsNum = json['comments_num'] as int?
      ..position = json['position'] as String?
      ..tag = json['tag'] as String?;

Map<String, dynamic> _$GetPostLists$Query$PostToJson(
        GetPostLists$Query$Post instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'view': instance.view,
      'like': instance.like,
      'comments_num': instance.commentsNum,
      'position': instance.position,
      'tag': instance.tag,
    };

GetPostLists$Query _$GetPostLists$QueryFromJson(Map<String, dynamic> json) =>
    GetPostLists$Query()
      ..posts = (json['posts'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : GetPostLists$Query$Post.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$GetPostLists$QueryToJson(GetPostLists$Query instance) =>
    <String, dynamic>{
      'posts': instance.posts?.map((e) => e?.toJson()).toList(),
    };

Like$Mutation _$Like$MutationFromJson(Map<String, dynamic> json) =>
    Like$Mutation()..likePost = json['likePost'] as bool;

Map<String, dynamic> _$Like$MutationToJson(Like$Mutation instance) =>
    <String, dynamic>{
      'likePost': instance.likePost,
    };

NewComment$Mutation$Comment _$NewComment$Mutation$CommentFromJson(
        Map<String, dynamic> json) =>
    NewComment$Mutation$Comment()..content = json['content'] as String?;

Map<String, dynamic> _$NewComment$Mutation$CommentToJson(
        NewComment$Mutation$Comment instance) =>
    <String, dynamic>{
      'content': instance.content,
    };

NewComment$Mutation _$NewComment$MutationFromJson(Map<String, dynamic> json) =>
    NewComment$Mutation()
      ..createComment = NewComment$Mutation$Comment.fromJson(
          json['createComment'] as Map<String, dynamic>);

Map<String, dynamic> _$NewComment$MutationToJson(
        NewComment$Mutation instance) =>
    <String, dynamic>{
      'createComment': instance.createComment.toJson(),
    };

NewPost$Mutation$Post _$NewPost$Mutation$PostFromJson(
        Map<String, dynamic> json) =>
    NewPost$Mutation$Post()
      ..id = json['id'] as int
      ..title = json['title'] as String?;

Map<String, dynamic> _$NewPost$Mutation$PostToJson(
        NewPost$Mutation$Post instance) =>
    <String, dynamic>{
      'id': instance.id,
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

Login$Mutation$LoginInfo _$Login$Mutation$LoginInfoFromJson(
        Map<String, dynamic> json) =>
    Login$Mutation$LoginInfo()
      ..token = json['token'] as String
      ..userId = json['userId'] as int;

Map<String, dynamic> _$Login$Mutation$LoginInfoToJson(
        Login$Mutation$LoginInfo instance) =>
    <String, dynamic>{
      'token': instance.token,
      'userId': instance.userId,
    };

Login$Mutation _$Login$MutationFromJson(Map<String, dynamic> json) =>
    Login$Mutation()
      ..login = Login$Mutation$LoginInfo.fromJson(
          json['login'] as Map<String, dynamic>);

Map<String, dynamic> _$Login$MutationToJson(Login$Mutation instance) =>
    <String, dynamic>{
      'login': instance.login.toJson(),
    };

Logout$Mutation _$Logout$MutationFromJson(Map<String, dynamic> json) =>
    Logout$Mutation()..logout = json['logout'] as bool;

Map<String, dynamic> _$Logout$MutationToJson(Logout$Mutation instance) =>
    <String, dynamic>{
      'logout': instance.logout,
    };

Mark$Mutation _$Mark$MutationFromJson(Map<String, dynamic> json) =>
    Mark$Mutation()..markPost = json['markPost'] as bool;

Map<String, dynamic> _$Mark$MutationToJson(Mark$Mutation instance) =>
    <String, dynamic>{
      'markPost': instance.markPost,
    };

Unmark$Mutation _$Unmark$MutationFromJson(Map<String, dynamic> json) =>
    Unmark$Mutation()..unmarkPost = json['unmarkPost'] as bool;

Map<String, dynamic> _$Unmark$MutationToJson(Unmark$Mutation instance) =>
    <String, dynamic>{
      'unmarkPost': instance.unmarkPost,
    };

GetFavoritePost$Query$Post _$GetFavoritePost$Query$PostFromJson(
        Map<String, dynamic> json) =>
    GetFavoritePost$Query$Post()
      ..id = json['id'] as int
      ..title = json['title'] as String?
      ..content = json['content'] as String?
      ..view = json['view'] as int?
      ..like = json['like'] as int?
      ..commentsNum = json['comments_num'] as int?
      ..position = json['position'] as String?
      ..tag = json['tag'] as String?;

Map<String, dynamic> _$GetFavoritePost$Query$PostToJson(
        GetFavoritePost$Query$Post instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'view': instance.view,
      'like': instance.like,
      'comments_num': instance.commentsNum,
      'position': instance.position,
      'tag': instance.tag,
    };

GetFavoritePost$Query _$GetFavoritePost$QueryFromJson(
        Map<String, dynamic> json) =>
    GetFavoritePost$Query()
      ..getUserFavoritePost = (json['getUserFavoritePost'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : GetFavoritePost$Query$Post.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$GetFavoritePost$QueryToJson(
        GetFavoritePost$Query instance) =>
    <String, dynamic>{
      'getUserFavoritePost':
          instance.getUserFavoritePost?.map((e) => e?.toJson()).toList(),
    };

GlobalSearch$Query$Post _$GlobalSearch$Query$PostFromJson(
        Map<String, dynamic> json) =>
    GlobalSearch$Query$Post()
      ..id = json['id'] as int
      ..title = json['title'] as String?
      ..content = json['content'] as String?
      ..view = json['view'] as int?
      ..like = json['like'] as int?
      ..commentsNum = json['comments_num'] as int?
      ..position = json['position'] as String?
      ..tag = json['tag'] as String?;

Map<String, dynamic> _$GlobalSearch$Query$PostToJson(
        GlobalSearch$Query$Post instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'content': instance.content,
      'view': instance.view,
      'like': instance.like,
      'comments_num': instance.commentsNum,
      'position': instance.position,
      'tag': instance.tag,
    };

GlobalSearch$Query _$GlobalSearch$QueryFromJson(Map<String, dynamic> json) =>
    GlobalSearch$Query()
      ..globalSearch = (json['globalSearch'] as List<dynamic>?)
          ?.map((e) => e == null
              ? null
              : GlobalSearch$Query$Post.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$GlobalSearch$QueryToJson(GlobalSearch$Query instance) =>
    <String, dynamic>{
      'globalSearch': instance.globalSearch?.map((e) => e?.toJson()).toList(),
    };

DislikeArguments _$DislikeArgumentsFromJson(Map<String, dynamic> json) =>
    DislikeArguments(
      postId: json['postId'] as int,
    );

Map<String, dynamic> _$DislikeArgumentsToJson(DislikeArguments instance) =>
    <String, dynamic>{
      'postId': instance.postId,
    };

GetPostListsArguments _$GetPostListsArgumentsFromJson(
        Map<String, dynamic> json) =>
    GetPostListsArguments(
      offset: json['offset'] as int,
      orderBy: $enumDecode(_$PostOrderByEnumMap, json['orderBy'],
          unknownValue: PostOrderBy.artemisUnknown),
    );

Map<String, dynamic> _$GetPostListsArgumentsToJson(
        GetPostListsArguments instance) =>
    <String, dynamic>{
      'offset': instance.offset,
      'orderBy': _$PostOrderByEnumMap[instance.orderBy]!,
    };

const _$PostOrderByEnumMap = {
  PostOrderBy.postId: 'post_id',
  PostOrderBy.title: 'title',
  PostOrderBy.content: 'content',
  PostOrderBy.view: 'view',
  PostOrderBy.like: 'like',
  PostOrderBy.userId: 'userId',
  PostOrderBy.createdAt: 'created_at',
  PostOrderBy.updatedAt: 'updated_at',
  PostOrderBy.commentsNum: 'comments_num',
  PostOrderBy.artemisUnknown: 'ARTEMIS_UNKNOWN',
};

LikeArguments _$LikeArgumentsFromJson(Map<String, dynamic> json) =>
    LikeArguments(
      postId: json['postId'] as int,
    );

Map<String, dynamic> _$LikeArgumentsToJson(LikeArguments instance) =>
    <String, dynamic>{
      'postId': instance.postId,
    };

NewCommentArguments _$NewCommentArgumentsFromJson(Map<String, dynamic> json) =>
    NewCommentArguments(
      userId: json['userId'] as int,
      postId: json['postId'] as int,
      content: json['content'] as String?,
    );

Map<String, dynamic> _$NewCommentArgumentsToJson(
        NewCommentArguments instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'postId': instance.postId,
      'content': instance.content,
    };

NewPostArguments _$NewPostArgumentsFromJson(Map<String, dynamic> json) =>
    NewPostArguments(
      userId: json['userId'] as int,
      title: json['title'] as String,
      content: json['content'] as String,
      tag: json['tag'] as String?,
      position: json['position'] as String?,
    );

Map<String, dynamic> _$NewPostArgumentsToJson(NewPostArguments instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'title': instance.title,
      'content': instance.content,
      'tag': instance.tag,
      'position': instance.position,
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

MarkArguments _$MarkArgumentsFromJson(Map<String, dynamic> json) =>
    MarkArguments(
      postId: json['postId'] as int,
    );

Map<String, dynamic> _$MarkArgumentsToJson(MarkArguments instance) =>
    <String, dynamic>{
      'postId': instance.postId,
    };

UnmarkArguments _$UnmarkArgumentsFromJson(Map<String, dynamic> json) =>
    UnmarkArguments(
      postId: json['postId'] as int,
    );

Map<String, dynamic> _$UnmarkArgumentsToJson(UnmarkArguments instance) =>
    <String, dynamic>{
      'postId': instance.postId,
    };

GetFavoritePostArguments _$GetFavoritePostArgumentsFromJson(
        Map<String, dynamic> json) =>
    GetFavoritePostArguments(
      userId: json['userId'] as int,
    );

Map<String, dynamic> _$GetFavoritePostArgumentsToJson(
        GetFavoritePostArguments instance) =>
    <String, dynamic>{
      'userId': instance.userId,
    };

GlobalSearchArguments _$GlobalSearchArgumentsFromJson(
        Map<String, dynamic> json) =>
    GlobalSearchArguments(
      keyWord: json['keyWord'] as String,
    );

Map<String, dynamic> _$GlobalSearchArgumentsToJson(
        GlobalSearchArguments instance) =>
    <String, dynamic>{
      'keyWord': instance.keyWord,
    };
