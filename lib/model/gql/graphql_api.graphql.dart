// GENERATED CODE - DO NOT MODIFY BY HAND

import 'package:artemis/artemis.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:gql/ast.dart';
part 'graphql_api.graphql.g.dart';

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

  late List<GetPostLists$Query$Post> posts;

  @override
  List<Object?> get props => [posts];
  @override
  Map<String, dynamic> toJson() => _$GetPostLists$QueryToJson(this);
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
