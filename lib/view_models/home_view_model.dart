import 'package:flutter/foundation.dart';
import 'package:mobile_app_coding_test/services/api_service.dart';
import 'package:mobile_app_coding_test/models/hotel_info_model.dart';

class HomeViewModel extends ChangeNotifier {
  final ApiService apiService = ApiService();
  List<HotelInfoModel> _hotels = [];
  bool _isLoading = true;

  List<HotelInfoModel> get hotels => _hotels;
  bool get isLoading => _isLoading;

  Future<void> fetchHotels() async {
    _isLoading = true;
    notifyListeners();

    _hotels = await apiService.getHotelInfo();

    _isLoading = false;
    notifyListeners();
  }
}
