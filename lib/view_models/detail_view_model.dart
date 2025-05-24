import 'package:flutter/material.dart';

class DetailViewModel extends ChangeNotifier {
  final String title;
  final String description;
  final String imageUrl;
  final String address;
  final double latitude;
  final double longitude;

  DetailViewModel({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.address,
    required this.latitude,
    required this.longitude,
  });
}
