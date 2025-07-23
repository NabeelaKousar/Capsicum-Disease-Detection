import 'package:disease_detection_capisicum/utils/style/app_color.dart';
import 'package:flutter/material.dart';

class CustomNetworkImage extends StatelessWidget {
  final String imageUrl;

  const CustomNetworkImage({
    Key? key,
    required this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 30,
      backgroundColor: AppColor.kBackgroundColor,
      backgroundImage: imageUrl.isNotEmpty ? NetworkImage(imageUrl) : null,
      child:
          imageUrl.isEmpty ? const Icon(Icons.account_circle, size: 30) : null,
    );
  }
}
