import 'package:disease_detection_capisicum/views/analysis%20screen/analysis_screen.dart';
import 'package:disease_detection_capisicum/views/bacterial%20blight%20screen/bacterial_blight_screen.dart';
import 'package:disease_detection_capisicum/views/bacterial%20leaf%20spot%20screen/bacterial_leaf_pot_screen.dart';
import 'package:disease_detection_capisicum/views/bacterial%20wilt%20screen/bacterial_wilt_screen.dart';
import 'package:disease_detection_capisicum/views/home%20screen/home_screen.dart';
import 'package:disease_detection_capisicum/views/login%20screen/login_screen.dart';
import 'package:disease_detection_capisicum/views/pesticides%20screen/pesticides_videos_screen.dart';
import 'package:disease_detection_capisicum/views/powdery%20mildew%20screen/powdery_mildew_screen.dart';
import 'package:disease_detection_capisicum/views/profile%20screen/profile_screen.dart';
import 'package:disease_detection_capisicum/views/signup%20screen/signup_screen.dart';
import 'package:get/get.dart';

appRoutes() => [
      GetPage(
        name: '/login-screen',
        page: () => LoginScreen(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 1000),
      ),
      GetPage(
        name: '/signup-screen',
        page: () => SignupScreen(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 1000),
      ),
      GetPage(
        name: '/home-screen',
        page: () => const HomeScreen(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 1000),
      ),
      GetPage(
        name: '/analysis-screen',
        page: () => AnalysisScreen(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 1000),
      ),
      GetPage(
        name: '/pestisides-screen',
        page: () => PesticidesVideosScreen(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 1000),
      ),
      GetPage(
        name: '/bacterialWilt-screen',
        page: () => const BacterialWiltScreen(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 1000),
      ),
      GetPage(
        name: '/powderyMildew-screen',
        page: () => const PowderyMildewScreen(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 1000),
      ),
      GetPage(
        name: '/bacterialLeafSpot-screen',
        page: () => const BacterialLeafSpotScreen(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 1000),
      ),
      GetPage(
        name: '/bacterialBlight-screen',
        page: () => const BacterialBlightScreen(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 1000),
      ),
      GetPage(
        name: '/profile-screen',
        page: () => const ProfileScreen(),
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 1000),
      ),
    ];
