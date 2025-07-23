import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PesticidesController extends GetxController {
  RxInt selectedIndex = 0.obs;
  List<YoutubePlayerController> youtubeControllers = [];

  RxList<String> videoIds = <String>[
    'MAlfQJlFIS0', // Replace with your YouTube video IDs
    '86TRPgoiUUo',
    'Y_01mdVCX8Q',
    'HTyca5m9cYE',
    'GLllZ-qiXJA',
  ].obs;

  @override
  void onInit() {
    super.onInit();
    youtubeControllers = videoIds
        .map((videoId) => YoutubePlayerController(
              initialVideoId: videoId,
              flags: const YoutubePlayerFlags(
                autoPlay: false,
                mute: true,
                useHybridComposition: true,
              ),
            ))
        .toList();
  }
}
