import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomAssetsImage extends StatelessWidget {
  final String imagePath;
  final double height;
  final double width;
  final BoxFit boxFit;

  const CustomAssetsImage({
    Key? key,
    required this.imagePath,
    this.height = 20,
    this.width = 20,
    this.boxFit = BoxFit.cover,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String extension = imagePath.split(".").last;

    switch (extension) {
      case 'svg':
        return SvgPicture.asset(
          imagePath,
          width: width,
          height: height,
          fit: boxFit,
        );
      case 'jpg':
      case 'png':
        return Image.asset(
          imagePath,
          width: width,
          height: height,
          fit: boxFit,
        );
      default:
        throw FormatException("Image format $extension is not supported");
    }
  }
}
