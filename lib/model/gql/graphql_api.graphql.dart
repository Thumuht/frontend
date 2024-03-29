// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
import 'package:http/http.dart';
import 'package:thumuht/model/upload.dart';
part 'graphql_api.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class Dislike$Mutation extends JsonSerializable with EquatableMixin {
  Dislike$Mutation();

  factory Dislike$Mutation.fromJson(Map<String, dynamic> json) =>
      _$Dislike$MutationFromJson(json);

  late bool dislikePost;

  @override
  List<Object?> get props => [dislikePost];
  @override
  Map<String, dynamic> toJson() => _$Dislike$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetCommentLists$Query$Comment$Post extends JsonSerializable
    with EquatableMixin {
  GetCommentLists$Query$Comment$Post();

  factory GetCommentLists$Query$Comment$Post.fromJson(
          Map<String, dynamic> json) =>
      _$GetCommentLists$Query$Comment$PostFromJson(json);

  late int id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() =>
      _$GetCommentLists$Query$Comment$PostToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetCommentLists$Query$Comment$User extends JsonSerializable
    with EquatableMixin {
  GetCommentLists$Query$Comment$User();

  factory GetCommentLists$Query$Comment$User.fromJson(
          Map<String, dynamic> json) =>
      _$GetCommentLists$Query$Comment$UserFromJson(json);

  late int id;

  late String loginName;

  @override
  List<Object?> get props => [id, loginName];
  @override
  Map<String, dynamic> toJson() =>
      _$GetCommentLists$Query$Comment$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetCommentLists$Query$Comment extends JsonSerializable
    with EquatableMixin {
  GetCommentLists$Query$Comment();

  factory GetCommentLists$Query$Comment.fromJson(Map<String, dynamic> json) =>
      _$GetCommentLists$Query$CommentFromJson(json);

  String? content;

  DateTime? createdAt;

  GetCommentLists$Query$Comment$Post? post;

  GetCommentLists$Query$Comment$User? user;

  @override
  List<Object?> get props => [content, createdAt, post, user];
  @override
  Map<String, dynamic> toJson() => _$GetCommentLists$Query$CommentToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetCommentLists$Query extends JsonSerializable with EquatableMixin {
  GetCommentLists$Query();

  factory GetCommentLists$Query.fromJson(Map<String, dynamic> json) =>
      _$GetCommentLists$QueryFromJson(json);

  late List<GetCommentLists$Query$Comment> comment;

  @override
  List<Object?> get props => [comment];
  @override
  Map<String, dynamic> toJson() => _$GetCommentLists$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetFavoritePost$Query$Post extends JsonSerializable with EquatableMixin {
  GetFavoritePost$Query$Post();

  factory GetFavoritePost$Query$Post.fromJson(Map<String, dynamic> json) =>
      _$GetFavoritePost$Query$PostFromJson(json);

  late int id;

  String? title;

  String? content;

  int? view;

  int? like;

  @JsonKey(name: 'comments_num')
  int? commentsNum;

  String? position;

  String? tag;

  @override
  List<Object?> get props =>
      [id, title, content, view, like, commentsNum, position, tag];
  @override
  Map<String, dynamic> toJson() => _$GetFavoritePost$Query$PostToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetFavoritePost$Query extends JsonSerializable with EquatableMixin {
  GetFavoritePost$Query();

  factory GetFavoritePost$Query.fromJson(Map<String, dynamic> json) =>
      _$GetFavoritePost$QueryFromJson(json);

  List<GetFavoritePost$Query$Post?>? getUserFavoritePost;

  @override
  List<Object?> get props => [getUserFavoritePost];
  @override
  Map<String, dynamic> toJson() => _$GetFavoritePost$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetPostLists$Query$Post$User extends JsonSerializable
    with EquatableMixin {
  GetPostLists$Query$Post$User();

  factory GetPostLists$Query$Post$User.fromJson(Map<String, dynamic> json) =>
      _$GetPostLists$Query$Post$UserFromJson(json);

  late int id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() => _$GetPostLists$Query$Post$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetPostLists$Query$Post extends JsonSerializable with EquatableMixin {
  GetPostLists$Query$Post();

  factory GetPostLists$Query$Post.fromJson(Map<String, dynamic> json) =>
      _$GetPostLists$Query$PostFromJson(json);

  late int id;

  String? title;

  String? content;

  int? view;

  int? like;

  @JsonKey(name: 'comments_num')
  int? commentsNum;

  String? position;

  String? tag;

  GetPostLists$Query$Post$User? user;

  @override
  List<Object?> get props =>
      [id, title, content, view, like, commentsNum, position, tag, user];
  @override
  Map<String, dynamic> toJson() => _$GetPostLists$Query$PostToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetPostLists$Query extends JsonSerializable with EquatableMixin {
  GetPostLists$Query();

  factory GetPostLists$Query.fromJson(Map<String, dynamic> json) =>
      _$GetPostLists$QueryFromJson(json);

  List<GetPostLists$Query$Post?>? posts;

  @override
  List<Object?> get props => [posts];
  @override
  Map<String, dynamic> toJson() => _$GetPostLists$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetProfile$Query$User extends JsonSerializable with EquatableMixin {
  GetProfile$Query$User();

  factory GetProfile$Query$User.fromJson(Map<String, dynamic> json) =>
      _$GetProfile$Query$UserFromJson(json);

  late int id;

  late String loginName;

  String? nickname;

  String? about;

  String? avatar;

  @override
  List<Object?> get props => [id, loginName, nickname, about, avatar];
  @override
  Map<String, dynamic> toJson() => _$GetProfile$Query$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetProfile$Query extends JsonSerializable with EquatableMixin {
  GetProfile$Query();

  factory GetProfile$Query.fromJson(Map<String, dynamic> json) =>
      _$GetProfile$QueryFromJson(json);

  late GetProfile$Query$User me;

  @override
  List<Object?> get props => [me];
  @override
  Map<String, dynamic> toJson() => _$GetProfile$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GlobalSearch$Query$Post extends JsonSerializable with EquatableMixin {
  GlobalSearch$Query$Post();

  factory GlobalSearch$Query$Post.fromJson(Map<String, dynamic> json) =>
      _$GlobalSearch$Query$PostFromJson(json);

  late int id;

  String? title;

  String? content;

  int? view;

  int? like;

  @JsonKey(name: 'comments_num')
  int? commentsNum;

  String? position;

  String? tag;

  @override
  List<Object?> get props =>
      [id, title, content, view, like, commentsNum, position, tag];
  @override
  Map<String, dynamic> toJson() => _$GlobalSearch$Query$PostToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GlobalSearch$Query extends JsonSerializable with EquatableMixin {
  GlobalSearch$Query();

  factory GlobalSearch$Query.fromJson(Map<String, dynamic> json) =>
      _$GlobalSearch$QueryFromJson(json);

  List<GlobalSearch$Query$Post?>? globalSearch;

  @override
  List<Object?> get props => [globalSearch];
  @override
  Map<String, dynamic> toJson() => _$GlobalSearch$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Like$Mutation extends JsonSerializable with EquatableMixin {
  Like$Mutation();

  factory Like$Mutation.fromJson(Map<String, dynamic> json) =>
      _$Like$MutationFromJson(json);

  late bool likePost;

  @override
  List<Object?> get props => [likePost];
  @override
  Map<String, dynamic> toJson() => _$Like$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Mark$Mutation extends JsonSerializable with EquatableMixin {
  Mark$Mutation();

  factory Mark$Mutation.fromJson(Map<String, dynamic> json) =>
      _$Mark$MutationFromJson(json);

  late bool markPost;

  @override
  List<Object?> get props => [markPost];
  @override
  Map<String, dynamic> toJson() => _$Mark$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class NewComment$Mutation$Comment extends JsonSerializable with EquatableMixin {
  NewComment$Mutation$Comment();

  factory NewComment$Mutation$Comment.fromJson(Map<String, dynamic> json) =>
      _$NewComment$Mutation$CommentFromJson(json);

  String? content;

  @override
  List<Object?> get props => [content];
  @override
  Map<String, dynamic> toJson() => _$NewComment$Mutation$CommentToJson(this);
}

@JsonSerializable(explicitToJson: true)
class NewComment$Mutation extends JsonSerializable with EquatableMixin {
  NewComment$Mutation();

  factory NewComment$Mutation.fromJson(Map<String, dynamic> json) =>
      _$NewComment$MutationFromJson(json);

  late NewComment$Mutation$Comment createComment;

  @override
  List<Object?> get props => [createComment];
  @override
  Map<String, dynamic> toJson() => _$NewComment$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class NewPost$Mutation$Post extends JsonSerializable with EquatableMixin {
  NewPost$Mutation$Post();

  factory NewPost$Mutation$Post.fromJson(Map<String, dynamic> json) =>
      _$NewPost$Mutation$PostFromJson(json);

  late int id;

  String? title;

  @override
  List<Object?> get props => [id, title];
  @override
  Map<String, dynamic> toJson() => _$NewPost$Mutation$PostToJson(this);
}

@JsonSerializable(explicitToJson: true)
class NewPost$Mutation extends JsonSerializable with EquatableMixin {
  NewPost$Mutation();

  factory NewPost$Mutation.fromJson(Map<String, dynamic> json) =>
      _$NewPost$MutationFromJson(json);

  late NewPost$Mutation$Post createPost;

  @override
  List<Object?> get props => [createPost];
  @override
  Map<String, dynamic> toJson() => _$NewPost$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Register$Mutation$User extends JsonSerializable with EquatableMixin {
  Register$Mutation$User();

  factory Register$Mutation$User.fromJson(Map<String, dynamic> json) =>
      _$Register$Mutation$UserFromJson(json);

  late int id;

  late String loginName;

  @override
  List<Object?> get props => [id, loginName];
  @override
  Map<String, dynamic> toJson() => _$Register$Mutation$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Register$Mutation extends JsonSerializable with EquatableMixin {
  Register$Mutation();

  factory Register$Mutation.fromJson(Map<String, dynamic> json) =>
      _$Register$MutationFromJson(json);

  late Register$Mutation$User createUser;

  @override
  List<Object?> get props => [createUser];
  @override
  Map<String, dynamic> toJson() => _$Register$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SetProfile$Mutation$User extends JsonSerializable with EquatableMixin {
  SetProfile$Mutation$User();

  factory SetProfile$Mutation$User.fromJson(Map<String, dynamic> json) =>
      _$SetProfile$Mutation$UserFromJson(json);

  late int id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() => _$SetProfile$Mutation$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SetProfile$Mutation extends JsonSerializable with EquatableMixin {
  SetProfile$Mutation();

  factory SetProfile$Mutation.fromJson(Map<String, dynamic> json) =>
      _$SetProfile$MutationFromJson(json);

  late SetProfile$Mutation$User updateUser;

  @override
  List<Object?> get props => [updateUser];
  @override
  Map<String, dynamic> toJson() => _$SetProfile$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Unmark$Mutation extends JsonSerializable with EquatableMixin {
  Unmark$Mutation();

  factory Unmark$Mutation.fromJson(Map<String, dynamic> json) =>
      _$Unmark$MutationFromJson(json);

  late bool unmarkPost;

  @override
  List<Object?> get props => [unmarkPost];
  @override
  Map<String, dynamic> toJson() => _$Unmark$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Login$Mutation$LoginInfo extends JsonSerializable with EquatableMixin {
  Login$Mutation$LoginInfo();

  factory Login$Mutation$LoginInfo.fromJson(Map<String, dynamic> json) =>
      _$Login$Mutation$LoginInfoFromJson(json);

  late String token;

  late int userId;

  @override
  List<Object?> get props => [token, userId];
  @override
  Map<String, dynamic> toJson() => _$Login$Mutation$LoginInfoToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Login$Mutation extends JsonSerializable with EquatableMixin {
  Login$Mutation();

  factory Login$Mutation.fromJson(Map<String, dynamic> json) =>
      _$Login$MutationFromJson(json);

  late Login$Mutation$LoginInfo login;

  @override
  List<Object?> get props => [login];
  @override
  Map<String, dynamic> toJson() => _$Login$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Logout$Mutation extends JsonSerializable with EquatableMixin {
  Logout$Mutation();

  factory Logout$Mutation.fromJson(Map<String, dynamic> json) =>
      _$Logout$MutationFromJson(json);

  late bool logout;

  @override
  List<Object?> get props => [logout];
  @override
  Map<String, dynamic> toJson() => _$Logout$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetTypePost$Query$Post extends JsonSerializable with EquatableMixin {
  GetTypePost$Query$Post();

  factory GetTypePost$Query$Post.fromJson(Map<String, dynamic> json) =>
      _$GetTypePost$Query$PostFromJson(json);

  late int id;

  String? title;

  String? content;

  int? view;

  int? like;

  @JsonKey(name: 'comments_num')
  int? commentsNum;

  String? position;

  String? tag;

  @override
  List<Object?> get props =>
      [id, title, content, view, like, commentsNum, position, tag];
  @override
  Map<String, dynamic> toJson() => _$GetTypePost$Query$PostToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetTypePost$Query extends JsonSerializable with EquatableMixin {
  GetTypePost$Query();

  factory GetTypePost$Query.fromJson(Map<String, dynamic> json) =>
      _$GetTypePost$QueryFromJson(json);

  List<GetTypePost$Query$Post?>? posts;

  @override
  List<Object?> get props => [posts];
  @override
  Map<String, dynamic> toJson() => _$GetTypePost$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Block$Mutation extends JsonSerializable with EquatableMixin {
  Block$Mutation();

  factory Block$Mutation.fromJson(Map<String, dynamic> json) =>
      _$Block$MutationFromJson(json);

  late bool blockUser;

  @override
  List<Object?> get props => [blockUser];
  @override
  Map<String, dynamic> toJson() => _$Block$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Follow$Mutation extends JsonSerializable with EquatableMixin {
  Follow$Mutation();

  factory Follow$Mutation.fromJson(Map<String, dynamic> json) =>
      _$Follow$MutationFromJson(json);

  late bool followUser;

  @override
  List<Object?> get props => [followUser];
  @override
  Map<String, dynamic> toJson() => _$Follow$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetMessages$Query$Message extends JsonSerializable with EquatableMixin {
  GetMessages$Query$Message();

  factory GetMessages$Query$Message.fromJson(Map<String, dynamic> json) =>
      _$GetMessages$Query$MessageFromJson(json);

  late int messageId;

  late int userFrom;

  late String content;

  DateTime? createdAt;

  @override
  List<Object?> get props => [messageId, userFrom, content, createdAt];
  @override
  Map<String, dynamic> toJson() => _$GetMessages$Query$MessageToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetMessages$Query extends JsonSerializable with EquatableMixin {
  GetMessages$Query();

  factory GetMessages$Query.fromJson(Map<String, dynamic> json) =>
      _$GetMessages$QueryFromJson(json);

  late List<GetMessages$Query$Message> myMessage;

  @override
  List<Object?> get props => [myMessage];
  @override
  Map<String, dynamic> toJson() => _$GetMessages$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetUserById$Query$User$User extends JsonSerializable with EquatableMixin {
  GetUserById$Query$User$User();

  factory GetUserById$Query$User$User.fromJson(Map<String, dynamic> json) =>
      _$GetUserById$Query$User$UserFromJson(json);

  late int id;

  late String loginName;

  String? nickname;

  String? avatar;

  @override
  List<Object?> get props => [id, loginName, nickname, avatar];
  @override
  Map<String, dynamic> toJson() => _$GetUserById$Query$User$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetUserById$Query$User extends JsonSerializable with EquatableMixin {
  GetUserById$Query$User();

  factory GetUserById$Query$User.fromJson(Map<String, dynamic> json) =>
      _$GetUserById$Query$UserFromJson(json);

  late String loginName;

  String? nickname;

  String? about;

  String? avatar;

  List<GetUserById$Query$User$User?>? follow;

  @override
  List<Object?> get props => [loginName, nickname, about, avatar, follow];
  @override
  Map<String, dynamic> toJson() => _$GetUserById$Query$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetUserById$Query extends JsonSerializable with EquatableMixin {
  GetUserById$Query();

  factory GetUserById$Query.fromJson(Map<String, dynamic> json) =>
      _$GetUserById$QueryFromJson(json);

  late GetUserById$Query$User getUserById;

  @override
  List<Object?> get props => [getUserById];
  @override
  Map<String, dynamic> toJson() => _$GetUserById$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MyFollow$Query$User$User extends JsonSerializable with EquatableMixin {
  MyFollow$Query$User$User();

  factory MyFollow$Query$User$User.fromJson(Map<String, dynamic> json) =>
      _$MyFollow$Query$User$UserFromJson(json);

  late int id;

  String? nickname;

  late String loginName;

  String? avatar;

  @override
  List<Object?> get props => [id, nickname, loginName, avatar];
  @override
  Map<String, dynamic> toJson() => _$MyFollow$Query$User$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MyFollow$Query$User extends JsonSerializable with EquatableMixin {
  MyFollow$Query$User();

  factory MyFollow$Query$User.fromJson(Map<String, dynamic> json) =>
      _$MyFollow$Query$UserFromJson(json);

  List<MyFollow$Query$User$User?>? follow;

  List<MyFollow$Query$User$User?>? block;

  @override
  List<Object?> get props => [follow, block];
  @override
  Map<String, dynamic> toJson() => _$MyFollow$Query$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MyFollow$Query extends JsonSerializable with EquatableMixin {
  MyFollow$Query();

  factory MyFollow$Query.fromJson(Map<String, dynamic> json) =>
      _$MyFollow$QueryFromJson(json);

  late MyFollow$Query$User me;

  @override
  List<Object?> get props => [me];
  @override
  Map<String, dynamic> toJson() => _$MyFollow$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ReceiveMessage$Subscription$Message extends JsonSerializable
    with EquatableMixin {
  ReceiveMessage$Subscription$Message();

  factory ReceiveMessage$Subscription$Message.fromJson(
          Map<String, dynamic> json) =>
      _$ReceiveMessage$Subscription$MessageFromJson(json);

  late int messageId;

  late int userFrom;

  late int userTo;

  late String content;

  DateTime? createdAt;

  @override
  List<Object?> get props => [messageId, userFrom, userTo, content, createdAt];
  @override
  Map<String, dynamic> toJson() =>
      _$ReceiveMessage$Subscription$MessageToJson(this);
}

@JsonSerializable(explicitToJson: true)
class ReceiveMessage$Subscription extends JsonSerializable with EquatableMixin {
  ReceiveMessage$Subscription();

  factory ReceiveMessage$Subscription.fromJson(Map<String, dynamic> json) =>
      _$ReceiveMessage$SubscriptionFromJson(json);

  late ReceiveMessage$Subscription$Message messageToMe;

  @override
  List<Object?> get props => [messageToMe];
  @override
  Map<String, dynamic> toJson() => _$ReceiveMessage$SubscriptionToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Unblock$Mutation extends JsonSerializable with EquatableMixin {
  Unblock$Mutation();

  factory Unblock$Mutation.fromJson(Map<String, dynamic> json) =>
      _$Unblock$MutationFromJson(json);

  late bool unblockUser;

  @override
  List<Object?> get props => [unblockUser];
  @override
  Map<String, dynamic> toJson() => _$Unblock$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Unfollow$Mutation extends JsonSerializable with EquatableMixin {
  Unfollow$Mutation();

  factory Unfollow$Mutation.fromJson(Map<String, dynamic> json) =>
      _$Unfollow$MutationFromJson(json);

  late bool unfollowUser;

  @override
  List<Object?> get props => [unfollowUser];
  @override
  Map<String, dynamic> toJson() => _$Unfollow$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetUserPost$Query$User$Post extends JsonSerializable with EquatableMixin {
  GetUserPost$Query$User$Post();

  factory GetUserPost$Query$User$Post.fromJson(Map<String, dynamic> json) =>
      _$GetUserPost$Query$User$PostFromJson(json);

  late int id;

  String? title;

  String? content;

  int? view;

  int? like;

  @JsonKey(name: 'comments_num')
  int? commentsNum;

  String? position;

  String? tag;

  @override
  List<Object?> get props =>
      [id, title, content, view, like, commentsNum, position, tag];
  @override
  Map<String, dynamic> toJson() => _$GetUserPost$Query$User$PostToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetUserPost$Query$User extends JsonSerializable with EquatableMixin {
  GetUserPost$Query$User();

  factory GetUserPost$Query$User.fromJson(Map<String, dynamic> json) =>
      _$GetUserPost$Query$UserFromJson(json);

  List<GetUserPost$Query$User$Post?>? post;

  @override
  List<Object?> get props => [post];
  @override
  Map<String, dynamic> toJson() => _$GetUserPost$Query$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetUserPost$Query extends JsonSerializable with EquatableMixin {
  GetUserPost$Query();

  factory GetUserPost$Query.fromJson(Map<String, dynamic> json) =>
      _$GetUserPost$QueryFromJson(json);

  late GetUserPost$Query$User getUserById;

  @override
  List<Object?> get props => [getUserById];
  @override
  Map<String, dynamic> toJson() => _$GetUserPost$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class MessageNum$Query extends JsonSerializable with EquatableMixin {
  MessageNum$Query();

  factory MessageNum$Query.fromJson(Map<String, dynamic> json) =>
      _$MessageNum$QueryFromJson(json);

  late int messageNum;

  @override
  List<Object?> get props => [messageNum];
  @override
  Map<String, dynamic> toJson() => _$MessageNum$QueryToJson(this);
}

@JsonSerializable(explicitToJson: true)
class SendMessage$Mutation extends JsonSerializable with EquatableMixin {
  SendMessage$Mutation();

  factory SendMessage$Mutation.fromJson(Map<String, dynamic> json) =>
      _$SendMessage$MutationFromJson(json);

  late bool sendMessage;

  @override
  List<Object?> get props => [sendMessage];
  @override
  Map<String, dynamic> toJson() => _$SendMessage$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetFollowPost$Query$Post$User extends JsonSerializable
    with EquatableMixin {
  GetFollowPost$Query$Post$User();

  factory GetFollowPost$Query$Post$User.fromJson(Map<String, dynamic> json) =>
      _$GetFollowPost$Query$Post$UserFromJson(json);

  late int id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() => _$GetFollowPost$Query$Post$UserToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetFollowPost$Query$Post extends JsonSerializable with EquatableMixin {
  GetFollowPost$Query$Post();

  factory GetFollowPost$Query$Post.fromJson(Map<String, dynamic> json) =>
      _$GetFollowPost$Query$PostFromJson(json);

  late int id;

  String? title;

  String? content;

  int? view;

  int? like;

  @JsonKey(name: 'comments_num')
  int? commentsNum;

  String? position;

  String? tag;

  GetFollowPost$Query$Post$User? user;

  @override
  List<Object?> get props =>
      [id, title, content, view, like, commentsNum, position, tag, user];
  @override
  Map<String, dynamic> toJson() => _$GetFollowPost$Query$PostToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetFollowPost$Query extends JsonSerializable with EquatableMixin {
  GetFollowPost$Query();

  factory GetFollowPost$Query.fromJson(Map<String, dynamic> json) =>
      _$GetFollowPost$QueryFromJson(json);

  List<GetFollowPost$Query$Post?>? posts;

  @override
  List<Object?> get props => [posts];
  @override
  Map<String, dynamic> toJson() => _$GetFollowPost$QueryToJson(this);
}

enum PostOrderBy {
  @JsonValue('post_id')
  postId,
  @JsonValue('title')
  title,
  @JsonValue('content')
  content,
  @JsonValue('view')
  view,
  @JsonValue('like')
  like,
  @JsonValue('userId')
  userId,
  @JsonValue('created_at')
  createdAt,
  @JsonValue('updated_at')
  updatedAt,
  @JsonValue('comments_num')
  commentsNum,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}

enum Order {
  @JsonValue('ASC')
  asc,
  @JsonValue('DESC')
  desc,
  @JsonValue('ARTEMIS_UNKNOWN')
  artemisUnknown,
}

@JsonSerializable(explicitToJson: true)
class DislikeArguments extends JsonSerializable with EquatableMixin {
  DislikeArguments({required this.postId});

  @override
  factory DislikeArguments.fromJson(Map<String, dynamic> json) =>
      _$DislikeArgumentsFromJson(json);

  late int postId;

  @override
  List<Object?> get props => [postId];
  @override
  Map<String, dynamic> toJson() => _$DislikeArgumentsToJson(this);
}

final DISLIKE_MUTATION_DOCUMENT_OPERATION_NAME = 'dislike';
final DISLIKE_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'dislike'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'postId')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'dislikePost'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: VariableNode(name: NameNode(value: 'postId')),
          )
        ],
        directives: [],
        selectionSet: null,
      )
    ]),
  )
]);

class DislikeMutation extends GraphQLQuery<Dislike$Mutation, DislikeArguments> {
  DislikeMutation({required this.variables});

  @override
  final DocumentNode document = DISLIKE_MUTATION_DOCUMENT;

  @override
  final String operationName = DISLIKE_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final DislikeArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  Dislike$Mutation parse(Map<String, dynamic> json) =>
      Dislike$Mutation.fromJson(json);
}

final GET_COMMENT_LISTS_QUERY_DOCUMENT_OPERATION_NAME = 'getCommentLists';
final GET_COMMENT_LISTS_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getCommentLists'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'comment'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'limit'),
                value: IntValueNode(value: '10000'),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'offset'),
                value: IntValueNode(value: '0'),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'orderBy'),
                value: EnumValueNode(name: NameNode(value: 'comment_id')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'order'),
                value: EnumValueNode(name: NameNode(value: 'DESC')),
              ),
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'content'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'post'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              )
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'user'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'loginName'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
        ]),
      )
    ]),
  )
]);

class GetCommentListsQuery
    extends GraphQLQuery<GetCommentLists$Query, JsonSerializable> {
  GetCommentListsQuery();

  @override
  final DocumentNode document = GET_COMMENT_LISTS_QUERY_DOCUMENT;

  @override
  final String operationName = GET_COMMENT_LISTS_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  List<Object?> get props => [document, operationName];
  @override
  GetCommentLists$Query parse(Map<String, dynamic> json) =>
      GetCommentLists$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class GetFavoritePostArguments extends JsonSerializable with EquatableMixin {
  GetFavoritePostArguments({required this.userId});

  @override
  factory GetFavoritePostArguments.fromJson(Map<String, dynamic> json) =>
      _$GetFavoritePostArgumentsFromJson(json);

  late int userId;

  @override
  List<Object?> get props => [userId];
  @override
  Map<String, dynamic> toJson() => _$GetFavoritePostArgumentsToJson(this);
}

final GET_FAVORITE_POST_QUERY_DOCUMENT_OPERATION_NAME = 'getFavoritePost';
final GET_FAVORITE_POST_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getFavoritePost'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'userId')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'getUserFavoritePost'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: VariableNode(name: NameNode(value: 'userId')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'title'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'content'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'view'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'like'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'comments_num'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'position'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'tag'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      )
    ]),
  )
]);

class GetFavoritePostQuery
    extends GraphQLQuery<GetFavoritePost$Query, GetFavoritePostArguments> {
  GetFavoritePostQuery({required this.variables});

  @override
  final DocumentNode document = GET_FAVORITE_POST_QUERY_DOCUMENT;

  @override
  final String operationName = GET_FAVORITE_POST_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final GetFavoritePostArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  GetFavoritePost$Query parse(Map<String, dynamic> json) =>
      GetFavoritePost$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class GetPostListsArguments extends JsonSerializable with EquatableMixin {
  GetPostListsArguments({
    required this.offset,
    required this.orderBy,
    required this.order,
  });

  @override
  factory GetPostListsArguments.fromJson(Map<String, dynamic> json) =>
      _$GetPostListsArgumentsFromJson(json);

  late int offset;

  @JsonKey(unknownEnumValue: PostOrderBy.artemisUnknown)
  late PostOrderBy orderBy;

  @JsonKey(unknownEnumValue: Order.artemisUnknown)
  late Order order;

  @override
  List<Object?> get props => [offset, orderBy, order];
  @override
  Map<String, dynamic> toJson() => _$GetPostListsArgumentsToJson(this);
}

final GET_POST_LISTS_QUERY_DOCUMENT_OPERATION_NAME = 'getPostLists';
final GET_POST_LISTS_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getPostLists'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'offset')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'orderBy')),
        type: NamedTypeNode(
          name: NameNode(value: 'PostOrderBy'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'order')),
        type: NamedTypeNode(
          name: NameNode(value: 'Order'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'posts'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'limit'),
                value: IntValueNode(value: '10'),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'offset'),
                value: VariableNode(name: NameNode(value: 'offset')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'orderBy'),
                value: VariableNode(name: NameNode(value: 'orderBy')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'order'),
                value: VariableNode(name: NameNode(value: 'order')),
              ),
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'title'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'content'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'view'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'like'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'comments_num'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'position'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'tag'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'user'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              )
            ]),
          ),
        ]),
      )
    ]),
  )
]);

class GetPostListsQuery
    extends GraphQLQuery<GetPostLists$Query, GetPostListsArguments> {
  GetPostListsQuery({required this.variables});

  @override
  final DocumentNode document = GET_POST_LISTS_QUERY_DOCUMENT;

  @override
  final String operationName = GET_POST_LISTS_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final GetPostListsArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  GetPostLists$Query parse(Map<String, dynamic> json) =>
      GetPostLists$Query.fromJson(json);
}

final GET_PROFILE_QUERY_DOCUMENT_OPERATION_NAME = 'getProfile';
final GET_PROFILE_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getProfile'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'me'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'loginName'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'nickname'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'about'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'avatar'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      )
    ]),
  )
]);

class GetProfileQuery extends GraphQLQuery<GetProfile$Query, JsonSerializable> {
  GetProfileQuery();

  @override
  final DocumentNode document = GET_PROFILE_QUERY_DOCUMENT;

  @override
  final String operationName = GET_PROFILE_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  List<Object?> get props => [document, operationName];
  @override
  GetProfile$Query parse(Map<String, dynamic> json) =>
      GetProfile$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class GlobalSearchArguments extends JsonSerializable with EquatableMixin {
  GlobalSearchArguments({required this.keyWord});

  @override
  factory GlobalSearchArguments.fromJson(Map<String, dynamic> json) =>
      _$GlobalSearchArgumentsFromJson(json);

  late String keyWord;

  @override
  List<Object?> get props => [keyWord];
  @override
  Map<String, dynamic> toJson() => _$GlobalSearchArgumentsToJson(this);
}

final GLOBAL_SEARCH_QUERY_DOCUMENT_OPERATION_NAME = 'globalSearch';
final GLOBAL_SEARCH_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'globalSearch'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'keyWord')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'globalSearch'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'query'),
            value: VariableNode(name: NameNode(value: 'keyWord')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'title'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'content'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'view'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'like'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'comments_num'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'position'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'tag'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      )
    ]),
  )
]);

