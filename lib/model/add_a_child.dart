import 'package:http/http.dart' as http;
import 'dart:convert';

class AddAChild {
  final String parentId;
  final String name;
  final String nickName;
  final String DOB;
  final int relation;
  final int gender;
  final int calmHimselfByBringingHandToMouth;
  final int expressEmotionsLikePleasureAndDiscomfort;
  final int tryToLookForHisParent;
  final int recognizeFamilyFaces;
  final int smileAtFamiliarFaces;
  final int respondPositivelyToTouch;
  final int makeGurglingSound;
  final int cryDifferentlyOnDifferentNeed;
  final int tryToImitateSound;
  final int followPeopleWithHisEyes;
  final int followObjectWithHisEyes;
  final int observeFacesWithInterest;
  final int raiseHisHeadLyingOnHisStomach;
  final int bringHisHandToHisMouth;
  final int tryToTouchDanglingObjects;
  final int hasStartedToSmileAtOthers;

  AddAChild({
    required this.parentId,
    required this.name,
    required this.nickName,
    required this.DOB,
    required this.relation,
    required this.gender,
    required this.calmHimselfByBringingHandToMouth,
    required this.expressEmotionsLikePleasureAndDiscomfort,
    required this.tryToLookForHisParent,
    required this.recognizeFamilyFaces,
    required this.smileAtFamiliarFaces,
    required this.respondPositivelyToTouch,
    required this.makeGurglingSound,
    required this.cryDifferentlyOnDifferentNeed,
    required this.tryToImitateSound,
    required this.followPeopleWithHisEyes,
    required this.followObjectWithHisEyes,
    required this.observeFacesWithInterest,
    required this.raiseHisHeadLyingOnHisStomach,
    required this.bringHisHandToHisMouth,
    required this.tryToTouchDanglingObjects,
    required this.hasStartedToSmileAtOthers,
  });

  factory AddAChild.fromJson(Map<String, dynamic> json) {
    return AddAChild(
      parentId: json['parentId'],
      name: json['name'],
      nickName: json['nickName'],
      DOB: json['DOB'],
      relation: json['relation'],
      gender: json['gender'],
      calmHimselfByBringingHandToMouth: json['calm_himself_by_bringing_hand_to_mouth'],
      expressEmotionsLikePleasureAndDiscomfort: json['express_emotions_like_pleasure_and_discomfort'],
      tryToLookForHisParent: json['try_to_look_for_his_parent'],
      recognizeFamilyFaces: json['recognize_family_faces'],
      smileAtFamiliarFaces: json['smile_at_familiar_faces'],
      respondPositivelyToTouch: json['respond_positively_to_touch'],
      makeGurglingSound: json['make_gurgling_sound'],
      cryDifferentlyOnDifferentNeed: json['cry_differently_on_different_need'],
      tryToImitateSound: json['try_to_imitate_sound'],
      followPeopleWithHisEyes: json['follow_people_with_his_eyes'],
      followObjectWithHisEyes: json['follow_object_with_his_eyes'],
      observeFacesWithInterest: json['observe_faces_with_interest'],
      raiseHisHeadLyingOnHisStomach: json['raise_his_head_lying_on_his_stomach'],
      bringHisHandToHisMouth: json['bring_his_hand_to_his_mouth'],
      tryToTouchDanglingObjects: json['try_to_touch_dangling_objects'],
      hasStartedToSmileAtOthers: json['has_started_to_smile_at_others'],
    );
  }
}

Future<AddAChild> fetchAddAChildData() async {
  final response = await http.get(Uri.parse('https://api.example.com'));

  if (response.statusCode == 200) {
    final jsonData = jsonDecode(response.body);
    return AddAChild.fromJson(jsonData);
  } else {
    throw Exception('Failed to fetch child data');
  }
}
