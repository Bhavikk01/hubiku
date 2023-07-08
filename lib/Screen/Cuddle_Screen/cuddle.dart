import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hukibu/Screen/Cuddle_Screen/course_video.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:hukibu/Screen/Cuddle_Screen/cuddle_details.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CuddleScreen extends StatefulWidget {
  const CuddleScreen({super.key});

  @override
  State<CuddleScreen> createState() => _CuddleScreenState();
}

class _CuddleScreenState extends State<CuddleScreen>
    with TickerProviderStateMixin {
  List<Map<String, String>> dataList = [
    {
      'imageUrl': 'https://i.postimg.cc/KcP19fg8/avatar.png',
      'title': 'Namrata Sharma',
      'subtitle': 'Certified Children Educator',
    },
    {
      'imageUrl': 'https://i.postimg.cc/KcP19fg8/avatar.png',
      'title': 'Bharti Goal',
      'subtitle': 'Certified Children Educator',
    },
    {
      'imageUrl': 'https://i.postimg.cc/KcP19fg8/avatar.png',
      'title': 'Dr Divya Jose',
      'subtitle': 'Certified Children Educator',
    },

    // Add more items as needed
  ];

  List<String> cuddleHeader = [
    "Overcome Screen Addiction",
    "Get expert assistance and personal care in the beginning of your journey as a parent. Because, smart parents raise smart kids, happy parent raise happy kids",
    "\₹100",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image.network(
            'https://i.postimg.cc/J08fT6L1/IMG-2743.jpg',
            fit: BoxFit.cover,
          ),
          // Container(
          //     height: MediaQuery.of(context).size.height / 3.3,
          //     width: double.infinity,
          //     decoration: const BoxDecoration(
          //       gradient: LinearGradient(
          //         colors: [
          //           Colors.purple,
          //           Colors.blue,
          //         ],
          //         begin: FractionalOffset(0.5, 0.0),
          //         end: FractionalOffset(0.99, 0.0),
          //       ),
          //     ),
          //     child: Stack(
          //       children: [
          //         Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: [
          //             Image.asset('assets/images/img1.png'),
          //             Text.rich(
          //               TextSpan(children: [
          //                 TextSpan(
          //                   text: "cuddle".tr(),
          //                   style: const TextStyle(
          //                       fontSize: 15,
          //                       fontWeight: FontWeight.bold,
          //                       color: Colors.white),
          //                 ),
          //                 const TextSpan(
          //                   text: "postnatal",
          //                   style: TextStyle(
          //                       fontSize: 10,
          //                       fontWeight: FontWeight.bold,
          //                       color: Colors.white),
          //                 )
          //               ]),
          //             ),
          //           ],
          //         ),
          //       ],
          //     )),
          Expanded(
            child: Container(
              color: const Color.fromARGB(255, 242, 238, 238),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: ListView(
                  //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CuddleHeader(dynamicTextList: cuddleHeader),
                    // const Text(
                    //   "cuddle postnatal",
                    //   style:
                    //       TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    // ).tr(),
                    // 30.heightBox,
                    // const Text(
                    //         "Get expert assistance and personal care in the beginning of your journey as a parent .Because,smart parents raise smart kids, happy parent raise happy kids")
                    //     .tr(),
                    // const SizedBox(
                    //   height: 40,
                    // ),
                    // const Padding(
                    //   padding: EdgeInsets.only(top: 8.0, left: 20),
                    //   child: Text(
                    //     "\$100",
                    //     style: TextStyle(
                    //         fontWeight: FontWeight.bold, fontSize: 20),
                    //   ),
                    // ),
                    20.heightBox,
                    const Text(
                      "WHAT YOU GET",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                    ).tr(),
                    20.heightBox,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height / 18,
                            width: MediaQuery.of(context).size.width / 5,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color.fromARGB(255, 94, 92, 92)),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Icon(Icons.timer_outlined),
                                const Text(
                                  "5 mins\ndaily",
                                  style: TextStyle(fontSize: 12),
                                ).tr(),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height / 18,
                            width: MediaQuery.of(context).size.width / 4.5,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color.fromARGB(255, 94, 92, 92)),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Icon(Icons.person_2_rounded),
                                const Text(
                                  "One to One\nSession",
                                  style: TextStyle(fontSize: 10),
                                ).tr(),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height / 18,
                            width: MediaQuery.of(context).size.width / 4.5,
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: const Color.fromARGB(255, 94, 92, 92)),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Icon(Icons.local_activity),
                                const Text(
                                  "Activities",
                                  style: TextStyle(fontSize: 12),
                                ).tr(),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height / 18,
                            width: MediaQuery.of(context).size.width / 5,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: const Color.fromARGB(255, 94, 92, 92),
                              ),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Icon(Icons.add_box_outlined),
                                const Text(
                                  "Bounes",
                                  style: TextStyle(fontSize: 12),
                                ).tr(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    const Text(
                      "Experience and leran with ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      ),
                    ).tr(),
                    20.heightBox,
                    // Container(
                    //   height: MediaQuery.of(context).size.height / 12,
                    //   width: double.infinity,
                    //   decoration: BoxDecoration(
                    //     color: const Color.fromARGB(99, 136, 163, 181),
                    //     borderRadius: BorderRadius.circular(15),
                    //   ),
                    //   child: Padding(
                    //     padding: const EdgeInsets.only(left: 15.0),
                    //     child: Row(
                    //       //mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //       children: [
                    //         CircleAvatar(
                    //           radius: 25,
                    //           backgroundColor: Colors.cyan,
                    //           // child: Image.network(
                    //           //     'https://i.postimg.cc/mg0hKBTM/car.jpg'),
                    //         ),
                    //         10.widthBox,
                    //         const Text.rich(TextSpan(children: [
                    //           TextSpan(
                    //               text: 'Nishana Am\n',
                    //               style: TextStyle(
                    //                   fontWeight: FontWeight.bold,
                    //                   fontSize: 18)),
                    //           TextSpan(text: 'Lactation Consultant')
                    //         ])),
                    //         20.widthBox,
                    //         Container(
                    //           height: MediaQuery.of(context).size.height / 18,
                    //           width: MediaQuery.of(context).size.width / 4,
                    //           decoration: BoxDecoration(
                    //               color: const Color.fromARGB(255, 2, 215, 112),
                    //               borderRadius: BorderRadius.circular(20)),
                    //           child: Row(
                    //             mainAxisAlignment:
                    //                 MainAxisAlignment.spaceAround,
                    //             children: [
                    //               const Text(
                    //                 "consult",
                    //                 style:
                    //                     TextStyle(fontWeight: FontWeight.bold),
                    //               ).tr(),
                    //               const Icon(Icons.arrow_forward)
                    //             ],
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    // 10.heightBox,
                    // Container(
                    //   height: MediaQuery.of(context).size.height / 12,
                    //   width: double.infinity,
                    //   decoration: BoxDecoration(
                    //       color: const Color.fromARGB(99, 136, 163, 181),
                    //       borderRadius: BorderRadius.circular(15)),
                    //   child: Padding(
                    //     padding: const EdgeInsets.only(left: 15.0),
                    //     child: Row(
                    //       //mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //       children: [
                    //         const CircleAvatar(
                    //           radius: 25,
                    //           backgroundColor: Colors.cyan,
                    //           // backgroundImage:
                    //           //     AssetImage('assets/images/4.jpg'),
                    //         ),
                    //         10.widthBox,
                    //         const Text.rich(TextSpan(children: [
                    //           TextSpan(
                    //               text: 'Namrata Sharma\n',
                    //               style: TextStyle(
                    //                   fontWeight: FontWeight.bold,
                    //                   fontSize: 18)),
                    //           TextSpan(
                    //               text: 'Certified Children Educator',
                    //               style: TextStyle(fontSize: 12))
                    //         ])),
                    //         20.widthBox,
                    //         Container(
                    //           height: MediaQuery.of(context).size.height / 18,
                    //           width: MediaQuery.of(context).size.width / 4,
                    //           decoration: BoxDecoration(
                    //               color: const Color.fromARGB(255, 2, 215, 112),
                    //               borderRadius: BorderRadius.circular(20)),
                    //           child: Row(
                    //             mainAxisAlignment:
                    //                 MainAxisAlignment.spaceAround,
                    //             children: [
                    //               const Text(
                    //                 "consult",
                    //                 style:
                    //                     TextStyle(fontWeight: FontWeight.bold),
                    //               ).tr(),
                    //               const Icon(Icons.arrow_forward)
                    //             ],
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    // 10.heightBox,
                    // Container(
                    //   height: MediaQuery.of(context).size.height / 12,
                    //   width: double.infinity,
                    //   decoration: BoxDecoration(
                    //       color: const Color.fromARGB(99, 136, 163, 181),
                    //       borderRadius: BorderRadius.circular(15)),
                    //   child: Padding(
                    //     padding: const EdgeInsets.only(left: 15.0),
                    //     child: Row(
                    //       //mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //       children: [
                    //         const CircleAvatar(
                    //           radius: 25,
                    //           backgroundColor: Colors.cyan,
                    //           // backgroundImage:
                    //           //     AssetImage('assets/images/4.jpg'),
                    //         ),
                    //         20.widthBox,
                    //         const Text.rich(TextSpan(children: [
                    //           TextSpan(
                    //               text: 'Bharti Gaol\n',
                    //               style: TextStyle(
                    //                   fontWeight: FontWeight.bold,
                    //                   fontSize: 18)),
                    //           TextSpan(
                    //               text:
                    //                   'CAPPA Certified \nChilbirth Educator\n and Prenatal \nYoga Instruction',
                    //               style: TextStyle(fontSize: 12))
                    //         ])),
                    //         50.widthBox,
                    //         Container(
                    //           height: MediaQuery.of(context).size.height / 18,
                    //           width: MediaQuery.of(context).size.width / 4,
                    //           decoration: BoxDecoration(
                    //               color: const Color.fromARGB(255, 2, 215, 112),
                    //               borderRadius: BorderRadius.circular(20)),
                    //           child: Row(
                    //             mainAxisAlignment:
                    //                 MainAxisAlignment.spaceAround,
                    //             children: [
                    //               const Text(
                    //                 "consult",
                    //                 style:
                    //                     TextStyle(fontWeight: FontWeight.bold),
                    //               ).tr(),
                    //               const Icon(Icons.arrow_forward)
                    //             ],
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    // 10.heightBox,
                    // Container(
                    //   height: MediaQuery.of(context).size.height / 12,
                    //   width: double.infinity,
                    //   decoration: BoxDecoration(
                    //       color: const Color.fromARGB(99, 136, 163, 181),
                    //       borderRadius: BorderRadius.circular(15)),
                    //   child: Padding(
                    //     padding: const EdgeInsets.only(left: 15.0),
                    //     child: Row(
                    //       //mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //       children: [
                    //         const CircleAvatar(
                    //           radius: 25,
                    //           backgroundColor: Colors.cyan,
                    //           // backgroundImage:
                    //           //     AssetImage('assets/images/4.jpg'),
                    //         ),
                    //         20.widthBox,
                    //         const Text.rich(TextSpan(children: [
                    //           TextSpan(
                    //               text: 'Dr Divya Jose\n',
                    //               style: TextStyle(
                    //                   fontWeight: FontWeight.bold,
                    //                   fontSize: 18)),
                    //           TextSpan(
                    //               text:
                    //                   'Consultant Obstetriction\n and Gynecologist',
                    //               style: TextStyle(fontSize: 12))
                    //         ])),
                    //         20.widthBox,
                    //         Container(
                    //           height: MediaQuery.of(context).size.height / 18,
                    //           width: MediaQuery.of(context).size.width / 4,
                    //           decoration: BoxDecoration(
                    //               color: const Color.fromARGB(255, 2, 215, 112),
                    //               borderRadius: BorderRadius.circular(20)),
                    //           child: Row(
                    //             mainAxisAlignment:
                    //                 MainAxisAlignment.spaceAround,
                    //             children: [
                    //               const Text(
                    //                 "consult",
                    //                 style:
                    //                     TextStyle(fontWeight: FontWeight.bold),
                    //               ).tr(),
                    //               const Icon(Icons.arrow_forward)
                    //             ],
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    // 10.heightBox,
                    // Container(
                    //   height: MediaQuery.of(context).size.height / 12,
                    //   width: double.infinity,
                    //   decoration: BoxDecoration(
                    //       color: const Color.fromARGB(99, 136, 163, 181),
                    //       borderRadius: BorderRadius.circular(15)),
                    //   child: Padding(
                    //     padding: const EdgeInsets.only(left: 15.0),
                    //     child: Row(
                    //       //mainAxisAlignment: MainAxisAlignment.spaceAround,
                    //       children: [
                    //         const CircleAvatar(
                    //           radius: 25,
                    //           backgroundColor: Colors.cyan,
                    //           // backgroundImage:
                    //           //     AssetImage('assets/images/4.jpg'),
                    //         ),
                    //         20.widthBox,
                    //         const Text.rich(TextSpan(children: [
                    //           TextSpan(
                    //               text: 'Dr Seema Lal\n',
                    //               style: TextStyle(
                    //                   fontWeight: FontWeight.bold,
                    //                   fontSize: 18)),
                    //           TextSpan(
                    //               text:
                    //                   'Psychologist Spacail\n Educator, Mentol \nHealth Research',
                    //               style: TextStyle(fontSize: 12))
                    //         ])),
                    //         40.widthBox,
                    //         Container(
                    //           height: MediaQuery.of(context).size.height / 18,
                    //           width: MediaQuery.of(context).size.width / 4,
                    //           decoration: BoxDecoration(
                    //               color: const Color.fromARGB(255, 2, 215, 112),
                    //               borderRadius: BorderRadius.circular(20)),
                    //           child: Row(
                    //             mainAxisAlignment:
                    //                 MainAxisAlignment.spaceAround,
                    //             children: [
                    //               const Text(
                    //                 "consult",
                    //                 style:
                    //                     TextStyle(fontWeight: FontWeight.bold),
                    //               ).tr(),
                    //               const Icon(Icons.arrow_forward)
                    //             ],
                    //           ),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    //  10.heightBox,
                    MyListView(dataList: dataList), // navin 27th june
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => const CuddleDetails()));
                      },
                      child: Container(
                        height: MediaQuery.of(context).size.height / 24,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black)),
                        child: const Center(
                          child: Text(
                            'LERAN MORE',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.blue),
                          ),
                        ),
                      ),
                    ),
                    20.heightBox,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (ctx) =>  CourseVideo(),
                                  ),
                                );
                              },
                              child: Container(
                                height: MediaQuery.of(context).size.height / 5,
                                width: MediaQuery.of(context).size.width / 2.5,
                                decoration: BoxDecoration(
                                  color: const Color.fromARGB(195, 16, 89, 192),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 58.0),
                                  child: Column(
                                    children: [
                                      const Icon(
                                        Icons.calendar_today,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                      10.heightBox,
                                      const Text(
                                        'Change After\n   Delivery',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height / 5,
                              width: MediaQuery.of(context).size.width / 2.5,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(195, 16, 89, 192),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 58.0),
                                child: Column(
                                  children: [
                                    const Icon(
                                      Icons.calendar_today,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    10.heightBox,
                                    const Text(
                                      'Recovery Timeline',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        15.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height / 5,
                              width: MediaQuery.of(context).size.width / 2.5,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(195, 16, 89, 192),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 58.0),
                                child: Column(
                                  children: [
                                    const Icon(
                                      Icons.calendar_today,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    10.heightBox,
                                    const Text(
                                      'C-Section\n Recovery',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height / 5,
                              width: MediaQuery.of(context).size.width / 2.5,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(195, 16, 89, 192),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 58.0),
                                child: Column(
                                  children: [
                                    const Icon(
                                      Icons.calendar_today,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    10.heightBox,
                                    const Text(
                                      'Medical Needs',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        15.heightBox,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height / 5,
                              width: MediaQuery.of(context).size.width / 2.5,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(195, 16, 89, 192),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 58.0),
                                child: Column(
                                  children: [
                                    const Icon(
                                      Icons.calendar_today,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    10.heightBox,
                                    const Text(
                                      'Family Report',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height / 5,
                              width: MediaQuery.of(context).size.width / 2.5,
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(195, 16, 89, 192),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.only(top: 58.0),
                                child: Column(
                                  children: [
                                    const Icon(
                                      Icons.calendar_today,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                    10.heightBox,
                                    const Text(
                                      'Store the Banner',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 15),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
//

// navin 27th june

class MyListView extends StatelessWidget {
  final List<Map<String, String>> dataList;

  MyListView({required this.dataList});

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
                borderRadius: BorderRadius.circular(15)),
            child: Center(
              child: ListTile(
                leading: CircleAvatar(
                  radius: 26,
                  backgroundImage: NetworkImage(item['imageUrl'] ?? ''),
                ),
                title: Text(
                  item['title'] ?? '',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  item['subtitle'] ?? '',
                  style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12),
                ),
                // trailing: Container(
                //   height: MediaQuery.of(context).size.height / 18,
                //   width: MediaQuery.of(context).size.width / 4,
                //   decoration: BoxDecoration(
                //       color: const Color.fromARGB(255, 2, 215, 112),
                //       borderRadius: BorderRadius.circular(20)),
                //   child: Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                //     children: [
                //       const Text(
                //         "consult",
                //         style: TextStyle(fontWeight: FontWeight.bold),
                //       ).tr(),
                //       const Icon(Icons.arrow_forward)
                //     ],
                //   ),
                // ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class CuddleHeader extends StatelessWidget {
  final List<String> dynamicTextList;

  const CuddleHeader({required this.dynamicTextList});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          dynamicTextList[0],
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 30),
        Text(
          dynamicTextList[1],
        ),
        SizedBox(height: 40),
        Padding(
          padding: EdgeInsets.only(top: 8.0, left: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                dynamicTextList[2],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              Container(
                height: MediaQuery.of(context).size.height / 18,
                width: MediaQuery.of(context).size.width / 3,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 2, 215, 112),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      "Join Now",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ).tr(),
                    const Icon(Icons.arrow_forward)
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class CuddleData {
  final String imageUrl;
  final String title;
  final String subtitle;

  CuddleData({
    required this.imageUrl,
    required this.title,
    required this.subtitle,
  });

  factory CuddleData.fromJson(Map<String, dynamic> json) {
    return CuddleData(
      imageUrl: json['imageUrl'],
      title: json['title'],
      subtitle: json['subtitle'],
    );
  }
}

Future<CuddleData> fetchCuddleData() async {
  final response = await http.get(Uri.parse('https://api.example.com'));

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body);
    return CuddleData.fromJson(jsonData);
  } else {
    throw Exception('Failed to fetch user data');
  }
}

class CuddleHeaderData {
  final String title;
  final String description;
  final String price;

  CuddleHeaderData({
    required this.title,
    required this.description,
    required this.price,
  });

  factory CuddleHeaderData.fromJson(Map<String, dynamic> json) {
    return CuddleHeaderData(
      title: json['title'],
      description: json['description'],
      price: json['price'],
    );
  }
}

Future<CuddleHeaderData> fetchCuddleHeaderData() async {
  final response = await http.get(Uri.parse('https://api.example.com'));

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body);
    return CuddleHeaderData.fromJson(jsonData);
  } else {
    throw Exception('Failed to fetch user data');
  }
}