class GlobalSearchQuery
    extends GraphQLQuery<GlobalSearch$Query, GlobalSearchArguments> {
  GlobalSearchQuery({required this.variables});

  @override
  final DocumentNode document = GLOBAL_SEARCH_QUERY_DOCUMENT;

  @override
  final String operationName = GLOBAL_SEARCH_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final GlobalSearchArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  GlobalSearch$Query parse(Map<String, dynamic> json) =>
      GlobalSearch$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class LikeArguments extends JsonSerializable with EquatableMixin {
  LikeArguments({required this.postId});

  @override
  factory LikeArguments.fromJson(Map<String, dynamic> json) =>
      _$LikeArgumentsFromJson(json);

  late int postId;

  @override
  List<Object?> get props => [postId];
  @override
  Map<String, dynamic> toJson() => _$LikeArgumentsToJson(this);
}

final LIKE_MUTATION_DOCUMENT_OPERATION_NAME = 'like';
final LIKE_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'like'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'postId')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'likePost'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: VariableNode(name: NameNode(value: 'postId')),
          )
        ],
        directives: [],
        selectionSet: null,
      )
    ]),
  )
]);

class LikeMutation extends GraphQLQuery<Like$Mutation, LikeArguments> {
  LikeMutation({required this.variables});

  @override
  final DocumentNode document = LIKE_MUTATION_DOCUMENT;

