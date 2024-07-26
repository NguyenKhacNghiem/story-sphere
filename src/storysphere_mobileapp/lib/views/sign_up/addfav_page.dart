import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storysphere_mobileapp/constants/string.dart';
import 'package:storysphere_mobileapp/constants/utils/color_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';
import 'package:storysphere_mobileapp/models/category.dart';
import 'package:storysphere_mobileapp/routing/router.gr.dart';

@RoutePage()
class AddFavCategory extends StatefulWidget {
  const AddFavCategory({super.key});

  @override
  State<AddFavCategory> createState() => _AddFavCategory();
}

class _AddFavCategory extends State<AddFavCategory> {
  String favGenre = '';
  List<int> selectedTags = [];
  List<Category> listTag = [
    Category(categoryId: 1, categoryName: 'Kinh dị', isCategory: true),
    Category(categoryId: 2, categoryName: 'Trinh thám', isCategory: true),
    Category(categoryId: 3, categoryName: 'Cơ khí'),
    Category(categoryId: 4, categoryName: 'Lãng mạn'),
  ];

  @override
  Widget build(BuildContext context) {
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
                    onPressed: addFavCat,
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
    bool isSelected = selectedTags.contains(item.categoryId!);
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

  void addFavCat(){
    context.pushRoute(const HSHomePage());
  }

}
