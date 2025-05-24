import 'package:flutter/material.dart';
import 'package:mobile_app_coding_test/views/screens/mapview_screen.dart';
import 'package:mobile_app_coding_test/view_models/detail_view_model.dart';
import 'package:mobile_app_coding_test/view_models/mapview_view_model.dart';
import 'package:mobile_app_coding_test/views/widgets/network_image_widget.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final detailViewModel = Provider.of<DetailViewModel>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Details',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.teal,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          ),
          actions: [
            IconButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChangeNotifierProvider(
                    create: (_) => MapViewViewModel(
                      title: detailViewModel.title,
                      address: detailViewModel.address,
                      latitude: detailViewModel.latitude,
                      longitude: detailViewModel.longitude,
                    ),
                    child: const MapViewScreen(),
                  ),
                ),
              ),
              icon: Icon(Icons.location_pin, color: Colors.black),
            ),
          ],
        ),
        body: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                buildDetailImage(detailViewModel.imageUrl),
                const SizedBox(height: 10),
                Text(
                  detailViewModel.title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 23,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  detailViewModel.description,
                  style: const TextStyle(color: Colors.black54),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildDetailImage(String imageUrl) {
    return NetworkImageWidget(
      imageUrl: imageUrl,
      width: double.infinity,
      height: 200,
      shape: BoxShape.rectangle,
      borderRadius: 10,
      backgroundColor: Colors.grey[200]!,
      fit: BoxFit.cover,
      errorIconSize: 50,
    );
  }
}
