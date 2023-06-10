// ignore_for_file: prefer_const_constructors, use_build_context_synchronously

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:file_selector/file_selector.dart';
import 'package:flutter/material.dart';
import 'package:geocode/geocode.dart';
// import 'package:geocoder2/geocoder2.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:multiple_images_picker/multiple_images_picker.dart';
import 'package:provider/provider.dart';
import 'package:thumuht/components/post_list.dart';
import 'package:thumuht/main.dart';
import 'package:thumuht/model/gql/graphql_api.dart';
import 'package:dio/dio.dart';
import "package:http_parser/http_parser.dart";
import 'dart:developer' as developer;

import '../model/session.dart';

class Images extends ChangeNotifier {
  Images({required this.images});
  List<Asset> images = <Asset>[];
  List<Asset> get getImages => images;
  void setImage(List<Asset> images_) {
    images = images_;
    notifyListeners();
  }
}

class Position extends ChangeNotifier {
  Position({required this.position});
  String position;
  String get getPosition => position;

  bool usePostion() {
    return (position != "");
  }

  void setPosition(String position_) {
    position = position_;
    notifyListeners();
  }
}

class Tag extends ChangeNotifier {
  Tag({required this.tag});
  String tag;
  String get getTag => tag;
  void setTag(String tag_) {
    tag = tag_;
    notifyListeners();
  }
}

class imageSelector extends StatefulWidget {
  imageSelector({Key? key}) : super(key: key);

  @override
  _imageSelectorState createState() => _imageSelectorState();
}

class _imageSelectorState extends State<imageSelector> {
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
      print(Provider.of<Images>(context, listen: false).getImages.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      alignment: Alignment.topLeft,
      icon: Icon(Icons.add_a_photo),
      onPressed: loadAssets,
    );
  }
}

class imageDemonstrator extends StatefulWidget {
  imageDemonstrator({Key? key}) : super(key: key);

  @override
  _imageDemonstratorState createState() => _imageDemonstratorState();
}

class _imageDemonstratorState extends State<imageDemonstrator> {
  List<Asset> images = <Asset>[];
  @override
  Widget build(BuildContext context) {
    images = Provider.of<Images>(context).getImages;
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
                  imageUrls += '![](${image.name}) ';
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
                'position':
                    Provider.of<Position>(context, listen: false).getPosition,
                'tag': Provider.of<Tag>(context, listen: false).getTag,
              });
              likeMap[Provider.of<Session>(context, listen: false).userId_!] =
                  [];
              markMap[Provider.of<Session>(context, listen: false).userId_!] =
                  [];
              // developer.log(likeMap.toString());
              context.replace('/');
            },
            child: const Text('Post'),
          ),
        ),
      ],
    );
  }
}

class GetUserLocation extends StatefulWidget {
  GetUserLocation({Key? key}) : super(key: key);

  @override
  _GetUserLocationState createState() => _GetUserLocationState();
}

class _GetUserLocationState extends State<GetUserLocation> {
  LocationData? currentLocation;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        IconButton(
          onPressed: () {
            _getLocation().then((value) {
              LocationData? location = value;
              _getAddress(location?.latitude, location?.longitude)
                  .then((value) {
                setState(() {
                  currentLocation = location;
                  Provider.of<Position>(context, listen: false)
                      .setPosition(value);
                });
              });
            });
          },
          icon: Icon(Icons.location_on),
        ),
        // if (currentLocation != null)
        //   Text(
        //       "Location:${Provider.of<Position>(context, listen: false).getPosition}"),
      ],
    );
  }

  Future<LocationData?> _getLocation() async {
    Location location = new Location();
    LocationData _locationData;

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return null;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return null;
      }
    }

    _locationData = await location.getLocation();

    return _locationData;
  }

  Future<String> _getAddress(double? lat, double? lang) async {
    if (lat == null || lang == null) return "";
    GeoCode geoCode = GeoCode(apiKey: "57206835960194379350x31468");
    Address address =
        await geoCode.reverseGeocoding(latitude: lat, longitude: lang);
    return "${address.streetAddress}, ${address.city}, ${address.countryName}, ${address.postal}";
  }
}

class ShowPosition extends StatefulWidget {
  const ShowPosition({Key? key}) : super(key: key);

  @override
  _ShowPositionState createState() => _ShowPositionState();
}

class _ShowPositionState extends State<ShowPosition> {
  @override
  Widget build(BuildContext context) {
    bool flag = Provider.of<Position>(context).usePostion();
    String position = Provider.of<Position>(context).getPosition;
    return flag ? Text("  Location:$position") : Container();
  }
}

class selectTag extends StatefulWidget {
  const selectTag({Key? key}) : super(key: key);

  @override
  _selectTagState createState() => _selectTagState();
}

class _selectTagState extends State<selectTag> {
  String _value = "无标签";

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: _value,
      elevation: 16,
      onChanged: (String? value) {
        setState(() {
          _value = value!;
          if (value == '无标签') {
            Provider.of<Tag>(context, listen: false).setTag("none");
          } else {
            Provider.of<Tag>(context, listen: false).setTag(value);
          }
        });
      },
      items: TagColor.keys.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
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
            ChangeNotifierProvider(create: (context) => Images(images: [])),
            ChangeNotifierProvider(create: (context) => Position(position: "")),
            ChangeNotifierProvider(create: (context) => Tag(tag: "none")),
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
                  decoration: const InputDecoration(
                    filled: true,
                    labelText: 'content',
                  ),
                ),
                const SizedBox(
                  height: 12.0,
                ),
                Row(
                  children: [
                    GetUserLocation(),
                    imageSelector(),
                    selectTag(),
                  ],
                ),
                const SizedBox(
                  width: 12.0,
                ),
                ShowPosition(),
                const SizedBox(
                  height: 12.0,
                ),
                imageDemonstrator(),
                PostButton(
                  controller_title: _controller_title,
                  controller_content: _controller_content,
                  flag: _checkParams(),
                ),
              ],
            )),
          ));
}
