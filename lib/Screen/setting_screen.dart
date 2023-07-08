import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hukibu/Screen/add_new_child.dart';
import 'package:hukibu/Screen/auth_screen/email_auth/login_screen.dart';
import 'package:hukibu/Screen/pdf_viewer_screen.dart';
import 'package:hukibu/Screen/auth_screen/set_up_profile/profile_screen.dart';
import 'package:hukibu/Screen/steppers.dart';
import 'package:image_picker/image_picker.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  String? username;
  String? phonenumber;
  final auth = FirebaseAuth.instance;
  final currentUser = FirebaseAuth.instance;
  File? _image;
  String? imageURL;
  String? userImage;

  final picker = ImagePicker();
  String? name;
  final fireStore =
      FirebaseFirestore.instance.collection('New Child').snapshots();

  Future getImageFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
        name = (_image!.path);
      }
    });
    Reference ref = FirebaseStorage.instance.ref().child(name.toString());

    await ref.putFile(File(_image!.path));
    ref.getDownloadURL().then((value) async {
      setState(() {
        imageURL = value;
        FirebaseFirestore.instance
            .collection("UserData")
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .update({'image': imageURL});
      });
    });
  }

  List<Map<String, String>> dataList = [
    {
      'imageUrl': 'https://i.postimg.cc/0NdSyfsB/girl.jpg',
      'title': 'child 1',
      'subtitle': '2 years 6 months',
    },
    {
      'imageUrl': 'https://i.postimg.cc/W4jDCkk6/toddler1.jpg',
      'title': 'child 2',
      'subtitle': '6 months',
    },
    {
      'imageUrl': 'https://i.postimg.cc/3N7050VH/toddler-2.webp',
      'title': 'child 3',
      'subtitle': '1.5 years',
    },

    // Add more items as needed
  ];

  int selectedAvatarIndex = 0;

  List<String> avatarUrls = [
    'https://i.postimg.cc/W4jDCkk6/toddler1.jpg',
    'https://i.postimg.cc/0NdSyfsB/girl.jpg',
    'https://i.postimg.cc/3N7050VH/toddler-2.webp',
  ];

  Widget buildAvatar(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedAvatarIndex = index;
        });
      },
      child: Container(
        margin: EdgeInsets.all(8.0),
        width: 80.0,
        height: 80.0,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
            color:
                selectedAvatarIndex == index ? Colors.blue : Colors.transparent,
            width: 2.0,
          ),
        ),
        child: CircleAvatar(
          backgroundImage: NetworkImage(avatarUrls[index]),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget BottomSheet() {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 13,
      width: double.infinity,
      child: Column(
        children: [
          InkWell(
            onTap: () {
              getImageFromGallery();
            },
            child: const ListTile(
              leading: Icon(Icons.image),
              title: Text('Gallery'),
            ),
          ),
        ],
      ),
    );
  }

  _getDataFromDatabase() async {
    await FirebaseFirestore.instance
        .collection("UserData")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get(const GetOptions(source: Source.cache))
        .then((snapshot) async {
      if (snapshot.exists &&
          snapshot.get('username') != null &&
          snapshot.get('phonenumber') != null) {
        setState(() {
          username = snapshot.data()!['username'];
          phonenumber = snapshot.data()!['phonenumber'];
          userImage = snapshot.data()!['image'];
        });
      } else {
        setState(() {
          username = snapshot.data()!['username'];
          phonenumber = snapshot.data()!['phonenumber'];
        });
      }
    });
  }

  @override
  void initState() {
    _getDataFromDatabase();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Center(
          child: const Text(
            "settings",
            style: TextStyle(
                fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
          ).tr(),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10, top: 5),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 0, backgroundColor: Colors.white),
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (ctx) => LoginScreen(),
                    ),
                    (route) => false);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "logout",
                    style: TextStyle(fontSize: 15, color: Colors.blue),
                  ).tr(),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.logout,
                    size: 18,
                    color: Colors.blue,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 18.0),
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  Row(children: [
                    const SizedBox(
                      width: 15,
                    ),
                    InkWell(
                      onTap: () async {
                        showModalBottomSheet(
                            context: context,
                            builder: (builder) => BottomSheet());
                      },
                      child: CircleAvatar(
                        radius: 50,
                        backgroundColor:
                            const Color.fromARGB(255, 239, 238, 235),
                        child: userImage != null
                            ? ClipOval(
                                child: Image.network(
                                  userImage!,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : _image != null
                                ? ClipOval(
                                    child: Image.file(
                                      _image!,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : ClipOval(
                                    child:
                                        Image.asset('assets/images/empty.webp'),
                                  ),
                      ),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          username.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          phonenumber.toString(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ])
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => const ProfileScreen()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: 108.0),
                  child: Row(
                    children: [
                      const Text(
                        "edit profile",
                        style: TextStyle(
                          color: Color.fromARGB(255, 90, 32, 100),
                        ),
                      ).tr(),
                      const SizedBox(
                        width: 6,
                      ),
                      const Icon(
                        Icons.edit,
                        size: 18,
                        color: Color.fromARGB(255, 90, 32, 100),
                      )
                    ],
                  ),
                ),
              ),
              const Divider(
                thickness: 1,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "my children",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ).tr(),
                  const SizedBox(
                    width: 20,
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
                    child: SizedBox(
                      child: Row(
                        children: [
                          const Text(
                            "add new",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 90, 32, 100),
                            ),
                          ).tr(),
                          const SizedBox(
                            width: 10,
                          ),
                          const Icon(
                            Icons.person_add,
                            size: 17,
                            color: Color.fromARGB(255, 90, 32, 100),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              ChildrenList(dataList: dataList),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Selected Child: $selectedAvatarIndex'),
                  SizedBox(height: 16.0),
                  Wrap(
                    children: List<Widget>.generate(
                      avatarUrls.length,
                      (index) => buildAvatar(index),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              // StreamBuilder<QuerySnapshot>(
              //     stream: fireStore,
              //     builder: (BuildContext context,
              //         AsyncSnapshot<QuerySnapshot> snapshot) {
              //       if (snapshot.connectionState == ConnectionState.waiting) {
              //         return const CircularProgressIndicator();
              //       }
              //       if (snapshot.hasError) {
              //         return const Text('Some Error');
              //       }
              //       return Expanded(
              //           child: ListView.builder(
              //               itemCount: snapshot.data!.docs.length,
              //               itemBuilder: (context, index) {
              //                 return Padding(
              //                   padding: const EdgeInsets.only(right: 20.0),
              //                   child: Card(
              //                     child: InkWell(
              //                       onTap: () {
              //                         Navigator.push(
              //                           context,
              //                           MaterialPageRoute(
              //                             builder: (ctx) => const StepperScreen(),
              //                           ),
              //                         );
              //                       },
              //                       child: Container(
              //                         //height: 50,
              //                         width: 100,
              //                         color: const Color.fromARGB(
              //                             255, 205, 211, 214),
              //                         child: Padding(
              //                           padding:
              //                               const EdgeInsets.only(left: 18.0),
              //                           child: ListTile(
              //                             title: Text(
              //                               snapshot.data!.docs[index]['surname']
              //                                   .toString(),
              //                               style: const TextStyle(
              //                                   fontWeight: FontWeight.bold),
              //                             ),
              //                             subtitle: Row(
              //                               children: [
              //                                 Text(
              //                                   snapshot.data!.docs[index]['area']
              //                                       .toString(),
              //                                   style: const TextStyle(
              //                                       fontWeight: FontWeight.bold),
              //                                 ),
              //                                 TextButton(
              //                                     onPressed: () {
              //                                       // Navigator.push(
              //                                       //   context,
              //                                       //   MaterialPageRoute(
              //                                       //     builder: (context) =>
              //                                       //         PdfViewerScreen(
              //                                       //       url: snapshot.data!
              //                                       //           .docs[index]['pdf']
              //                                       //           .toString(),
              //                                       //     ),
              //                                       //   ),
              //                                       // );
              //                                     },
              //                                     child: const Text('PDF'))
              //                               ],
              //                             ),
              //                             leading: Text(
              //                               snapshot.data!.docs[index]['name']
              //                                   .toString(),
              //                             ),
              //                             trailing: CircleAvatar(
              //                               radius: 30,
              //                               child: ClipRRect(
              //                                 borderRadius:
              //                                     BorderRadius.circular(30),
              //                                 child: snapshot.data!
              //                                             .docs[index]['image']
              //                                             .toString() !=
              //                                         'null'
              //                                     ? Image(
              //                                         fit: BoxFit.cover,
              //                                         width: 80,
              //                                         image: NetworkImage(
              //                                           snapshot.data!
              //                                               .docs[index]['image']
              //                                               .toString(),
              //                                         ),
              //                                         loadingBuilder: (context,
              //                                             child,
              //                                             loadingProgress) {
              //                                           if (loadingProgress ==
              //                                               null) {
              //                                             return child;
              //                                           }
              //                                           return const Center(
              //                                               child:
              //                                                   CircularProgressIndicator(
              //                                             color: Colors.black,
              //                                           ));
              //                                         },
              //                                       )
              //                                     : ClipOval(
              //                                         child: Image.asset(
              //                                             'assets/images/empty.webp'),
              //                                       ),
              //                               ),
              //                             ),
              //                           ),
              //                         ),
              //                       ),
              //                     ),
              //                   ),
              //                 );
              //               }));
              //     }),
            ],
          ),
        ),
      ),
    );
  }
}

class ChildrenData {
  final String sirName;
  final String area;
  final String pdf;
  final int name;
  final String image;

  ChildrenData({
    required this.sirName,
    required this.area,
    required this.pdf,
    required this.name,
    required this.image,
  });

  factory ChildrenData.fromJson(Map<String, dynamic> json) {
    return ChildrenData(
      sirName: json['sirName'],
      area: json['area'],
      pdf: json['pdf'],
      name: json['name'],
      image: json['image'],
    );
  }
}

Future<ChildrenData> fetchChildrenData() async {
  final response = await http.get(Uri.parse('https://api.example.com'));

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body);
    return ChildrenData.fromJson(jsonData);
  } else {
    throw Exception('Failed to fetch user data');
  }
}

class ChildrenList extends StatelessWidget {
  final List<Map<String, String>> dataList;

  ChildrenList({required this.dataList});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: dataList.length,
      itemBuilder: (context, index) {
        final item = dataList[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
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
                trailing: Icon(Icons.arrow_forward_outlined),
              ),
            ),
          ),
        );
      },
    );
  }
}
