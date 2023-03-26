# thumuht

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Integrate with graphql

schema.graphql locates at ./lib/model/gql/schema.graphql

if you want add new query, you write query pattern in ./lib/model/gql/query

and run `flutter pub run build_runner build` in command line.

after that, you can see new query in ./lib/model/gql/graphql_api_graphql.dart

this file contains classes like GetPostListsQuery.

### How to use this?

if your widget needs fetch data from graphql server, you must ensure this widget is some

children/grandchildren of a graphqlprovider.

then your widget should be like 

Query(

    options

    builder

)

you write GetPostListsQuery.document in options, it tells the client our query structure.

builder is a function. it is called by flutter to convert network response to widget.

### documentation

https://pub.dev/packages/artemis

https://zino-hofmann.github.io/graphql-flutter/packages/graphql/

https://zino-hofmann.github.io/graphql-flutter/packages/graphql_flutter/
