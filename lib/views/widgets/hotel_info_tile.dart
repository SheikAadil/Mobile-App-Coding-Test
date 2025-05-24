import 'package:flutter/material.dart';
import 'package:mobile_app_coding_test/views/widgets/network_image_widget.dart';

class HotelInfoTile extends StatefulWidget {
  final VoidCallback onTap;
  final String title;
  final String address;
  final String imageUrl;

  const HotelInfoTile({
    super.key,
    required this.onTap,
    required this.title,
    required this.address,
    required this.imageUrl,
  });

  @override
  State<HotelInfoTile> createState() => _HotelInfoTileState();
}

class _HotelInfoTileState extends State<HotelInfoTile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: widget.onTap,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
            child: Row(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10),
                  child: buildImage(),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(fontSize: 16),
                      ),
                      Text(
                        widget.address,
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 35),
          color: Colors.grey[300],
          height: 2,
        ),
      ],
    );
  }

  Widget buildImage() {
    return NetworkImageWidget(
      imageUrl: widget.imageUrl,
      width: 60,
      height: 60,
      shape: BoxShape.circle,
      backgroundColor: Colors.grey[200]!,
      fit: BoxFit.cover,
    );
  }
}
