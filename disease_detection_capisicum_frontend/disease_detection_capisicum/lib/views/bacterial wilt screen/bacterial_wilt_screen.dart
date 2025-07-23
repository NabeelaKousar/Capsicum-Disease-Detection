import 'package:disease_detection_capisicum/utils/style/app_color.dart';
import 'package:disease_detection_capisicum/utils/style/app_style.dart';
import 'package:disease_detection_capisicum/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class BacterialWiltScreen extends StatelessWidget {
  const BacterialWiltScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.kPrimaryColor,
          title: const CustomText(
            text: 'Bacterial Wilt',
            style: AppStyle.montserratBoldWhite14,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Html(
              data: """
              <h1>Bacterial Wilt</h1>
              <p><strong>Bacterial wilt</strong> is a disease that affects a wide range of plant species, including tomatoes, potatoes, eggplants, and peppers. Caused by the bacterium <em>Ralstonia solanacearum</em>, it leads to the wilting and eventual death of the plant.</p>
              <h2>Symptoms</h2>
              <p>The first signs of bacterial wilt are a slight wilting and browning of the lower leaves. As the disease progresses, the wilting becomes more severe, eventually leading to the death of the plant. The disease spreads quickly, especially in warm, moist conditions.</p>
              <h2>Management</h2>
              <p>Managing bacterial wilt involves a combination of strategies, including crop rotation, using resistant varieties, and proper sanitation of gardening tools and equipment. Infected plants should be removed and destroyed to prevent the spread of the disease.</p>
              <h2>Prevention</h2>
              <p>Preventive measures include selecting disease-resistant plant varieties, ensuring proper drainage of the soil, and avoiding the planting of susceptible crops in areas previously infected with <em>Ralstonia solanacearum</em>.</p>
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