  @override
  final String operationName = LIKE_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final LikeArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  Like$Mutation parse(Map<String, dynamic> json) =>
      Like$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class MarkArguments extends JsonSerializable with EquatableMixin {
  MarkArguments({required this.postId});

  @override
  factory MarkArguments.fromJson(Map<String, dynamic> json) =>
      _$MarkArgumentsFromJson(json);

  late int postId;

  @override
  List<Object?> get props => [postId];
  @override
  Map<String, dynamic> toJson() => _$MarkArgumentsToJson(this);
}

final MARK_MUTATION_DOCUMENT_OPERATION_NAME = 'mark';
final MARK_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'mark'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'postId')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'markPost'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: VariableNode(name: NameNode(value: 'postId')),
          )
        ],
        directives: [],
        selectionSet: null,
      )
    ]),
  )
]);

class MarkMutation extends GraphQLQuery<Mark$Mutation, MarkArguments> {
  MarkMutation({required this.variables});

  @override
  final DocumentNode document = MARK_MUTATION_DOCUMENT;

  @override
  final String operationName = MARK_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final MarkArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  Mark$Mutation parse(Map<String, dynamic> json) =>
      Mark$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class NewCommentArguments extends JsonSerializable with EquatableMixin {
  NewCommentArguments({
    required this.userId,
    required this.postId,
    this.content,
  });

  @override
  factory NewCommentArguments.fromJson(Map<String, dynamic> json) =>
      _$NewCommentArgumentsFromJson(json);

  late int userId;

  late int postId;

  final String? content;

  @override
  List<Object?> get props => [userId, postId, content];
  @override
  Map<String, dynamic> toJson() => _$NewCommentArgumentsToJson(this);
}

final NEW_COMMENT_MUTATION_DOCUMENT_OPERATION_NAME = 'newComment';
final NEW_COMMENT_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'newComment'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'userId')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'postId')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'content')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'createComment'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'userId'),
                value: VariableNode(name: NameNode(value: 'userId')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'postId'),
                value: VariableNode(name: NameNode(value: 'postId')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'content'),
                value: VariableNode(name: NameNode(value: 'content')),
              ),
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'content'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      )
    ]),
  )
]);

