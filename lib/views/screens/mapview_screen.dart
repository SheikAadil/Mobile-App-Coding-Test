import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:provider/provider.dart';
import 'package:mobile_app_coding_test/view_models/mapview_view_model.dart';

class MapViewScreen extends StatelessWidget {
  const MapViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mapViewModel = Provider.of<MapViewViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Location',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: buildMapContent(mapViewModel),
    );
  }

  Widget buildMapContent(MapViewViewModel mapViewViewModel) {
    if (!mapViewViewModel.permissionGranted) {
      return const Center(child: CircularProgressIndicator());
    }

    return FlutterMap(
      mapController: mapViewViewModel.mapController,
      options: MapOptions(
        initialCenter: mapViewViewModel.position,
        initialZoom: 14.0,
      ),
      children: [buildTileLayer(), buildMarkerLayer(mapViewViewModel)],
    );
  }

  TileLayer buildTileLayer() {
    return TileLayer(
      urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
      userAgentPackageName: 'com.example.mobile_app_coding_test',
    );
  }

  MarkerLayer buildMarkerLayer(MapViewViewModel mapViewViewModel) {
    return MarkerLayer(
      markers: [
        Marker(
          point: mapViewViewModel.position,
          width: 350,
          height: 150,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 4,
                      offset: Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      mapViewViewModel.title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      mapViewViewModel.address,
                      style: const TextStyle(fontSize: 12),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 4),
              const Icon(Icons.location_pin, color: Colors.red, size: 40),
            ],
          ),
        ),
      ],
    );
  }
}
