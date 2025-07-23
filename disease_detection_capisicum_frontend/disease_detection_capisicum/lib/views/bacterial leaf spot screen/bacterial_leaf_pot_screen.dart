import 'package:disease_detection_capisicum/utils/style/app_color.dart';
import 'package:disease_detection_capisicum/utils/style/app_style.dart';
import 'package:disease_detection_capisicum/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class BacterialLeafSpotScreen extends StatelessWidget {
  const BacterialLeafSpotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.kPrimaryColor,
          title: const CustomText(
            text: 'Bacterial Leaf Spot',
            style: AppStyle.montserratBoldWhite14,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Html(
              data: """
              <h1>Bacterial Leaf Spot</h1>
              <p><strong>Bacterial leaf spot</strong> is a widespread plant disease caused by various bacteria, primarily from the genera Xanthomonas and Pseudomonas. It affects a wide range of plants, including vegetables, ornamentals, and fruit trees, posing a significant challenge to gardeners, farmers, and horticulturists alike.</p>
              <h2>Symptoms</h2>
              <p>Identifying bacterial leaf spot involves recognizing distinct symptoms that vary depending on the plant species and bacterial strain. Common signs include small, water-soaked lesions on leaves that eventually turn dark brown or black. These spots may have a yellow halo around them, giving them a distinctive appearance. In severe cases, leaves can become distorted or drop prematurely, affecting plant vigor and reducing yields or ornamental value.</p>
              <h2>Management</h2>
              <p>Start with cultural practices that promote plant health and reduce the risk of infection. This includes proper spacing to ensure good airflow, avoiding overhead irrigation to minimize leaf wetness, and removing and disposing of infected plant debris promptly.Practice good garden hygiene by cleaning tools and equipment to prevent the spread of bacteria between plants. Avoid working in wet conditions, which can facilitate bacterial spread.</p>
              <h2>Prevention</h2>
              <p>Whenever possible, choose plant varieties known for resistance to bacterial leaf spot.Regularly inspect plants for symptoms and take immediate action at the first sign of infection to prevent its spread.Rotate susceptible crops with less susceptible ones to disrupt disease cycles and reduce bacterial populations in the soil.</p>
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