class NewCommentMutation
    extends GraphQLQuery<NewComment$Mutation, NewCommentArguments> {
  NewCommentMutation({required this.variables});

  @override
  final DocumentNode document = NEW_COMMENT_MUTATION_DOCUMENT;

  @override
  final String operationName = NEW_COMMENT_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final NewCommentArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  NewComment$Mutation parse(Map<String, dynamic> json) =>
      NewComment$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class NewPostArguments extends JsonSerializable with EquatableMixin {
  NewPostArguments({
    required this.userId,
    required this.title,
    required this.content,
    this.tag,
    this.position,
  });

  @override
  factory NewPostArguments.fromJson(Map<String, dynamic> json) =>
      _$NewPostArgumentsFromJson(json);

  late int userId;

  late String title;

  late String content;

  final String? tag;

  final String? position;

  @override
  List<Object?> get props => [userId, title, content, tag, position];
  @override
  Map<String, dynamic> toJson() => _$NewPostArgumentsToJson(this);
}

final NEW_POST_MUTATION_DOCUMENT_OPERATION_NAME = 'newPost';
final NEW_POST_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'newPost'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'userId')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'title')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'content')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'tag')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'position')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'createPost'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'userId'),
                value: VariableNode(name: NameNode(value: 'userId')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'title'),
                value: VariableNode(name: NameNode(value: 'title')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'content'),
                value: VariableNode(name: NameNode(value: 'content')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'tag'),
                value: VariableNode(name: NameNode(value: 'tag')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'position'),
                value: VariableNode(name: NameNode(value: 'position')),
              ),
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'title'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      )
    ]),
  )
]);

