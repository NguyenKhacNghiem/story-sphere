import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storysphere_mobileapp/constants/string.dart';
import 'package:storysphere_mobileapp/constants/utils/color_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/icon_svg.dart';
import 'package:storysphere_mobileapp/models/user.dart';
import 'package:storysphere_mobileapp/routing/router.gr.dart';

class UserCoverSectionWidget extends StatelessWidget {
  final User user;
  const UserCoverSectionWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return SizedBox(
      height: 445.sp,
      width: screenWidth,
      child: Stack(
        children: [
          // Background image
          Container(
            height: 350.sp,
            width: screenWidth,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(user.bgImg ?? 'https://i.pinimg.com/564x/c4/81/40/c48140f48c3a348b18f6972574d84542.jpg'),
                  fit: BoxFit.fitWidth,
                ),
              ),
          ),

          // Darker effect
          Container(
            height: 445.sp,
            decoration: BoxDecoration(
              color: ColorConstants.black.withOpacity(0.7), 
            ),
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child:
          Container(
          width: screenWidth,
          height: 300.sp,
          decoration: const BoxDecoration(
            gradient:  LinearGradient(
              colors: [ColorConstants.transparent, ColorConstants.transparent, ColorConstants.darkGreenBackground],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          )),
          
          //Avatar
         Align(
            alignment: Alignment.topCenter,
            child: Container(
            margin: EdgeInsets.only(top: 75.sp),
            width: 90.sp,
            height: 90.sp,
            decoration: BoxDecoration(
              border: Border.all(
                  color: ColorConstants.tagYellow,
                  width: 2.sp),
               borderRadius: BorderRadius.circular(45.sp)
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(45.sp),
              child: Image.network(user.avatar ?? 'https://i.pinimg.com/564x/36/20/80/362080abb3296390a93111db932322fb.jpg', fit: BoxFit.cover,))),
          ),

           Align(
            alignment: Alignment.topCenter,
            child: Container(
            width: MediaQuery.of(context).size.width*0.8,
            margin: EdgeInsets.only(top: 180.sp),
            child: Text(
                user.displayName ?? 'No Name', style: FontConstant.userDisplayName,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
            )
          )),

          //USER SELF INTRODUCTION
          Align(
            alignment: Alignment.topCenter,
            child: Container(
            width: MediaQuery.of(context).size.width*0.8,
            margin: EdgeInsets.only(top: 220.sp),
            child: Text(
                user.selfIntroduction ?? 'No bio yet', style: FontConstant.userIntroduction,
                overflow: TextOverflow.clip,
                textAlign: TextAlign.center,
            )
          )),

          //My WORKS
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: MediaQuery.of(context).size.width*0.8,
              decoration: BoxDecoration(
                   color: ColorConstants.primaryText,
                   borderRadius: BorderRadius.circular(10.sp)
              ),
              margin: EdgeInsets.only(top: 300.sp),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                    backgroundColor: ColorConstants.primaryText,
                    shadowColor: ColorConstants.transparent,
                    padding: EdgeInsets.symmetric(vertical: 15.sp, horizontal: 20.sp), // Remove padding
                    minimumSize: Size.zero,   // Remove minimum size constraints
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,),
                  onPressed: (){
                    Navigator.pop(context);
                    context.pushRoute(LibraryPage(userId: user.userId ?? -1));
                  }, 
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          IconsSVG.saveBlack,
                          10.horizontalSpace,
                          Text(Strings.myLibrary, style: FontConstant.headline3, textAlign: TextAlign.center,)
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
                  onPressed: (){
                    Navigator.pop(context);
                    context.pushRoute(MyWorksPage(userId: user.userId ?? 0));
                  }, 
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          IconsSVG.suitCaseBlack,
                          10.horizontalSpace,
                          Text(Strings.myWorks, style: FontConstant.headline3, textAlign: TextAlign.center,)
                        ],
                      ),
                      IconsSVG.arrowRight,
                    ],)),
              ],),
            
          )),




        ],
      )
    );
  }
  
}
