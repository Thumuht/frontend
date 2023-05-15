// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'graphql_api.graphql.g.dart';

@JsonSerializable(explicitToJson: true)
class NewComment$Mutation$Post extends JsonSerializable with EquatableMixin {
  NewComment$Mutation$Post();

  factory NewComment$Mutation$Post.fromJson(Map<String, dynamic> json) =>
      _$NewComment$Mutation$PostFromJson(json);

  String? content;

  @override
  List<Object?> get props => [content];
  @override
  Map<String, dynamic> toJson() => _$NewComment$Mutation$PostToJson(this);
}

@JsonSerializable(explicitToJson: true)
class NewComment$Mutation extends JsonSerializable with EquatableMixin {
  NewComment$Mutation();

  factory NewComment$Mutation.fromJson(Map<String, dynamic> json) =>
      _$NewComment$MutationFromJson(json);

  late NewComment$Mutation$Post createPost;

  @override
  List<Object?> get props => [createPost];
  @override
  Map<String, dynamic> toJson() => _$NewComment$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class NewPost$Mutation$Post extends JsonSerializable with EquatableMixin {
  NewPost$Mutation$Post();

  factory NewPost$Mutation$Post.fromJson(Map<String, dynamic> json) =>
      _$NewPost$Mutation$PostFromJson(json);

  String? title;

  @override
  List<Object?> get props => [title];
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
class Login$Mutation extends JsonSerializable with EquatableMixin {
  Login$Mutation();

  factory Login$Mutation.fromJson(Map<String, dynamic> json) =>
      _$Login$MutationFromJson(json);

  late String login;

  @override
  List<Object?> get props => [login];
  @override
  Map<String, dynamic> toJson() => _$Login$MutationToJson(this);
}

@JsonSerializable(explicitToJson: true)
class GetPostLists$Query$Post extends JsonSerializable with EquatableMixin {
  GetPostLists$Query$Post();

  factory GetPostLists$Query$Post.fromJson(Map<String, dynamic> json) =>
      _$GetPostLists$Query$PostFromJson(json);

  String? title;

  String? content;

  @override
  List<Object?> get props => [title, content];
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
    this.title,
    this.content,
  });

  @override
  factory NewPostArguments.fromJson(Map<String, dynamic> json) =>
      _$NewPostArgumentsFromJson(json);

  late int userId;

  final String? title;

  final String? content;

  @override
  List<Object?> get props => [userId, title, content];
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
          isNonNull: false,
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
            ]),
          )
        ],
        directives: [],
        selectionSet: SelectionSetNode(selections: [
          FieldNode(
            name: NameNode(value: 'title'),
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
        selectionSet: null,
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

final GET_POST_LISTS_QUERY_DOCUMENT_OPERATION_NAME = 'getPostLists';
final GET_POST_LISTS_QUERY_DOCUMENT = DocumentNode(definitions: [
  OperationDefinitionNode(
    type: OperationType.query,
    name: NameNode(value: 'getPostLists'),
    variableDefinitions: [],
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
                value: IntValueNode(value: '0'),
              ),
              ObjectFieldNode(
                name: NameNode(value: 'orderBy'),
                value: EnumValueNode(name: NameNode(value: 'title')),
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
        ]),
      )
    ]),
  )
]);

class GetPostListsQuery
    extends GraphQLQuery<GetPostLists$Query, JsonSerializable> {
  GetPostListsQuery();

  @override
  final DocumentNode document = GET_POST_LISTS_QUERY_DOCUMENT;

  @override
  final String operationName = GET_POST_LISTS_QUERY_DOCUMENT_OPERATION_NAME;

  @override
  List<Object?> get props => [document, operationName];
  @override
  GetPostLists$Query parse(Map<String, dynamic> json) =>
      GetPostLists$Query.fromJson(json);
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
