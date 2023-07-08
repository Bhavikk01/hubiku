import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hukibu/Screen/chatscreen.dart';
import 'package:hukibu/Screen/home_screen/getx_helper/home_controller.dart';
import 'package:hukibu/Screen/recommendation_screen.dart';
import 'package:hukibu/Screen/setting_screen.dart';
import 'package:image_picker/image_picker.dart';
import 'package:velocity_x/velocity_x.dart';

import 'Cuddle_Screen/cuddle.dart';
import 'add_new_child.dart';
import 'kids_details.dart';
import 'package:flutter_chat_ui/flutter_chat_ui.dart';

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_chat_types/flutter_chat_types.dart' as types;
import 'package:flutter_chat_ui/flutter_chat_ui.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:mime/mime.dart';

class ChatList extends GetView<HomeController> {
  const ChatList({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> dataList = [
      {
        'imageUrl': 'https://i.postimg.cc/0NdSyfsB/girl.jpg',
        'title': 'child 1 Love Circle',
        'subtitle': 'You',
      },
      {
        'imageUrl': 'https://i.postimg.cc/W4jDCkk6/toddler1.jpg',
        'title': 'child 2 Love Circle',
        'subtitle': 'You',
      },
      {
        'imageUrl': 'https://i.postimg.cc/3N7050VH/toddler-2.webp',
        'title': 'child 3 Love Circle',
        'subtitle': 'You',
      },
      {
        'imageUrl': 'https://i.postimg.cc/KcP19fg8/avatar.png',
        'title': 'child 1 Love Circle',
        'subtitle': 'Hukibu Parent Mentor',
      },

      // Add more items as needed
    ];
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 80),
              child: Row(
                children: [
                  InkWell(
                    onTap: () async {
                      showModalBottomSheet(
                        context: context,
                        builder: (builder) => controller.bottomSheet(),
                      );
                    },
                    child: Obx(
                      () => CircleAvatar(
                        radius: 30,
                        backgroundColor:
                            const Color.fromARGB(255, 239, 238, 235),
                        child: controller.imageURL.value != ''
                            ? ClipOval(
                                child: Image.network(
                                  controller.imageURL.value,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : controller.image.value != ''
                                ? ClipOval(
                                    child: Image.file(
                                      File(controller.image.value),
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : ClipOval(
                                    child: Image.asset(
                                      'assets/images/empty.webp',
                                    ),
                                  ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (ctx) => const AddNewChild(),
                        ),
                      );
                    },
                    child: const Text(
                      "add another child",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ).tr(),
                  ),
                ],
              ),
            ),
            50.heightBox,
            ListTile(
              title: const Text("refer to a friend").tr(),
              leading: const Icon(
                Icons.send_sharp,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            20.heightBox,
            ListTile(
              title: const Text("settings").tr(),
              leading: const Icon(
                Icons.settings,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => const SettingScreen()));
              },
            ),
            20.heightBox,
            // ListTile(
            //   title: const Text("Parents Space").tr(),
            //   leading: const Icon(
            //     Icons.person,
            //     color: Colors.black,
            //   ),
            //   onTap: () {
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (ctx) => const CuddleScreen()));
            //   },
            // ),
            // 20.heightBox,
            // ListTile(
            //   title: const Text("Add Content").tr(),
            //   leading: const Icon(
            //     Icons.note,
            //     color: Colors.black,
            //   ),
            //   onTap: () {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (ctx) => const RecommendationScreen()));
            //   },
            // ),
            // 20.heightBox,
            // ListTile(
            //   title: const Text("Kid Details").tr(),
            //   leading: const Icon(
            //     Icons.details_outlined,
            //     color: Colors.black,
            //   ),
            //   onTap: () {
            //     Navigator.push(context,
            //         MaterialPageRoute(builder: (ctx) => const KidsDetails()));
            //   },
            // ),
            //
            //rest of your items
          ],
        ),
      ),
      appBar: AppBar(
        foregroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Center(
          child: Text(
            'Hukibu',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10, top: 5),
            child: Icon(
              Icons.emoji_emotions,
              color: Colors.orangeAccent,
            ),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/bg.jpg"),
          fit: BoxFit.cover,
        )),
        child: Column(
          children: [
            // StreamBuilder<QuerySnapshot>(
            //   stream: firestore,
            //   builder: (BuildContext context,
            //       AsyncSnapshot<QuerySnapshot> snapshot) {
            //     if (snapshot.hasData) {
            //       return Expanded(
            //         child: ListView.builder(
            //           itemCount: snapshot.data!.docs.length,
            //           itemBuilder: (context, index) {
            //             return InkWell(
            //               onTap: () {
            //                 Navigator.push(
            //                   context,
            //                   MaterialPageRoute(
            //                     builder: (ctx) => ChatSreen(
            //                       frienduid: snapshot.data!.docs[index]['uid'],
            //                       username: snapshot.data!.docs[index]['username'].toString(),
            //                       phonenumber: snapshot.data!.docs[index]['phoneNumber'].toString(),
            //                     ),
            //                   ),
            //                 );
            //               },
            //               child: Card(
            //                 child: ListTile(
            //                   leading: const Icon(
            //                     Icons.person_outline_outlined,
            //                     color: Colors.black,
            //                     size: 30,
            //                   ),
            //                   title: Text(
            //                     snapshot.data!.docs[index]['username'].toString(),
            //                   ),
            //                   subtitle: Text(
            //                     snapshot.data!.docs[index]['phoneNumber'].toString(),
            //                   ),
            //                 ),
            //               ),
            //             );
            //           },
            //         ),
            //       );
            //     }
            //     return const Text('');
            //   },
            // )

            MyChatList(dataList: dataList), // navin 27th june
          ],
        ),
      ),
    );
  }
}

