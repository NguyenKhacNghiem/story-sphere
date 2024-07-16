// ignore_for_file: must_be_immutable, avoid_init_to_null
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storysphere_mobileapp/constants/string.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';
import 'package:storysphere_mobileapp/views/homepage/news_slider.dart';
import 'package:storysphere_mobileapp/views/homepage/stories_flow_display.dart';
import 'package:storysphere_mobileapp/views/homepage/user_widget.dart';
import 'package:storysphere_mobileapp/views/main_widgets/bottom_navigator.dart';

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
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // if (FirebaseAuth.instance.currentUser != null) {
    //   try {
        return Scaffold(
            // appBar: const HiveCustomAppBar(),
            // drawer: const WriterDrawer(),
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
                  const DisplayStoriesFlowHomepageWidget(title: Strings.youWouldLike, id: 'YOUWOULDLIKE'),

                  //most view stories
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.sp),
                    child: Text(Strings.hotStories, style: FontConstant.headline2White,),
                  ),
                  5.verticalSpace,
                  const DisplayStoriesFlowHomepageWidget(title: Strings.hotStories, id: 'HOTSTORIES'),

                  //RECENTLY UPDATED
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.sp),
                    child: Text(Strings.updatedRecently, style: FontConstant.headline2White,),
                  ),
                  5.verticalSpace,
                  const DisplayStoriesFlowHomepageWidget(title: Strings.updatedRecently, id: 'UPDATEDRECENTLY'),

                  //HIGHLY RECOMMEND
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.sp),
                    child: Text(Strings.storyRecommended, style: FontConstant.headline2White,),
                  ),
                  5.verticalSpace,
                  const DisplayStoriesFlowHomepageWidget(title: Strings.storyRecommended, id: 'STORYRECOMMENDED'),

                  30.verticalSpace,
                ],
              )
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
