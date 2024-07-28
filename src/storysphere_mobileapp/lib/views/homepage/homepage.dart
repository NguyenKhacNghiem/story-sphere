import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storysphere_mobileapp/constants/string.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';
import 'package:storysphere_mobileapp/models/user.dart';
import 'package:storysphere_mobileapp/routing/router.gr.dart';
import 'package:storysphere_mobileapp/views/homepage/news_slider.dart';
import 'package:storysphere_mobileapp/views/homepage/stories_flow_display.dart';
import 'package:storysphere_mobileapp/views/homepage/user_widget.dart';
import 'package:storysphere_mobileapp/views/log_in/services/login_service.dart';
import 'package:storysphere_mobileapp/views/main_widgets/bottom_navigator.dart';

@RoutePage()
class HSHomePage extends StatefulWidget {
  const HSHomePage({super.key});

  @override
  State<HSHomePage> createState() => _HSHomePage();
}

class _HSHomePage extends State<HSHomePage> {
  late User? currentUser;
  final LoginService _loginService = LoginService();
  int? userId;
  bool loggedIn = false;

  Future<void> _checkLoginStatus() async {
    bool isLoggedIn = await _loginService.isLoggedIn();
    if (!isLoggedIn) {
      context.pushRoute(LogInPage());
    } else {
      loggedIn = true;
      debugPrint('Logged in! But UserID get error!');
    }
  }

  @override
  void initState() {
    super.initState();
    //_checkLoginStatus();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (userId == null && loggedIn) {
      //_loadUserId();
    }
    // if (userId != null) {
    //   try {
        return Scaffold(
            bottomNavigationBar: const SPBottomNavigationBar(selectedIndex: 0),
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  15.verticalSpace,
                  const UserHomepageWidget(),
                  NewsSliderHomepageWidget(),
                  25.verticalSpace,

                  //user favorite
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.sp),
                    child: Text(Strings.youWouldLike, style: FontConstant.headline2White,),
                  ),
                  5.verticalSpace,
                  DisplayStoriesFlowHomepageWidget(title: Strings.youWouldLike, id: 'YOUWOULDLIKE', userId: 100000,),

                  //most view stories
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.sp),
                    child: Text(Strings.hotStories, style: FontConstant.headline2White,),
                  ),
                  5.verticalSpace,
                  DisplayStoriesFlowHomepageWidget(title: Strings.hotStories, id: 'HOTSTORIES',),

                  //RECENTLY UPDATED
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.sp),
                    child: Text(Strings.updatedRecently, style: FontConstant.headline2White, ),
                  ),
                  5.verticalSpace,
                  DisplayStoriesFlowHomepageWidget(title: Strings.updatedRecently, id: 'UPDATEDRECENTLY'),

                  //HIGHLY RECOMMEND
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.sp),
                    child: Text(Strings.storyRecommended, style: FontConstant.headline2White,),
                  ),
                  5.verticalSpace,
                  DisplayStoriesFlowHomepageWidget(title: Strings.storyRecommended, id: 'STORYRECOMMENDED'),

                  30.verticalSpace,
                ],
              )
            ),
          );
    //   } catch (exception) {
    //     return const Text('Log in Error');
    //   }
    // } else {
    //   _checkLoginStatus();
    //   return const SizedBox();
    // }
   }

  Future<void> _loadUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userId = prefs.getInt('userId');
    });
  }

}
