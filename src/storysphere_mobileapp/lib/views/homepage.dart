// ignore_for_file: must_be_immutable, avoid_init_to_null
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:storysphere_mobileapp/constants/utils/color_constant.dart';

@RoutePage()
class HSHomePage extends StatefulWidget {
  const HSHomePage({super.key});

  @override
  State<HSHomePage> createState() => _HSHomePage();
}

class _HSHomePage extends State<HSHomePage> {
  // late User? currentUser = null;

  // Future<void> getCurrentUser() async {
  //   var currUser = FirebaseAuth.instance.currentUser;
  //   if (currUser != null) {
  //     currentUser = currUser;
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    // if (FirebaseAuth.instance.currentUser != null) {
    //   try {
        return const SafeArea(
          child: Scaffold(
            // appBar: const HiveCustomAppBar(),
            // drawer: const WriterDrawer(),
            body: SizedBox.expand(
              child: Text('Hello', style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),),
            ),
          ),
        );
  //     } catch (exception) {
  //       return const Text('error');
  //     }
  //   } else {
  //     context.navigateNamedTo("/login");
  //     return const SizedBox();
  //   }
   }
}
