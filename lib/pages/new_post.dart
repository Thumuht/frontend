// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:multiple_images_picker/multiple_images_picker.dart';
import 'package:provider/provider.dart';
import 'package:thumuht/main.dart';
import 'package:thumuht/model/gql/graphql_api.dart';
import 'package:dio/dio.dart';
import "package:http_parser/http_parser.dart";

import '../model/session.dart';

class imageDemonstrator extends StatefulWidget {
  imageDemonstrator({Key? key}) : super(key: key);

  @override
  _imageDemonstratorState createState() => _imageDemonstratorState();
}

class Images extends ChangeNotifier {
  Images({required this.images});
  List<Asset> images = <Asset>[];
  List<Asset> get getImages => images;
  void setImage(List<Asset> images_) {
    images = images_;
    notifyListeners();
  }
}

class _imageDemonstratorState extends State<imageDemonstrator> {
  // List<XFile>? image_;
  Widget buildListView() {
    return Provider.of<Images>(context, listen: false).getImages.isEmpty
        ? Container()
        : GridView.count(
            shrinkWrap: true,
            crossAxisCount: 3,
            children: List.generate(
                Provider.of<Images>(context, listen: false).getImages.length,
                (index) {
              Asset asset =
                  Provider.of<Images>(context, listen: false).getImages[index];
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
        selectedAssets: Provider.of<Images>(context, listen: false).getImages,
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
      // images = resultList;
      Provider.of<Images>(context, listen: false).setImage(resultList);
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

class PostButton extends StatefulWidget {
  const PostButton(
      {Key? key,
      required this.controller_title,
      required this.controller_content,
      required this.flag})
      : super(key: key);
  final TextEditingController controller_title;
  final TextEditingController controller_content;
  final bool flag;
  @override
  _PostButtonState createState() => _PostButtonState();
}

class _PostButtonState extends State<PostButton> {
  @override
  Widget build(BuildContext context) {
    return OverflowBar(
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
            onPressed: () async {
              // if (widget.flag) {

              // }
              String imageUrls = "";
              if (Provider.of<Images>(context, listen: false)
                  .getImages
                  .isNotEmpty) {
                for (Asset image
                    in Provider.of<Images>(context, listen: false).getImages) {
                  ByteData byteData = await image.getByteData();
                  List<int> imageData = byteData.buffer.asUint8List();
                  imageUrls += '![width=10](${image.name}) ';
                  MultipartFile multipartFile = MultipartFile.fromBytes(
                      imageData,
                      filename: image.name,
                      contentType: MediaType("image", "jpg"));
                  FormData formData = FormData.fromMap({"file": multipartFile});
                  var response = await Dio()
                      .post('${backendAddress}upload', data: formData);
                  print(response.data);
                }
              }
              runMutation({
                'userId': Provider.of<Session>(context, listen: false)
                    .userId_
                    .toString(),
                'title': widget.controller_title.text,
                'content': widget.controller_content.text + imageUrls,
              });
              context.replace('/');
            },
            child: const Text('Post'),
          ),
        ),
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
  TextEditingController _controller_title = TextEditingController();
  TextEditingController _controller_content = TextEditingController();
  @override
  Widget build(BuildContext context) => MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (context) => Images(images: []))
          ],
          child: Scaffold(
            body: SafeArea(
                // height: 300,
                child: ListView(
              // shrinkWrap: true,
              children: <Widget>[
                const SizedBox(height: 40.0),
                TextField(
                  controller: _controller_title,
                  // onChanged: (value) {
                  //   title_ = value;
                  // },
                  decoration: const InputDecoration(
                    filled: true,
                    labelText: 'title',
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                TextField(
                  controller: _controller_content,
                  // onChanged: (value) {
                  //   content_ = value;
                  // },
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
                PostButton(
                  controller_title: _controller_title,
                  controller_content: _controller_content,
                  flag: _checkParams(),
                ),
              ],
            )),
          ));
}