class NewPostMutation extends GraphQLQuery<NewPost$Mutation, NewPostArguments> {
  NewPostMutation({required this.variables});

  @override
  final DocumentNode document = NEW_POST_MUTATION_DOCUMENT;

  @override
  final String operationName = NEW_POST_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final NewPostArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  NewPost$Mutation parse(Map<String, dynamic> json) =>
      NewPost$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class RegisterArguments extends JsonSerializable with EquatableMixin {
  RegisterArguments({
    required this.loginName,
    required this.password,
  });

  @override
  factory RegisterArguments.fromJson(Map<String, dynamic> json) =>
      _$RegisterArgumentsFromJson(json);

  late String loginName;

  late String password;

  @override
  List<Object?> get props => [loginName, password];
  @override
  Map<String, dynamic> toJson() => _$RegisterArgumentsToJson(this);
}

final REGISTER_MUTATION_DOCUMENT_OPERATION_NAME = 'register';
final REGISTER_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'register'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'loginName')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'password')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'createUser'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'loginName'),
                value: VariableNode(name: NameNode(value: 'loginName')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'password'),
                value: VariableNode(name: NameNode(value: 'password')),
              ),
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'loginName'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      )
    ]),
  )
]);

class RegisterMutation
    extends GraphQLQuery<Register$Mutation, RegisterArguments> {
  RegisterMutation({required this.variables});

  @override
  final DocumentNode document = REGISTER_MUTATION_DOCUMENT;

  @override
  final String operationName = REGISTER_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final RegisterArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  Register$Mutation parse(Map<String, dynamic> json) =>
      Register$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class SetProfileArguments extends JsonSerializable with EquatableMixin {
  SetProfileArguments({
    this.nickname,
    this.password,
    this.about,
    this.avatar,
  });

  @override
  factory SetProfileArguments.fromJson(Map<String, dynamic> json) =>
      _$SetProfileArgumentsFromJson(json);

  final String? nickname;

  final String? password;

  final String? about;

  final String? avatar;

  @override
  List<Object?> get props => [nickname, password, about, avatar];
  @override
  Map<String, dynamic> toJson() => _$SetProfileArgumentsToJson(this);
}

final SET_PROFILE_MUTATION_DOCUMENT_OPERATION_NAME = 'setProfile';
final SET_PROFILE_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'setProfile'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'nickname')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'password')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'about')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'avatar')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: false,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'updateUser'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'nickname'),
                value: VariableNode(name: NameNode(value: 'nickname')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'password'),
                value: VariableNode(name: NameNode(value: 'password')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'about'),
                value: VariableNode(name: NameNode(value: 'about')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'avatar'),
                value: VariableNode(name: NameNode(value: 'avatar')),
              ),
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          )
        ]),
      )
    ]),
  )
]);

