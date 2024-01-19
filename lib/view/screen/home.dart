import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.grey,
          shape: const RoundedRectangleBorder(
            side: BorderSide(color: Colors.black,width: 2),
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30),
                  bottomLeft: Radius.circular(30))),
          centerTitle: true,
          title: const Text("Calculate",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),)),
      body: const Column(
        children: [],
      ),
    );
  }
}
