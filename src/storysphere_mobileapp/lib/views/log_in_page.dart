// ignore_for_file: must_be_immutable, avoid_init_to_null

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:storysphere_mobileapp/constants/string.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';

@RoutePage()
class LogInPage extends StatelessWidget {
  const LogInPage({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      // top: false,
      child: Scaffold(
        body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(Strings.login, style: FontConstant.titleBigDisplayWhite,),
                

              ],
            ),
        ),
      ),
    );
  }
}