class SetProfileMutation
    extends GraphQLQuery<SetProfile$Mutation, SetProfileArguments> {
  SetProfileMutation({required this.variables});

  @override
  final DocumentNode document = SET_PROFILE_MUTATION_DOCUMENT;

  @override
  final String operationName = SET_PROFILE_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final SetProfileArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  SetProfile$Mutation parse(Map<String, dynamic> json) =>
      SetProfile$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class UnmarkArguments extends JsonSerializable with EquatableMixin {
  UnmarkArguments({required this.postId});

  @override
  factory UnmarkArguments.fromJson(Map<String, dynamic> json) =>
      _$UnmarkArgumentsFromJson(json);

  late int postId;

  @override
  List<Object?> get props => [postId];
  @override
  Map<String, dynamic> toJson() => _$UnmarkArgumentsToJson(this);
}

final UNMARK_MUTATION_DOCUMENT_OPERATION_NAME = 'unmark';
final UNMARK_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'unmark'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'postId')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'unmarkPost'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: VariableNode(name: NameNode(value: 'postId')),
          )
        ],
        directives: [],
        selectionSet: null,
      )
    ]),
  )
]);

class UnmarkMutation extends GraphQLQuery<Unmark$Mutation, UnmarkArguments> {
  UnmarkMutation({required this.variables});

  @override
  final DocumentNode document = UNMARK_MUTATION_DOCUMENT;

  @override
  final String operationName = UNMARK_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final UnmarkArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  Unmark$Mutation parse(Map<String, dynamic> json) =>
      Unmark$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class LoginArguments extends JsonSerializable with EquatableMixin {
  LoginArguments({
    required this.loginName,
    required this.password,
  });

  @override
  factory LoginArguments.fromJson(Map<String, dynamic> json) =>
      _$LoginArgumentsFromJson(json);

  late String loginName;

  late String password;

  @override
  List<Object?> get props => [loginName, password];
  @override
  Map<String, dynamic> toJson() => _$LoginArgumentsToJson(this);
}

final LOGIN_MUTATION_DOCUMENT_OPERATION_NAME = 'login';
final LOGIN_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'login'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'loginName')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'password')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'login'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'loginName'),
                value: VariableNode(name: NameNode(value: 'loginName')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'password'),
                value: VariableNode(name: NameNode(value: 'password')),
              ),
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'token'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'userId'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      )
    ]),
  )
]);

class LoginMutation extends GraphQLQuery<Login$Mutation, LoginArguments> {
  LoginMutation({required this.variables});

  @override
  final DocumentNode document = LOGIN_MUTATION_DOCUMENT;

  @override
  final String operationName = LOGIN_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final LoginArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  Login$Mutation parse(Map<String, dynamic> json) =>
      Login$Mutation.fromJson(json);
}

final LOGOUT_MUTATION_DOCUMENT_OPERATION_NAME = 'logout';
final LOGOUT_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'logout'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'logout'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: null,
      )
    ]),
  )
]);

class LogoutMutation extends GraphQLQuery<Logout$Mutation, JsonSerializable> {
  LogoutMutation();

  @override
  final DocumentNode document = LOGOUT_MUTATION_DOCUMENT;

  @override
  final String operationName = LOGOUT_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  List<Object?> get props => [document, operationName];
  @override
  Logout$Mutation parse(Map<String, dynamic> json) =>
      Logout$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class GetTypePostArguments extends JsonSerializable with EquatableMixin {
  GetTypePostArguments({required this.tags});

  @override
  factory GetTypePostArguments.fromJson(Map<String, dynamic> json) =>
      _$GetTypePostArgumentsFromJson(json);

  late String tags;

  @override
  List<Object?> get props => [tags];
  @override
  Map<String, dynamic> toJson() => _$GetTypePostArgumentsToJson(this);
}

final GET_TYPE_POST_QUERY_DOCUMENT_OPERATION_NAME = 'getTypePost';
final GET_TYPE_POST_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getTypePost'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'tags')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'posts'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'tags'),
                value: VariableNode(name: NameNode(value: 'tags')),
              )
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'title'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'content'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'view'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'like'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'comments_num'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'position'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'tag'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      )
    ]),
  )
]);

class GetTypePostQuery
    extends GraphQLQuery<GetTypePost$Query, GetTypePostArguments> {
  GetTypePostQuery({required this.variables});

  @override
  final DocumentNode document = GET_TYPE_POST_QUERY_DOCUMENT;

  @override
  final String operationName = GET_TYPE_POST_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final GetTypePostArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  GetTypePost$Query parse(Map<String, dynamic> json) =>
      GetTypePost$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class BlockArguments extends JsonSerializable with EquatableMixin {
  BlockArguments({required this.userId});

  @override
  factory BlockArguments.fromJson(Map<String, dynamic> json) =>
      _$BlockArgumentsFromJson(json);

  late int userId;

  @override
  List<Object?> get props => [userId];
  @override
  Map<String, dynamic> toJson() => _$BlockArgumentsToJson(this);
}

final BLOCK_MUTATION_DOCUMENT_OPERATION_NAME = 'block';
final BLOCK_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'block'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'userId')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'blockUser'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: VariableNode(name: NameNode(value: 'userId')),
          )
        ],
        directives: [],
        selectionSet: null,
      )
    ]),
  )
]);

class BlockMutation extends GraphQLQuery<Block$Mutation, BlockArguments> {
  BlockMutation({required this.variables});

  @override
  final DocumentNode document = BLOCK_MUTATION_DOCUMENT;

