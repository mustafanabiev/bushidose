import 'dart:convert';
import 'dart:typed_data';
import 'dart:io';

class HaikuCreateModel {
  const HaikuCreateModel({
    required this.title,
    required this.line1,
    required this.line2,
    required this.line3,
    required this.image,
    required this.image2,
    required this.date,
    required this.countImage,
  });

  final String title;
  final String line1;
  final String line2;
  final String line3;
  final Uint8List image;
  final File? image2;
  final String date;
  final int countImage;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'line1': line1,
      'line2': line2,
      'line3': line3,
      'image': base64Encode(image),
      'image2': image2?.path,
      'date': date,
      'countImage': countImage,
    };
  }

  factory HaikuCreateModel.fromMap(Map<String, dynamic> map) {
    return HaikuCreateModel(
      title: map['title'] as String,
      line1: map['line1'] as String,
      line2: map['line2'] as String,
      line3: map['line3'] as String,
      image: base64Decode(map['image'] as String),
      image2: map['image2'] != null ? File(map['image2'] as String) : null,
      date: map['date'] as String,
      countImage: map['countImage'] as int,
    );
  }
}
