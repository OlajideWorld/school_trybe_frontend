// ignore_for_file: file_names

import 'package:flutter/material.dart';

import '../../../../common/custombottombar.dart';
import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const CustomBottomBar(),
      backgroundColor: whitecolor,
      body: Center(
          child: Text(
        "Welcome to Chat Page",
        style: TextStyle(
            fontSize: fontSize(20),
            fontWeight: FontWeight.w600,
            color: maincolor),
      )),
    );
  }
}