  @override
  final String operationName = BLOCK_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final BlockArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  Block$Mutation parse(Map<String, dynamic> json) =>
      Block$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class FollowArguments extends JsonSerializable with EquatableMixin {
  FollowArguments({required this.userId});

  @override
  factory FollowArguments.fromJson(Map<String, dynamic> json) =>
      _$FollowArgumentsFromJson(json);

  late int userId;

  @override
  List<Object?> get props => [userId];
  @override
  Map<String, dynamic> toJson() => _$FollowArgumentsToJson(this);
}

final FOLLOW_MUTATION_DOCUMENT_OPERATION_NAME = 'follow';
final FOLLOW_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'follow'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'userId')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'followUser'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: VariableNode(name: NameNode(value: 'userId')),
          )
        ],
        directives: [],
        selectionSet: null,
      )
    ]),
  )
]);

class FollowMutation extends GraphQLQuery<Follow$Mutation, FollowArguments> {
  FollowMutation({required this.variables});

  @override
  final DocumentNode document = FOLLOW_MUTATION_DOCUMENT;

  @override
  final String operationName = FOLLOW_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final FollowArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  Follow$Mutation parse(Map<String, dynamic> json) =>
      Follow$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class GetMessagesArguments extends JsonSerializable with EquatableMixin {
  GetMessagesArguments({
    required this.userId,
    required this.offset,
    required this.limit,
  });

  @override
  factory GetMessagesArguments.fromJson(Map<String, dynamic> json) =>
      _$GetMessagesArgumentsFromJson(json);

  late int userId;

  late int offset;

  late int limit;

  @override
  List<Object?> get props => [userId, offset, limit];
  @override
  Map<String, dynamic> toJson() => _$GetMessagesArgumentsToJson(this);
}

final GET_MESSAGES_QUERY_DOCUMENT_OPERATION_NAME = 'getMessages';
final GET_MESSAGES_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getMessages'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'userId')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'offset')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'limit')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'myMessage'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'from'),
            value: VariableNode(name: NameNode(value: 'userId')),
          ),
          ArgumentNode(
            name: NameNode(value: 'offset'),
            value: VariableNode(name: NameNode(value: 'offset')),
          ),
          ArgumentNode(
            name: NameNode(value: 'limit'),
            value: VariableNode(name: NameNode(value: 'limit')),
          ),
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'messageId'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'userFrom'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'content'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      )
    ]),
  )
]);

class GetMessagesQuery
    extends GraphQLQuery<GetMessages$Query, GetMessagesArguments> {
  GetMessagesQuery({required this.variables});

  @override
  final DocumentNode document = GET_MESSAGES_QUERY_DOCUMENT;

  @override
  final String operationName = GET_MESSAGES_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final GetMessagesArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  GetMessages$Query parse(Map<String, dynamic> json) =>
      GetMessages$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class GetUserByIdArguments extends JsonSerializable with EquatableMixin {
  GetUserByIdArguments({required this.id});

  @override
  factory GetUserByIdArguments.fromJson(Map<String, dynamic> json) =>
      _$GetUserByIdArgumentsFromJson(json);

  late int id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() => _$GetUserByIdArgumentsToJson(this);
}

final GET_USER_BY_ID_QUERY_DOCUMENT_OPERATION_NAME = 'getUserById';
final GET_USER_BY_ID_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getUserById'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'getUserById'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: VariableNode(name: NameNode(value: 'id')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'loginName'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'nickname'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'about'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'avatar'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'follow'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'loginName'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'nickname'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'avatar'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
        ]),
      )
    ]),
  )
]);

class GetUserByIdQuery
    extends GraphQLQuery<GetUserById$Query, GetUserByIdArguments> {
  GetUserByIdQuery({required this.variables});

  @override
  final DocumentNode document = GET_USER_BY_ID_QUERY_DOCUMENT;

  @override
  final String operationName = GET_USER_BY_ID_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final GetUserByIdArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  GetUserById$Query parse(Map<String, dynamic> json) =>
      GetUserById$Query.fromJson(json);
}

final MY_FOLLOW_QUERY_DOCUMENT_OPERATION_NAME = 'myFollow';
final MY_FOLLOW_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'myFollow'),
    variableDefinitions: [],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'me'),
        alias: null,
        arguments: [],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'follow'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'nickname'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'loginName'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'avatar'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
          FieldNode(
            name: NameNode(value: 'block'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'nickname'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'loginName'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'avatar'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          ),
        ]),
      )
    ]),
  )
]);

class MyFollowQuery extends GraphQLQuery<MyFollow$Query, JsonSerializable> {
  MyFollowQuery();

  @override
  final DocumentNode document = MY_FOLLOW_QUERY_DOCUMENT;

  @override
  final String operationName = MY_FOLLOW_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  List<Object?> get props => [document, operationName];
  @override
  MyFollow$Query parse(Map<String, dynamic> json) =>
      MyFollow$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class ReceiveMessageArguments extends JsonSerializable with EquatableMixin {
  ReceiveMessageArguments({required this.token});

  @override
  factory ReceiveMessageArguments.fromJson(Map<String, dynamic> json) =>
      _$ReceiveMessageArgumentsFromJson(json);

  late String token;

  @override
  List<Object?> get props => [token];
  @override
  Map<String, dynamic> toJson() => _$ReceiveMessageArgumentsToJson(this);
}

final RECEIVE_MESSAGE_SUBSCRIPTION_DOCUMENT_OPERATION_NAME = 'receiveMessage';
final RECEIVE_MESSAGE_SUBSCRIPTION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.subscription,
    name: NameNode(value: 'receiveMessage'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'token')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'messageToMe'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'token'),
            value: VariableNode(name: NameNode(value: 'token')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'messageId'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'userFrom'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'userTo'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'content'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'createdAt'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
        ]),
      )
    ]),
  )
]);

class ReceiveMessageSubscription
    extends GraphQLQuery<ReceiveMessage$Subscription, ReceiveMessageArguments> {
  ReceiveMessageSubscription({required this.variables});

  @override
  final DocumentNode document = RECEIVE_MESSAGE_SUBSCRIPTION_DOCUMENT;

  @override
  final String operationName =
      RECEIVE_MESSAGE_SUBSCRIPTION_DOCUMENT_OPERATION_NAME;

  @override
  final ReceiveMessageArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  ReceiveMessage$Subscription parse(Map<String, dynamic> json) =>
      ReceiveMessage$Subscription.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class UnblockArguments extends JsonSerializable with EquatableMixin {
  UnblockArguments({required this.userId});

  @override
  factory UnblockArguments.fromJson(Map<String, dynamic> json) =>
      _$UnblockArgumentsFromJson(json);

  late int userId;

  @override
  List<Object?> get props => [userId];
  @override
  Map<String, dynamic> toJson() => _$UnblockArgumentsToJson(this);
}

final UNBLOCK_MUTATION_DOCUMENT_OPERATION_NAME = 'unblock';
final UNBLOCK_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'unblock'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'userId')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'unblockUser'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: VariableNode(name: NameNode(value: 'userId')),
          )
        ],
        directives: [],
        selectionSet: null,
      )
    ]),
  )
]);

class UnblockMutation extends GraphQLQuery<Unblock$Mutation, UnblockArguments> {
  UnblockMutation({required this.variables});

  @override
  final DocumentNode document = UNBLOCK_MUTATION_DOCUMENT;

