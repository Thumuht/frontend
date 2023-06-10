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

  late String loginName;

  @override
  List<Object?> get props => [loginName];
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

  @override
  List<Object?> get props =>
      [id, title, content, view, like, commentsNum, position, tag];
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
                name: NameNode(value: 'loginName'),
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
class GetPostListsArguments extends JsonSerializable with EquatableMixin {
  GetPostListsArguments({
    required this.offset,
    required this.orderBy,
  });

  @override
  factory GetPostListsArguments.fromJson(Map<String, dynamic> json) =>
      _$GetPostListsArgumentsFromJson(json);

  late int offset;

  @JsonKey(unknownEnumValue: PostOrderBy.artemisUnknown)
  late PostOrderBy orderBy;

  @override
  List<Object?> get props => [offset, orderBy];
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
                value: EnumValueNode(name: NameNode(value: 'ASC')),
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
