import 'package:all_hadis/const/color_const.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: const Material(
        color: Colors.black,
        child: SingleChildScrollView(
          child: SizedBox(
            height: 800,
            width: double.infinity,
          ),
        ),
      ),
      bottomSheet: BottomSheet(
        onClosing: () {},
        builder: (BuildContext context) {
          return const Text("data");
        },
      ),
    );
  }
}
