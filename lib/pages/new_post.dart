// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multiple_images_picker/multiple_images_picker.dart';
import 'package:provider/provider.dart';
import 'package:thumuht/model/gql/graphql_api.dart';

import '../model/session.dart';

class imageDemonstrator extends StatefulWidget {
  const imageDemonstrator({Key? key}) : super(key: key);

  @override
  _imageDemonstratorState createState() => _imageDemonstratorState();
}

class _imageDemonstratorState extends State<imageDemonstrator> {
  // List<XFile>? image_;
  List<Asset> images = <Asset>[];
  Widget buildListView() {
    return images.isEmpty
        ? Container()
        : GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            children: List.generate(images.length, (index) {
              Asset asset = images[index];
              return AssetThumb(
                asset: asset,
                width: 100,
                height: 100,
              );
            }));
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = <Asset>[];

    try {
      resultList = await MultipleImagesPicker.pickImages(
        maxImages: 6,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Example App",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      print(e);
    }
    if (!mounted) return;

    setState(() {
      images = resultList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        IconButton(
          alignment: Alignment.topLeft,
          icon: Icon(Icons.add_a_photo),
          onPressed: loadAssets,
        ),
        buildListView(),
      ],
    );
  }
}

class NewPostPage extends StatefulWidget {
  const NewPostPage({super.key});

  @override
  State<NewPostPage> createState() => _NewPostPageState();
}

class _NewPostPageState extends State<NewPostPage> {
  String? title_;
  String? content_;

  bool _checkParams() => (title_ != null) && (content_ != null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          // height: 300,
          child: ListView(
        // shrinkWrap: true,
        children: <Widget>[
          const SizedBox(height: 40.0),
          TextField(
            onChanged: (value) {
              title_ = value;
            },
            decoration: const InputDecoration(
              filled: true,
              labelText: 'title',
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          TextField(
            onChanged: (value) {
              content_ = value;
            },
            decoration: const InputDecoration(
              filled: true,
              labelText: 'content',
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          imageDemonstrator(),
          const SizedBox(
            height: 12.0,
          ),
          OverflowBar(
            alignment: MainAxisAlignment.end,
            children: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () => {context.replace('/')},
              ),
              Mutation(
                options: MutationOptions(
                  document: NEW_POST_MUTATION_DOCUMENT,
                ),
                builder: (runMutation, result) => ElevatedButton(
                  onPressed: () {
                    if (_checkParams()) {
                      runMutation({
                        'userId': Provider.of<Session>(context, listen: false)
                            .userId_
                            .toString(),
                        'title': title_,
                        'content': content_,
                      });
                    }
                    context.replace('/');
                  },
                  child: const Text('Post'),
                ),
              ),
            ],
          )
        ],
      )),
    );
  }
}
