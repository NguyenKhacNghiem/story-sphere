import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storysphere_mobileapp/constants/string.dart';
import 'package:storysphere_mobileapp/constants/utils/color_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';
import 'package:storysphere_mobileapp/models/category.dart';
import 'package:storysphere_mobileapp/routing/router.gr.dart';
import 'package:storysphere_mobileapp/services/account_service.dart';
import 'package:storysphere_mobileapp/services/category_service.dart';

@RoutePage()
class AddFavCategory extends StatefulWidget {
  final int userId;
  const AddFavCategory({super.key, required this.userId});

  @override
  State<AddFavCategory> createState() => _AddFavCategory();
}

class _AddFavCategory extends State<AddFavCategory> {
  String favGenre = '';
  List<int> selectedTags = [];
  List<Category> listTag = [];

  @override
  Widget build(BuildContext context) {
    fetchCategories();
    return SafeArea(
      // top: false,
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const NetworkImage(Strings.loginBackgroundImage,),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                ColorConstants.black.withOpacity(0.5),
                BlendMode.darken,
              ), ),
              
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 20.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(Strings.welcome, style: FontConstant.titleBigDisplayWhite,),
                10.verticalSpace,
                Text(Strings.whatYourFavCat, style: FontConstant.subTitleText,),
                70.verticalSpace,

                Text(Strings.myFavCat, style: FontConstant.headline1White,),
                10.verticalSpace,
                Wrap(
                  children: 
                    listTag.map((item) => _buildCustomSelection(item)).toList()),


                
                20.verticalSpace,
                Center(
                  child: ElevatedButton(
                    onPressed: validationAndSubmit,
                    child:Padding(padding: EdgeInsets.symmetric(horizontal: 60.sp, vertical: 15.sp),
                        child: Text(Strings.next, style: FontConstant.headline3White, textAlign: TextAlign.center,),),
                    
                  ),
                ),
                
                
              ],
            ),
        ),
      )
      ),
    );
  }

  Widget _buildCustomSelection(Category item) {
    bool isSelected = selectedTags.contains(item.categoryId ?? '');
    return InkWell(
      onTap: () => _toggleSelection(item.categoryId ?? -1),
      borderRadius: BorderRadius.circular(25),
      child: Container(
        height: 40.sp,
        margin: EdgeInsets.symmetric(vertical: 5.sp, horizontal: 10.sp),
        padding: EdgeInsets.symmetric(vertical:  10.sp, horizontal: 15.sp),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.sp),
          color: isSelected ? ColorConstants.buttonLightGreen: ColorConstants.buttonPastelGreen,
        ),
        child: Wrap(
          direction: Axis.horizontal,
          children: [
              Icon(
              isSelected ? Icons.check : Icons.add,
              color: ColorConstants.bgWhite,
            ),
            5.horizontalSpace,
            Text(item.categoryName ?? '', style: FontConstant.chapterDisplay,),
            3.horizontalSpace,
        
        ],)
      ),
    );
  }

   void _toggleSelection(int item) {
    setState(() {
      if (selectedTags.contains(item)) {
        selectedTags.remove(item);
      } else {
        selectedTags.add(item);
      }
    });
  }


Future<void> fetchCategories() async {
   if (listTag.isEmpty) {
      final result =  CategoryService().getAllCategory();
      result.whenComplete(() {
        result.then((value) {
          if (value != null) {
            debugPrint( 'Value: ' + value.length.toString());
            setState(() {
              listTag = value;
            });
            return value;
          } else {
            return null;
          }
        });
      });
    }
    
}


  Future<void> validationAndSubmit() async {
    String favGenreKeywords = '';
    for (int tag in selectedTags) {
      favGenreKeywords+= ',$tag';
    }

    try {
      final response = await AccountService().updateFavGenreKeywords(widget.userId, favGenreKeywords);
      if (response.statusCode == 200) {
        debugPrint('Story create successfully: ${response.body}');
         final responseData = json.decode(response.body);
        if (responseData['code'] == 0 || responseData['code'] == 100) {
          context.pushRoute(const HSHomePage());
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text(Strings.error),
                content: Text(responseData['message']),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      setState(() {});
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
        }
      }
    } catch (e) {
      debugPrint('Error sending review: $e');
    }
    
  }

}