  @override
  final String operationName = UNBLOCK_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final UnblockArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  Unblock$Mutation parse(Map<String, dynamic> json) =>
      Unblock$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class UnfollowArguments extends JsonSerializable with EquatableMixin {
  UnfollowArguments({required this.userId});

  @override
  factory UnfollowArguments.fromJson(Map<String, dynamic> json) =>
      _$UnfollowArgumentsFromJson(json);

  late int userId;

  @override
  List<Object?> get props => [userId];
  @override
  Map<String, dynamic> toJson() => _$UnfollowArgumentsToJson(this);
}

final UNFOLLOW_MUTATION_DOCUMENT_OPERATION_NAME = 'unfollow';
final UNFOLLOW_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'unfollow'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'userId')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'unfollowUser'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: VariableNode(name: NameNode(value: 'userId')),
          )
        ],
        directives: [],
        selectionSet: null,
      )
    ]),
  )
]);

class UnfollowMutation
    extends GraphQLQuery<Unfollow$Mutation, UnfollowArguments> {
  UnfollowMutation({required this.variables});

  @override
  final DocumentNode document = UNFOLLOW_MUTATION_DOCUMENT;

  @override
  final String operationName = UNFOLLOW_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final UnfollowArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  Unfollow$Mutation parse(Map<String, dynamic> json) =>
      Unfollow$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class GetUserPostArguments extends JsonSerializable with EquatableMixin {
  GetUserPostArguments({required this.id});

  @override
  factory GetUserPostArguments.fromJson(Map<String, dynamic> json) =>
      _$GetUserPostArgumentsFromJson(json);

  late int id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() => _$GetUserPostArgumentsToJson(this);
}

final GET_USER_POST_QUERY_DOCUMENT_OPERATION_NAME = 'getUserPost';
final GET_USER_POST_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getUserPost'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'getUserById'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: VariableNode(name: NameNode(value: 'id')),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'post'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'title'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'content'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'view'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'like'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'comments_num'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'position'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
              FieldNode(
                name: NameNode(value: 'tag'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              ),
            ]),
          )
        ]),
      )
    ]),
  )
]);

class GetUserPostQuery
    extends GraphQLQuery<GetUserPost$Query, GetUserPostArguments> {
  GetUserPostQuery({required this.variables});

  @override
  final DocumentNode document = GET_USER_POST_QUERY_DOCUMENT;

  @override
  final String operationName = GET_USER_POST_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final GetUserPostArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  GetUserPost$Query parse(Map<String, dynamic> json) =>
      GetUserPost$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class MessageNumArguments extends JsonSerializable with EquatableMixin {
  MessageNumArguments({required this.id});

  @override
  factory MessageNumArguments.fromJson(Map<String, dynamic> json) =>
      _$MessageNumArgumentsFromJson(json);

  late int id;

  @override
  List<Object?> get props => [id];
  @override
  Map<String, dynamic> toJson() => _$MessageNumArgumentsToJson(this);
}

final MESSAGE_NUM_QUERY_DOCUMENT_OPERATION_NAME = 'messageNum';
final MESSAGE_NUM_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'messageNum'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'id')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'messageNum'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'from'),
            value: VariableNode(name: NameNode(value: 'id')),
          )
        ],
        directives: [],
        selectionSet: null,
      )
    ]),
  )
]);

class MessageNumQuery
    extends GraphQLQuery<MessageNum$Query, MessageNumArguments> {
  MessageNumQuery({required this.variables});

  @override
  final DocumentNode document = MESSAGE_NUM_QUERY_DOCUMENT;

  @override
  final String operationName = MESSAGE_NUM_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final MessageNumArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  MessageNum$Query parse(Map<String, dynamic> json) =>
      MessageNum$Query.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class SendMessageArguments extends JsonSerializable with EquatableMixin {
  SendMessageArguments({
    required this.toId,
    required this.content,
  });

  @override
  factory SendMessageArguments.fromJson(Map<String, dynamic> json) =>
      _$SendMessageArgumentsFromJson(json);

  late int toId;

  late String content;

  @override
  List<Object?> get props => [toId, content];
  @override
  Map<String, dynamic> toJson() => _$SendMessageArgumentsToJson(this);
}

final SEND_MESSAGE_MUTATION_DOCUMENT_OPERATION_NAME = 'sendMessage';
final SEND_MESSAGE_MUTATION_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.mutation,
    name: NameNode(value: 'sendMessage'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'toId')),
        type: NamedTypeNode(
          name: NameNode(value: 'Int'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'content')),
        type: NamedTypeNode(
          name: NameNode(value: 'String'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      ),
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'sendMessage'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'toId'),
                value: VariableNode(name: NameNode(value: 'toId')),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'content'),
                value: VariableNode(name: NameNode(value: 'content')),
              ),
            ]),
          )
        ],
        directives: [],
        selectionSet: null,
      )
    ]),
  )
]);

class SendMessageMutation
    extends GraphQLQuery<SendMessage$Mutation, SendMessageArguments> {
  SendMessageMutation({required this.variables});

  @override
  final DocumentNode document = SEND_MESSAGE_MUTATION_DOCUMENT;

  @override
  final String operationName = SEND_MESSAGE_MUTATION_DOCUMENT_OPERATION_NAME;

  @override
  final SendMessageArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  SendMessage$Mutation parse(Map<String, dynamic> json) =>
      SendMessage$Mutation.fromJson(json);
}

@JsonSerializable(explicitToJson: true)
class GetFollowPostArguments extends JsonSerializable with EquatableMixin {
  GetFollowPostArguments({required this.follow});

  @override
  factory GetFollowPostArguments.fromJson(Map<String, dynamic> json) =>
      _$GetFollowPostArgumentsFromJson(json);

  late bool follow;

  @override
  List<Object?> get props => [follow];
  @override
  Map<String, dynamic> toJson() => _$GetFollowPostArgumentsToJson(this);
}

final GET_FOLLOW_POST_QUERY_DOCUMENT_OPERATION_NAME = 'getFollowPost';
final GET_FOLLOW_POST_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getFollowPost'),
    variableDefinitions: [
      VariableDefinitionNode(
        variable: VariableNode(name: NameNode(value: 'follow')),
        type: NamedTypeNode(
          name: NameNode(value: 'Boolean'),
          isNonNull: true,
        ),
        defaultValue: DefaultValueNode(value: null),
        directives: [],
      )
    ],
    directives: [],
    selectionSet: SelectionSetNode(selections: [
      FieldNode(
        name: NameNode(value: 'posts'),
        alias: null,
        arguments: [
          ArgumentNode(
            name: NameNode(value: 'input'),
            value: ObjectValueNode(fields: [
              ObjectFieldNode(
                name: NameNode(value: 'followed'),
                value: VariableNode(name: NameNode(value: 'follow')),
              )
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'id'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'title'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'content'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'view'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'like'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'comments_num'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'position'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'tag'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: null,
          ),
          FieldNode(
            name: NameNode(value: 'user'),
            alias: null,
            arguments: [],
            directives: [],
            selectionSet: SelectionSetNode(selections: [
              FieldNode(
                name: NameNode(value: 'id'),
                alias: null,
                arguments: [],
                directives: [],
                selectionSet: null,
              )
            ]),
          ),
        ]),
      )
    ]),
  )
]);

class GetFollowPostQuery
    extends GraphQLQuery<GetFollowPost$Query, GetFollowPostArguments> {
  GetFollowPostQuery({required this.variables});

  @override
  final DocumentNode document = GET_FOLLOW_POST_QUERY_DOCUMENT;

  @override
  final String operationName = GET_FOLLOW_POST_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  final GetFollowPostArguments variables;

  @override
  List<Object?> get props => [document, operationName, variables];
  @override
  GetFollowPost$Query parse(Map<String, dynamic> json) =>
      GetFollowPost$Query.fromJson(json);
}