class MyChatList extends StatelessWidget {
  final List<Map<String, String>> dataList;

  MyChatList({required this.dataList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: dataList.length,
      itemBuilder: (context, index) {
        final item = dataList[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => const ChatPage(),
                ),
              );
            },
            child: Container(
              height: MediaQuery.of(context).size.height / 10, // 12,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: const Color.fromARGB(99, 136, 163, 181),
                  //  border: Border.all(color: Colors.grey),
                  //   color:  Colors.white,
                  borderRadius: BorderRadius.circular(15)),
              child: Center(
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 26,
                    backgroundImage: NetworkImage(item['imageUrl'] ?? ''),
                  ),
                  title: Text(
                    item['title'] ?? '',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    item['subtitle'] ?? '',
                    style: const TextStyle(
                        fontWeight: FontWeight.normal, fontSize: 12),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  List<types.Message> _messages = [];
  final _user = const types.User(
    id: '82091008-a484-4a89-ae75-a22bf8d6f3ac',
  );

  @override
  void initState() {
    super.initState();
    _loadMessages();
  }

  void _addMessage(types.Message message) {
    setState(() {
      _messages.insert(0, message);
    });
  }

  void _handleAttachmentPressed() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) => SafeArea(
        child: SizedBox(
          height: 144,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  // _handleImageSelection();
                },
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('Photo'),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  // _handleFileSelection();
                },
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('File'),
                ),
              ),
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text('Cancel'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // void _handleFileSelection() async {
  //   final result = await FilePicker.platform.pickFiles(
  //     type: FileType.any,
  //   );

  //   if (result != null && result.files.single.path != null) {
  //     final message = types.FileMessage(
  //       author: _user,
  //       createdAt: DateTime.now().millisecondsSinceEpoch,
  //       id: const Uuid().v4(),
  //       mimeType: lookupMimeType(result.files.single.path!),
  //       name: result.files.single.name,
  //       size: result.files.single.size,
  //       uri: result.files.single.path!,
  //     );

  //     _addMessage(message);
  //   }
  // }

  void _handleMessageTap(BuildContext _, types.Message message) async {
    if (message is types.FileMessage) {
      var localPath = message.uri;

      if (message.uri.startsWith('http')) {
        try {
          final index =
              _messages.indexWhere((element) => element.id == message.id);
          final updatedMessage =
              (_messages[index] as types.FileMessage).copyWith(
            isLoading: true,
          );

          setState(() {
            _messages[index] = updatedMessage;
          });

          final client = http.Client();
          final request = await client.get(Uri.parse(message.uri));
          final bytes = request.bodyBytes;
          //  final documentsDir = (await getApplicationDocumentsDirectory()).path;
          //  localPath = '$documentsDir/${message.name}';

          if (!File(localPath).existsSync()) {
            final file = File(localPath);
            await file.writeAsBytes(bytes);
          }
        } finally {
          final index =
              _messages.indexWhere((element) => element.id == message.id);
          final updatedMessage =
              (_messages[index] as types.FileMessage).copyWith(
            isLoading: null,
          );

          setState(() {
            _messages[index] = updatedMessage;
          });
        }
      }

      //  await OpenFilex.open(localPath);
    }
  }

  void _handlePreviewDataFetched(
    types.TextMessage message,
    types.PreviewData previewData,
  ) {
    final index = _messages.indexWhere((element) => element.id == message.id);
    final updatedMessage = (_messages[index] as types.TextMessage).copyWith(
      previewData: previewData,
    );

    setState(() {
      _messages[index] = updatedMessage;
    });
  }

  void _handleSendPressed(types.PartialText message) {
    final textMessage = types.TextMessage(
      author: _user,
      createdAt: DateTime.now().millisecondsSinceEpoch,
      // id: const Uuid().v4(),
      id: '',
      text: message.text,
    );

    _addMessage(textMessage);
  }

  void _loadMessages() async {
    final response = await rootBundle.loadString('assets/messages.json');
    final messages = (jsonDecode(response) as List)
        .map((e) => types.Message.fromJson(e as Map<String, dynamic>))
        .toList();

    setState(() {
      _messages = messages;
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          foregroundColor: Colors.black,
          iconTheme: const IconThemeData(color: Colors.black),
          // title: const Center(
          //   child: Text(
          //     'Hukibu',
          //     style: TextStyle(
          //       fontWeight: FontWeight.bold,
          //       color: Colors.black,
          //       fontSize: 20,
          //     ),
          //   ),
          // ),
          title: ListTile(
            leading: CircleAvatar(
              radius: 26,
              backgroundImage:
                  NetworkImage('https://i.postimg.cc/3N7050VH/toddler-2.webp'),
            ),
            title: Text(
              'Child 1',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            subtitle: Text(
              'You',
              style:
                  const TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
            ),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 10, top: 5),
              child: Icon(
                Icons.emoji_emotions,
                color: Colors.orangeAccent,
              ),
            ),
          ],
        ),
        body: Chat(
          messages: _messages,
          onAttachmentPressed: _handleAttachmentPressed,
          onMessageTap: _handleMessageTap,
          onPreviewDataFetched: _handlePreviewDataFetched,
          onSendPressed: _handleSendPressed,
          showUserAvatars: true,
          showUserNames: true,
          user: _user,
        ),
      );
}
