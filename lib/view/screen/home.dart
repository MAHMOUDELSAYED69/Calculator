import 'package:flutter/material.dart';

import '../widget/custom_text_field.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.grey,
          shape: const RoundedRectangleBorder(
              side: BorderSide(color: Colors.black, width: 2),
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30))),
          centerTitle: true,
          title: const Text(
            "Calculate",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          )),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                SizedBox(width: 10),
                Expanded(child: CustomTextFormField(
                  title: "Figma screen size*",
                )),
                SizedBox(width: 10),
                Expanded(child: CustomTextFormField(
                  title:"item size*",
                )),
                SizedBox(width: 10),
              ],
            ),
            Row(
              children: [
                SizedBox(width: 10),
                Expanded(child: CustomTextFormField(
                  title: "mobile screen size*",
                )),
                SizedBox(width: 10),
                Expanded(child: CustomTextFormField(
                  title:"item size*",
                )),
                SizedBox(width: 10),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
