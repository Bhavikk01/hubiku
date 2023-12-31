import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hukibu/Screen/Overcome_Screen/overcome_screen.dart';
import 'package:hukibu/Screen/Writing_Screen/writing_screen.dart';
import 'package:hukibu/Screen/add_new_child.dart';
import 'package:hukibu/Screen/Cuddle_Screen/cuddle.dart';
import 'package:hukibu/Screen/Tanturam_Screen/tanturam_timer.dart';
import 'package:hukibu/Screen/kids_details.dart';
import 'package:hukibu/Screen/recommendation_screen.dart';
import 'package:hukibu/Screen/setting_screen.dart';
import 'package:hukibu/model/get_courses.dart';
import 'package:velocity_x/velocity_x.dart';

import 'getx_helper/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> imageUrls = [
      'https://i.postimg.cc/J08fT6L1/IMG-2743.jpg',
      'https://i.postimg.cc/Pf8bKX3r/IMG-2744.jpg',
      'https://i.postimg.cc/fbLmdDSs/IMG-2745.jpg',
      'https://i.postimg.cc/L6m0YgDZ/kid3.jpg',
      'https://i.postimg.cc/nrBTjpj2/kelli-mcclintock-w-Bg-AVAGjz-Fg-unsplash.jpg',
      'https://i.postimg.cc/J4wM9x1C/kid1.jpg',
      'https://i.postimg.cc/QMzRcNCZ/kid2.jpg',
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
                                    child:
                                        Image.asset('assets/images/empty.webp'),
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
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (ctx) => const CuddleScreen(),
            //       ),
            //     );
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
            //       context,
            //       MaterialPageRoute(
            //         builder: (ctx) => const RecommendationScreen(),
            //       ),
            //     );
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
            //     Navigator.push(
            //       context,
            //       MaterialPageRoute(
            //         builder: (ctx) => const KidsDetails(),
            //       ),
            //     );
            //   },
            // ),
          ],
        ),
      ),
      appBar: AppBar(
        foregroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Center(
          child: Text(
            "Hukibu",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 20,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          const Center(
            child: Text('English'),
          ),
          Switch(
            onChanged: (val) async {
              controller.toggleSwitch(val);
            },
            value: context.locale.toString() == 'en_US' ? false : true,
            activeColor: Colors.purpleAccent,
            activeTrackColor: Colors.purple,
            inactiveThumbColor: Colors.deepPurple,
            inactiveTrackColor: Colors.deepPurpleAccent,
          ),
          const Center(
            child: Text('Turkish'),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/bg.jpg"),
          fit: BoxFit.cover,
        )),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              10.heightBox,
              TextFormField(
                controller: controller.searchController,
                decoration: InputDecoration(
                  isDense: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Vx.gray50),
                  ),
                  hintText: "Search for a topic",
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 8,
                  ),
                  fillColor: Vx.gray200,
                  filled: true,
                ),
              ),
              controller.searchController.text.isEmpty
                  ? Expanded(
                      child: ListView(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            "suggestion for you",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ).tr(),
                          const SizedBox(
                            height: 10,
                          ),
                          Column(
                            children: [
                              for (int i = 0; i < imageUrls.length; i++)
                                GestureDetector(
                                  onTap: () {
                                    // Navigator.push(
                                    //   context,
                                    //   MaterialPageRoute(
                                    //     builder: (context) => ImageDetailPage(
                                    //       imageUrl: imageUrls[i],
                                    //       imageIndex: i,
                                    //     ),
                                    //   ),
                                    // );
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (ctx) => const CuddleScreen(),
                                      ),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(12),
                                      child: Image.network(
                                        imageUrls[i],
                                        height:
                                            MediaQuery.of(context).size.height /
                                                3.8,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                            ],
                          ),
                          // FutureBuilder<List<Course>>(
                          //   future: fetchCourses(),
                          //   builder: (context, snapshot) {
                          //     if (snapshot.connectionState ==
                          //         ConnectionState.waiting) {
                          //       return Center(
                          //         child: CircularProgressIndicator(),
                          //       );
                          //     } else if (snapshot.hasError) {
                          //       return Center(
                          //         child: Text('Failed to fetch courses'),
                          //       );
                          //     } else if (snapshot.hasData) {
                          //       final courses = snapshot.data!;
                          //       return ListView.builder(
                          //         shrinkWrap: true,
                          //         itemCount: courses.length,
                          //         itemBuilder: (context, index) {
                          //           final course = courses[index];
                          //           return ListTile(
                          //             title: Text(course.courseName),
                          //             subtitle: Text(course.courseDesc),
                          //           );
                          //         },
                          //       );
                          //     } else {
                          //       return Container(); // Empty state
                          //     }
                          //   },
                          // ),
                          SizedBox(
                            height: 10,
                          ),
                          // InkWell(
                          //   onTap: () {
                          //     Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //         builder: (ctx) => const CuddleScreen(),
                          //       ),
                          //     );
                          //   },
                          //   child: Container(
                          //     height: MediaQuery.of(context).size.height / 3.8,
                          //     width: double.infinity,
                          //     decoration: BoxDecoration(
                          //       gradient: const LinearGradient(
                          //         colors: [
                          //           Color.fromARGB(249, 192, 88, 210),
                          //           Color.fromARGB(233, 47, 128, 194),
                          //         ],
                          //         begin: FractionalOffset(0.5, 0.0),
                          //         end: FractionalOffset(0.99, 0.0),
                          //       ),
                          //       borderRadius: BorderRadius.circular(20),
                          //     ),
                          //     child: Row(
                          //       mainAxisAlignment:
                          //           MainAxisAlignment.spaceAround,
                          //       children: [
                          //         Image.asset('assets/images/img1.png'),
                          //         const Text.rich(
                          //           TextSpan(
                          //             children: [
                          //               TextSpan(
                          //                 text: "cuddle",
                          //                 style: TextStyle(
                          //                   fontSize: 15,
                          //                   fontWeight: FontWeight.bold,
                          //                   color: Colors.white,
                          //                 ),
                          //               ),
                          //               TextSpan(
                          //                 text: "postnatal",
                          //                 style: TextStyle(
                          //                   fontSize: 10,
                          //                   fontWeight: FontWeight.bold,
                          //                   color: Colors.white,
                          //                 ),
                          //               )
                          //             ],
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          // const SizedBox(
                          //   height: 10,
                          // ),
                          // InkWell(
                          //   onTap: () {
                          //     Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //         builder: (ctx) => const OverComeScreen(),
                          //       ),
                          //     );
                          //   },
                          //   child: Container(
                          //     height: MediaQuery.of(context).size.height / 3.8,
                          //     width: double.infinity,
                          //     decoration: BoxDecoration(
                          //       gradient: const LinearGradient(
                          //         colors: [
                          //           Color.fromARGB(118, 125, 191, 245),
                          //           Color.fromARGB(121, 125, 89, 131),
                          //         ],
                          //         begin: FractionalOffset(0.0, 0.0),
                          //         end: FractionalOffset(0.99, 0.0),
                          //       ),
                          //       borderRadius: BorderRadius.circular(20),
                          //     ),
                          //     child: Stack(
                          //       children: [
                          //         ClipRRect(
                          //           borderRadius: BorderRadius.circular(20),
                          //           child: Image.asset(
                          //             'assets/images/teacher.jpeg',
                          //             fit: BoxFit.cover,
                          //             width: double.infinity,
                          //             color: const Color.fromARGB(71, 0, 0, 0),
                          //             colorBlendMode: BlendMode.darken,
                          //           ),
                          //         ),
                          //         const Padding(
                          //           padding:
                          //               EdgeInsets.only(top: 28.0, right: 200),
                          //           child: Row(
                          //             mainAxisAlignment:
                          //                 MainAxisAlignment.spaceAround,
                          //             children: [
                          //               Text.rich(
                          //                 TextSpan(
                          //                   children: [
                          //                     TextSpan(
                          //                       text: "cuddle",
                          //                       style: TextStyle(
                          //                         fontSize: 20,
                          //                         fontWeight: FontWeight.bold,
                          //                         color: Colors.white,
                          //                       ),
                          //                     ),
                          //                     TextSpan(
                          //                       text: "postnatal",
                          //                       style: TextStyle(
                          //                         fontSize: 15,
                          //                         fontWeight: FontWeight.bold,
                          //                         color: Colors.white,
                          //                       ),
                          //                     )
                          //                   ],
                          //                 ),
                          //               ),
                          //             ],
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          // const SizedBox(
                          //   height: 10,
                          // ),
                          // InkWell(
                          //   onTap: () {
                          //     Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //         builder: (ctx) => const TantrumTamerSceen(),
                          //       ),
                          //     );
                          //   },
                          //   child: Container(
                          //     height: MediaQuery.of(context).size.height / 3.8,
                          //     width: double.infinity,
                          //     decoration: BoxDecoration(
                          //       // color: Colors.blue,
                          //       gradient: const LinearGradient(
                          //         colors: [
                          //           Colors.purple,
                          //           Colors.blue,
                          //         ],
                          //         begin: FractionalOffset(0.3, 0.0),
                          //         end: FractionalOffset(0.99, 0.0),
                          //       ),
                          //       borderRadius: BorderRadius.circular(20),
                          //     ),
                          //     child: Stack(
                          //       children: [
                          //         ClipRRect(
                          //           borderRadius: BorderRadius.circular(20),
                          //           child: Image.asset(
                          //             'assets/images/teacher2.jpg',
                          //             fit: BoxFit.cover,
                          //             width: double.infinity,
                          //             color: const Color.fromARGB(71, 0, 0, 0),
                          //             colorBlendMode: BlendMode.darken,
                          //           ),
                          //         ),
                          //         const Padding(
                          //           padding: EdgeInsets.only(
                          //             top: 28.0,
                          //             right: 50,
                          //           ),
                          //           child: Row(
                          //             mainAxisAlignment:
                          //                 MainAxisAlignment.spaceAround,
                          //             children: [
                          //               Text.rich(
                          //                 TextSpan(
                          //                   children: [
                          //                     TextSpan(
                          //                       text: "cuddle",
                          //                       style: TextStyle(
                          //                         fontSize: 20,
                          //                         fontWeight: FontWeight.bold,
                          //                         color: Colors.white,
                          //                       ),
                          //                     ),
                          //                     TextSpan(
                          //                       text: "postnatal",
                          //                       style: TextStyle(
                          //                         fontSize: 15,
                          //                         fontWeight: FontWeight.bold,
                          //                         color: Colors.white,
                          //                       ),
                          //                     )
                          //                   ],
                          //                 ),
                          //               ),
                          //             ],
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          // 10.heightBox,
                          // InkWell(
                          //   onTap: () {
                          //     Navigator.push(
                          //       context,
                          //       MaterialPageRoute(
                          //         builder: (ctx) => const WriterScreen(),
                          //       ),
                          //     );
                          //   },
                          //   child: Container(
                          //     height: MediaQuery.of(context).size.height / 3.8,
                          //     width: double.infinity,
                          //     decoration: BoxDecoration(
                          //       // color: Colors.blue,
                          //       gradient: const LinearGradient(
                          //         colors: [
                          //           Colors.purple,
                          //           Colors.blue,
                          //         ],
                          //         begin: FractionalOffset(0.3, 0.0),
                          //         end: FractionalOffset(0.99, 0.0),
                          //       ),
                          //       borderRadius: BorderRadius.circular(20),
                          //     ),
                          //     child: Stack(
                          //       children: [
                          //         ClipRRect(
                          //           borderRadius: BorderRadius.circular(20),
                          //           child: Image.asset(
                          //             'assets/images/math-teacher.jpg',
                          //             fit: BoxFit.cover,
                          //             width: double.infinity,
                          //             height: double.infinity,
                          //             color: const Color.fromARGB(71, 0, 0, 0),
                          //             colorBlendMode: BlendMode.darken,
                          //           ),
                          //         ),
                          //         const Padding(
                          //           padding: EdgeInsets.only(
                          //             top: 120.0,
                          //             right: 150,
                          //           ),
                          //           child: Row(
                          //             mainAxisAlignment:
                          //                 MainAxisAlignment.spaceAround,
                          //             children: [
                          //               Text.rich(
                          //                 TextSpan(
                          //                   children: [
                          //                     TextSpan(
                          //                       text: "cuddle",
                          //                       style: TextStyle(
                          //                         fontSize: 20,
                          //                         fontWeight: FontWeight.bold,
                          //                         color: Colors.white,
                          //                       ),
                          //                     ),
                          //                     TextSpan(
                          //                       text: "postnatal",
                          //                       style: TextStyle(
                          //                         fontSize: 15,
                          //                         fontWeight: FontWeight.bold,
                          //                         color: Colors.white,
                          //                       ),
                          //                     )
                          //                   ],
                          //                 ),
                          //               ),
                          //             ],
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          const SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    )
                  : Expanded(
                      child: StreamBuilder(
                        stream: FirebaseFirestore.instance
                            .collection('UserData')
                            .where('username',
                                isGreaterThanOrEqualTo:
                                    controller.searchController.text)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData) {
                            return const CircularProgressIndicator().centered();
                          } else if (snapshot.data!.docs.isEmpty) {
                            return "No user found"
                                .text
                                .bold
                                .size(22)
                                .makeCentered();
                          } else {
                            var snap = snapshot.data!.docs;
                            return ListView(
                              children: List.generate(
                                snap.length,
                                (index) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      10.heightBox,
                                      "${snap[index]['username']}"
                                          .text
                                          .size(18)
                                          .medium
                                          .make()
                                          .p12()
                                    ],
                                  );
                                },
                              ),
                            );
                          }
                        },
                      ),
                    )
            ],
          ),
        ),
      ),
    );
  }
}

class ImageListContainer extends StatelessWidget {
  final List<String> imageUrls;

  ImageListContainer({required this.imageUrls});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          for (int i = 0; i < imageUrls.length; i++)
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ImageDetailPage(
                      imageUrl: imageUrls[i],
                      imageIndex: i,
                    ),
                  ),
                );
              },
              child: Image.network(
                imageUrls[i],
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
        ],
      ),
    );
  }
}

class ImageDetailPage extends StatelessWidget {
  final String imageUrl;
  final int imageIndex;

  ImageDetailPage({required this.imageUrl, required this.imageIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Detail'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            imageUrl,
            width: 300,
            height: 300,
            fit: BoxFit.contain,
          ),
          SizedBox(height: 16),
          Text(
            'Image Index: $imageIndex',
            style: TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}
