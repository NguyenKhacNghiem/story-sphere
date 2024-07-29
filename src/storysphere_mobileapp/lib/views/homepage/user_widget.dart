import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storysphere_mobileapp/constants/string.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/icon_svg.dart';
import 'package:storysphere_mobileapp/models/user.dart';
import 'package:storysphere_mobileapp/services/account_service.dart';

class UserHomepageWidget extends StatefulWidget {
  const UserHomepageWidget({super.key});
  @override
  State<UserHomepageWidget> createState() => _UserHomepageWidget();
}

class _UserHomepageWidget extends State<UserHomepageWidget> {
  late int userId;
  User? user;

  @override
  void initState() {
    _loadUserId();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (user == null) {
      initData();
    }
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 35.sp),
      child: 
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text(Strings.hello, style: FontConstant.subTitleText,),
              10.verticalSpace,
              user == null
              ? const CircularProgressIndicator()
              : Wrap(
                children: [
                  IconsSVG.user,
                  15.horizontalSpace,
                  Text(user!.displayName ?? '', style: FontConstant.userNameText,),
                ],
              ),
          ],),
    );
  }

  Future<void> _loadUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userId = prefs.getInt('userId') ?? 100004;
    });
  }

  
  void initData(){
      final result =  AccountService().getUserById(userId);
      result.whenComplete(() {
        result.then((value) {
          if (value != null) {
            setState(() {
              user = value;
            });
          }
        });
      });
  }
  
}
