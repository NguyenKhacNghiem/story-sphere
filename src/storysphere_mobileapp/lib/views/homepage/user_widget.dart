import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storysphere_mobileapp/constants/string.dart';
import 'package:storysphere_mobileapp/constants/utils/color_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/icon_svg.dart';

class UserHomepageWidget extends StatelessWidget {
  const UserHomepageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 35.sp),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(Strings.hello, style: FontConstant.subTitleText,),
              5.verticalSpace,
              Wrap(
                children: [
                  IconsSVG.user,
                  Padding(padding: EdgeInsets.all(3.sp),),
                  Text('Mỹ Diệu', style: FontConstant.userNameText,),
                ],
              ),
          ],),
          
          Padding(
            padding: EdgeInsets.all(5.sp),
            child:
          Container(
            decoration:
              BoxDecoration(
                      color: ColorConstants.buttonDarkGreen,
                      borderRadius: BorderRadius.circular(5.sp),
                    ),
            child:
              ElevatedButton(
                onPressed: (){
                  showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Alert'),
                      content: Text('Button Pressed!'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text('OK'),
                        ),
                      ],
                    );
                  },
                );
                },
                child: IconsSVG.notificatioBing,
                
              
          ),),
        ),
          
          
        ],),
    );
  }
  
}
