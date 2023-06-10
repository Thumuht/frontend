import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart';
import "package:http_parser/http_parser.dart";
import 'package:provider/provider.dart';
import 'package:thumuht/main.dart';
import 'package:thumuht/model/gql/graphql_api.graphql.dart';
import 'package:thumuht/router.dart';

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({super.key});

  @override
  State<ProfileEditPage> createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  String? nickname_;
  String? about_;
  String? password_;
  String? avatarPath_;
  final ImagePicker _picker = ImagePicker();

  _uploadAvatar(String loginName) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image == null) {
      return;
    }
    var bytes = await image.readAsBytes();
    var file = MultipartFile.fromBytes(bytes,
        filename: '${loginName}.avatar.jpg',
        contentType: MediaType('image', 'jpg'));
    var formData = FormData.fromMap({
      "file": file,
    });
    await Dio().post('${backendAddress}upload', data: formData);
  }

  @override
  Widget build(BuildContext context) {
    var client = GraphQLProvider.of(context).value;
    var oldProfileQuery =
        client.query(QueryOptions(document: GET_PROFILE_QUERY_DOCUMENT));
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Profile'),
          // a button to return to the previous page
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              context.pop();
            },
          ),
        ),
        body: SafeArea(
            child: FutureBuilder(
          future: oldProfileQuery,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            var oldProfile = snapshot.data!.data!['me'];
            nickname_ = oldProfile['nickname'];
            about_ = oldProfile['about'];
            password_ = '';
            avatarPath_ = oldProfile['avatar'];

            return ListView(
              padding:
                  const EdgeInsets.symmetric(horizontal: 24.0, vertical: 24.0),
              children: [
                Row(children: [
                  avatarPath_ == '' || avatarPath_ == null
                      ? Image.asset(
                          'assets/thumuht.jpg',
                          width: 50,
                          height: 50,
                        )
                      : Image.network(
                          '${backendAddress}fs/${avatarPath_!}',
                          width: 50,
                          height: 50,
                        ),
                  const SizedBox(
                    width: 16.0,
                  ),
                  ElevatedButton(
                      onPressed: () async {
                        await _uploadAvatar(oldProfile['loginName'] as String);

                        client.mutate(MutationOptions(
                            document: SET_PROFILE_MUTATION_DOCUMENT,
                            variables: {
                              'avatar': '${oldProfile['loginName']}.avatar.jpg'
                            }));

                        setState(() {
                          avatarPath_ = '${oldProfile['loginName']}.avatar.jpg';
                        });
                      },
                      child: const Text('Upload'))
                ]),
                const SizedBox(
                  height: 16.0,
                ),
                Row(
                  children: [
                    const Text('Nickname'),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                        child: TextField(
                      onChanged: (value) {
                        nickname_ = value;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: oldProfile['nickname'] as String),
                    ))
                  ],
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Row(
                  children: [
                    const Text('About'),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                        child: TextField(
                      onChanged: (value) {
                        about_ = value;
                      },
                      decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: oldProfile['about'] as String),
                    ))
                  ],
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Row(
                  children: [
                    const Text('Password'),
                    const SizedBox(
                      width: 16.0,
                    ),
                    Expanded(
                        child: TextField(
                      onChanged: (value) {
                        password_ = value;
                      },
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter new password'),
                    ))
                  ],
                ),
                // a button to submit the form
                const SizedBox(
                  height: 16.0,
                ),
                ElevatedButton(
                    onPressed: () async {
                      var result = await client.mutate(MutationOptions(
                          document: SET_PROFILE_MUTATION_DOCUMENT,
                          variables: {
                            'nickname': nickname_,
                            'about': about_,
                            'password': password_ == ''
                                ? oldProfile['password']
                                : password_,
                            'avatar': avatarPath_
                          }));
                      context.pop();
                    },
                    child: const Text('Submit'))
              ],
            );
          },
        )));
  }
}
