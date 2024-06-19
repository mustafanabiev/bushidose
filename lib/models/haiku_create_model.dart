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
  final String image;
  final File? image2;
  final String date;
  final int countImage;
}
