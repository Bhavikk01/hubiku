import 'package:http/http.dart' as http;
import 'dart:convert';

class Course {
  final int id;
  final String courseName;
  final String courseDesc;
  final String instructorOccupation;
  final String instructorName;
  final String instructorDesc;
  final int price;
  final String whatYouGet;
  final String createdAt;

  Course({
    required this.id,
    required this.courseName,
    required this.courseDesc,
    required this.instructorOccupation,
    required this.instructorName,
    required this.instructorDesc,
    required this.price,
    required this.whatYouGet,
    required this.createdAt,
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      courseName: json['courseName'],
      courseDesc: json['courseDesc'],
      instructorOccupation: json['instructorOccupation'],
      instructorName: json['instructorName'],
      instructorDesc: json['instructorDesc'],
      price: json['price'],
      whatYouGet: json['whatYouGet'],
      createdAt: json['createdAt'],
    );
  }
}

Future<List<Course>> fetchCourses() async {
  final url = Uri.parse('http://13.126.205.178:3000/courses/all');
  final response = await http.get(url);

  if (response.statusCode == 200) {
    final List<dynamic> jsonData = jsonDecode(response.body);
    return jsonData.map((courseData) => Course.fromJson(courseData)).toList();
  } else {
    throw Exception('Failed to fetch courses');
  }
}
