import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mynotes/view/user_list_screen.dart';

late Size size;

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    splashNavigator(context);

    return Scaffold(
      body: Center(
        child: Container(
          height: size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('asset/splash.jpeg'),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> splashNavigator(BuildContext context) async {
    await Future.delayed(
      const Duration(seconds: 1),
    );
    Get.offAll(
      const ScreenUserList(),
    );
  }
}
