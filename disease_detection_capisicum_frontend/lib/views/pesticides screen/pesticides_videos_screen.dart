import 'package:disease_detection_capisicum/controllers/pesticides_controller.dart';
import 'package:disease_detection_capisicum/utils/style/app_color.dart';
import 'package:disease_detection_capisicum/utils/style/app_style.dart';
import 'package:disease_detection_capisicum/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PesticidesVideosScreen extends GetView<PesticidesController> {
  PesticidesVideosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.kPrimaryColor,
          title: const CustomText(
              text: 'Use of Pesticides', style: AppStyle.montserratBoldWhite14),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: controller.youtubeControllers.length,
          itemBuilder: (context, index) {
            return Container(
              child: YoutubePlayerBuilder(
                player: YoutubePlayer(
                  controller: controller.youtubeControllers[index],
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: Colors.white,
                  progressColors: const ProgressBarColors(
                    playedColor: Colors.amber,
                    handleColor: Colors.amberAccent,
                  ),
                ),
                builder: (context, player) => Center(
                  child: Hero(
                    tag: controller.videoIds[index],
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: player,
                    ),
                  ),
                ),
              ),
            ).paddingAll(12);
          },
        ),
      ),
    );
  }
}
