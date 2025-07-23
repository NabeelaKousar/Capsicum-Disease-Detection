import 'package:disease_detection_capisicum/utils/style/app_color.dart';
import 'package:disease_detection_capisicum/utils/style/app_style.dart';
import 'package:disease_detection_capisicum/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class BacterialBlightScreen extends StatelessWidget {
  const BacterialBlightScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.kPrimaryColor,
          title: const CustomText(
            text: 'Bacterial Blight',
            style: AppStyle.montserratBoldWhite14,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Html(
              data: """
              <h1>Bacterial Blight</h1>
              <p><strong>Bacterial blight</strong> is a collective term for diseases caused by bacteria such as Xanthomonas spp. and Pseudomonas spp., affecting a wide range of crops including rice, beans, tomatoes, and cotton. These pathogens typically enter plants through natural openings or wounds, spreading rapidly under conducive environmental conditions.</p>
              <h2>Symptoms</h2>
              <p>Water-soaked lesions that turn brown and necrotic, often with angular edges, are a common early sign. These lesions can coalesce, causing extensive damage and leaf drop.In advanced stages, bacterial blight can affect stems and even fruits, leading to lesions and rot that compromise plant vigor and productivity.Severe infections can result in reduced photosynthesis, poor fruit set, and overall yield loss, impacting both commercial crops and subsistence farming.</p>
              <h2>Management</h2>
              <p>Implementing crop rotation, using disease-free seeds, and maintaining field hygiene by removing crop residues can help minimize bacterial populations.Copper-based bactericides are commonly used to manage bacterial blight. These treatments are applied preventively or at the first signs of infection, although their efficacy can be influenced by environmental factors.Biological agents such as beneficial bacteria and fungi that antagonize pathogenic bacteria are being explored as sustainable alternatives to chemical treatments.</p>
              <h2>Prevention</h2>
              <p>Ensuring that seeds and planting material are free from bacterial pathogens before introduction into new areas or regions.Regular field monitoring and prompt diagnosis of symptoms can facilitate timely intervention and prevent the spread of the disease.Educating farmers about the importance of sanitation, proper irrigation practices, and integrated pest management strategies can empower them to effectively manage bacterial blight.</p>
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
