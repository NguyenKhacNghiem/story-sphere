import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:storysphere_mobileapp/constants/utils/color_constant.dart';
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
    bgImg: 'https://i.pinimg.com/736x/dc/35/98/dc35987fde235cc7351ed9960ae889bd.jpg',
  );

  @override
  Widget build(BuildContext context) {
   

    return Scaffold(
      bottomNavigationBar: const SPBottomNavigationBar(selectedIndex: 4),
      body: Container(
        color: ColorConstants.darkGreenBackground,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            UserCoverSectionWidget(user: currUser),
          ],
        )
      ),
    );
   }
}
