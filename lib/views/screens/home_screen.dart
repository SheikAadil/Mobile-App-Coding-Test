import 'package:flutter/material.dart';
import 'package:mobile_app_coding_test/views/screens/detail_screen.dart';
import 'package:mobile_app_coding_test/view_models/authentication_view_model.dart';
import 'package:mobile_app_coding_test/view_models/detail_view_model.dart';
import 'package:mobile_app_coding_test/view_models/home_view_model.dart';
import 'package:mobile_app_coding_test/views/widgets/hotel_info_tile.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  final String userName;
  final String userEmail;

  const HomeScreen({
    super.key,
    required this.userName,
    required this.userEmail,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeViewModel()..fetchHotels(),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            'List View',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.teal,
        ),
        body: Consumer<HomeViewModel>(
          builder: (context, homeVm, child) {
            final authVm = context.read<AuthenticationViewModel>();

            return SafeArea(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        Text(userName, style: const TextStyle(fontSize: 20)),
                        Text(userEmail),
                        GestureDetector(
                          onTap: () async {
                            await authVm.signOut();
                            Navigator.pop(context);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: 10),
                            height: 40,
                            width: 180,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.teal,
                            ),
                            child: const Center(
                              child: Text(
                                'Logout',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Expanded(
                    child: homeVm.isLoading
                        ? const Center(
                            child: CircularProgressIndicator(
                              color: Colors.teal,
                            ),
                          )
                        : ListView.builder(
                            padding: const EdgeInsets.only(bottom: 20),
                            itemCount: homeVm.hotels.length,
                            itemBuilder: (context, index) {
                              return hotelInfo(index, context);
                            },
                          ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget hotelInfo(int index, BuildContext context) {
    final homeVm = context.read<HomeViewModel>();
    final item = homeVm.hotels[index];

    return HotelInfoTile(
      title: item.title,
      address: item.address,
      imageUrl: item.imageUrl,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
              create: (_) => DetailViewModel(
                title: item.title,
                description: item.description,
                imageUrl: item.imageUrl,
                address: item.address,
                latitude: double.parse(item.latitude),
                longitude: double.parse(item.longitude),
              ),
              child: const DetailScreen(),
            ),
          ),
        );
      },
    );
  }
}
