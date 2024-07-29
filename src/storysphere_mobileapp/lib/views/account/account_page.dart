import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storysphere_mobileapp/constants/string.dart';
import 'package:storysphere_mobileapp/constants/utils/color_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/icon_svg.dart';
import 'package:storysphere_mobileapp/models/user.dart';
import 'package:storysphere_mobileapp/routing/router.gr.dart';
import 'package:storysphere_mobileapp/services/account_service.dart';
import 'package:storysphere_mobileapp/views/account/widgets/user_avatar_section.dart';
import 'package:storysphere_mobileapp/views/log_in/services/login_service.dart';
import 'package:storysphere_mobileapp/views/main_widgets/bottom_navigator.dart';

@RoutePage()
class UserAccountPage extends StatefulWidget {
  final int userId;
  const UserAccountPage({super.key, required this.userId});

  @override
  State<UserAccountPage> createState() => _UserAccountPage();
}

class _UserAccountPage extends State<UserAccountPage> {
  late int userId;
  User? currUser;

  @override
  Widget build(BuildContext context) {
    userId = widget.userId;
    if (currUser == null) {
      initData();
    }
    return Scaffold(
      bottomNavigationBar: const SPBottomNavigationBar(selectedIndex: 4),
      backgroundColor: ColorConstants.darkGreenBackground,
      body: Container(
        color: ColorConstants.darkGreenBackground,
        child: 
        currUser == null 
        ? const Center(child:  CircularProgressIndicator())
        : Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            UserCoverSectionWidget(user: currUser!),

            Container(
              width: MediaQuery.of(context).size.width*0.8,
              decoration: BoxDecoration(
                   color: ColorConstants.primaryText,
                   borderRadius: BorderRadius.circular(10.sp)
              ),
            child:
            Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                //EDIT ACCOUNT
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    backgroundColor: ColorConstants.primaryText,
                    shadowColor: ColorConstants.transparent,
                    padding: EdgeInsets.symmetric(vertical: 15.sp, horizontal: 20.sp), // Remove padding
                    minimumSize: Size.zero,   // Remove minimum size constraints
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,),
                  onPressed: (){
                    context.pushRoute(EditAccountPage(user: currUser!));
                  }, 
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          IconsSVG.settingBlack,
                          10.horizontalSpace,
                          Text(Strings.editProfile, style: FontConstant.headline3, textAlign: TextAlign.center,)
                        ],
                      ),
                      IconsSVG.arrowRight,
                    ],)),
                Container(
                  width: MediaQuery.of(context).size.width*0.8,
                  height: 1,
                  color: ColorConstants.formStrokeColor,
                ),

                //READING HISTORY
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    backgroundColor: ColorConstants.primaryText,
                    shadowColor: ColorConstants.transparent,
                    padding: EdgeInsets.symmetric(vertical: 15.sp, horizontal: 20.sp), // Remove padding
                    minimumSize: Size.zero,   // Remove minimum size constraints
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,),
                  onPressed: (){
                    context.pushRoute(ReadingHistoryPage(userId: userId));
                  }, 
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          IconsSVG.noteBlack,
                          10.horizontalSpace,
                          Text(Strings.readHistory, style: FontConstant.headline3, textAlign: TextAlign.center,)
                        ],
                      ),
                      IconsSVG.arrowRight,
                    ],)),

                Container(
                    width: MediaQuery.of(context).size.width*0.8,
                    height: 1,
                    color: ColorConstants.formStrokeColor,
                  ),

                //log out
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    backgroundColor: ColorConstants.primaryText,
                    shadowColor: ColorConstants.transparent,
                    padding: EdgeInsets.symmetric(vertical: 15.sp, horizontal: 20.sp), // Remove padding
                    minimumSize: Size.zero,   // Remove minimum size constraints
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,),
                  onPressed: (){
                     logOut();
                     context.pushRoute(LogInPage());
                  }, 
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          IconsSVG.logout,
                          10.horizontalSpace,
                          Text(Strings.logOut, style: FontConstant.headline3, textAlign: TextAlign.center,)
                        ],
                      ),
                      IconsSVG.arrowRight,
                    ],)),
              ],)),
          ],
        )
      ),
    );
    
   }
  Future<void> logOut() async {
     await LoginService().logout();
  }

  void initData(){
      final result =  AccountService().getUserById(userId);
      result.whenComplete(() {
        result.then((value) {
          if (value != null) {
            setState(() {
              currUser = value;
            });
          }
        });
      });
  }
}
