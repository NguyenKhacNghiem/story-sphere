import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storysphere_mobileapp/constants/string.dart';
import 'package:storysphere_mobileapp/constants/utils/color_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/icon_svg.dart';
import 'package:storysphere_mobileapp/models/user.dart';
import 'package:storysphere_mobileapp/views/account/widgets/user_avatar_section.dart';
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
  User currUser = User(
    userId: 1, userPassword: 'kcaoico02ic', dateOfBirth: DateTime.tryParse('17/07/2005'),
    username: 'nguyenthanhdanh', displayName: 'Nguyễn Thành Danh', selfIntroduction: 'Giới thiệu tác giả không có gì để ghi\nCũng chẳng có gì để xem',
    avatar: 'https://i.pinimg.com/564x/4b/79/a5/4b79a5084ea8aba629b601cc209c11a7.jpg',
    bgImg: 'https://i.pinimg.com/564x/58/6d/4c/586d4c295438d50d25cbd4a287800b02.jpg',
  );

  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
      bottomNavigationBar: const SPBottomNavigationBar(selectedIndex: 4),
      backgroundColor: ColorConstants.darkGreenBackground,
      body: Container(
        color: ColorConstants.darkGreenBackground,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            UserCoverSectionWidget(user: currUser),

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
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    backgroundColor: ColorConstants.primaryText,
                    shadowColor: ColorConstants.transparent,
                    padding: EdgeInsets.symmetric(vertical: 15.sp, horizontal: 20.sp), // Remove padding
                    minimumSize: Size.zero,   // Remove minimum size constraints
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,),
                  onPressed: (){}, 
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

                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    backgroundColor: ColorConstants.primaryText,
                    shadowColor: ColorConstants.transparent,
                    padding: EdgeInsets.symmetric(vertical: 15.sp, horizontal: 20.sp), // Remove padding
                    minimumSize: Size.zero,   // Remove minimum size constraints
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,),
                  onPressed: (){}, 
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

                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    backgroundColor: ColorConstants.primaryText,
                    shadowColor: ColorConstants.transparent,
                    padding: EdgeInsets.symmetric(vertical: 15.sp, horizontal: 20.sp), // Remove padding
                    minimumSize: Size.zero,   // Remove minimum size constraints
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,),
                  onPressed: (){}, 
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          IconsSVG.notiBlack,
                          10.horizontalSpace,
                          Text(Strings.notification, style: FontConstant.headline3, textAlign: TextAlign.center,)
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
}
