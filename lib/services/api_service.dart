import 'dart:convert';
import 'package:mobile_app_coding_test/models/hotel_info_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  Future<List<HotelInfoModel>> getHotelInfo() async {
    List<HotelInfoModel> items = [];
    final response = await http.get(
      Uri.parse(
        'https://dl.dropboxusercontent.com/s/6nt7fkdt7ck0lue/hotels.json',
      ),
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      final List<dynamic> list = jsonResponse['data'];
      for (var e in list) {
        items.add(
          HotelInfoModel(
            id: e['id'] ?? 0,
            title: e['title'] ?? '',
            description: e['description'] ?? '',
            address: e['address'] ?? '',
            postcode: e['postcode'] ?? '',
            phoneNumber: e['phoneNumber'] ?? '',
            latitude: e['latitude']?.toString() ?? '0.0',
            longitude: e['longitude']?.toString() ?? '0.0',
            imageUrl: e['image']['large'] ?? '',
          ),
        );
      }
    }
    return items;
  }
}
