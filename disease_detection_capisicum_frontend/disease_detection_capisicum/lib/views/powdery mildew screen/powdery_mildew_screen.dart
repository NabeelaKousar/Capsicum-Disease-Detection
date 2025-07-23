import 'package:disease_detection_capisicum/utils/style/app_color.dart';
import 'package:disease_detection_capisicum/utils/style/app_style.dart';
import 'package:disease_detection_capisicum/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class PowderyMildewScreen extends StatelessWidget {
  const PowderyMildewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.kPrimaryColor,
          title: const CustomText(
            text: 'Crown Gall',
            style: AppStyle.montserratBoldWhite14,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Html(
              data: """
              <h1>Crown Gall</h1>
              <p><strong>Crown Gall</strong> a persistent fungal disease affecting a wide range of plants, presents a formidable challenge to gardeners and farmers worldwide. Recognizable by its powdery white coating on leaves and stems, this fungal infection thrives in moderate temperatures and dry environments, typically between 15-26°C (59-79°F) </p>
              <h2>Symptoms</h2>
              <p>Initially appearing as small white spots on leaves, powdery mildew quickly spreads, covering plant surfaces with a fine white powder. As the infection progresses, leaves may curl, turn yellow, and prematurely drop, severely impacting plant health and reducing crop yields. Fruit and vegetable quality can also suffer, affecting marketability.</p>
              <h2>Management</h2>
              <p>Promote good air circulation by spacing plants adequately and pruning to increase ventilation. Remove and dispose of infected plant debris to prevent fungal spores from spreading. Apply fungicides labeled for powdery mildew control preventively or at the first sign of infection. Follow manufacturer instructions carefully for optimal results.</p>
              <h2>Prevention</h2>
              <p>Choose resistant plant varieties when available. Avoid overhead watering, as wet foliage encourages fungal growth.Monitor plants regularly for early signs of infection and take prompt action.Maintain overall plant vigor through proper nutrition and care practices. </p>
              """,
              // Optional: Use a custom style for the HTML elements
              style: {
                "h1": Style(
                  textAlign: TextAlign.center,
                  fontWeight: FontWeight.bold,
                ),
                "p": Style(fontSize: FontSize(16)),
                "h2": Style(fontWeight: FontWeight.bold),
              },
            ),
          ),
        ),
      ),
    );
  }
}
