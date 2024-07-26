import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:storysphere_mobileapp/constants/string.dart';
import 'package:storysphere_mobileapp/constants/utils/color_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';
import 'package:storysphere_mobileapp/models/user.dart';
import 'package:storysphere_mobileapp/views/main_widgets/bottom_navigator.dart';

@RoutePage()
class EditAccountPage extends StatefulWidget {
  final User user;
  const EditAccountPage({super.key, required this.user});

  @override
  State<EditAccountPage> createState() => _EditAccountPage();
}

class _EditAccountPage extends State<EditAccountPage> {
  late User user;
  File? _image;
  File? _coverImgae;
  final TextEditingController avatarController = TextEditingController();
  final TextEditingController coverController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController userIntroductionController = TextEditingController();
 
  
  @override
  void dispose() {
    avatarController.dispose();
    coverController.dispose();
    userNameController.dispose();
    userIntroductionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    user = widget.user;
   
    return Scaffold(
      bottomNavigationBar: const SPBottomNavigationBar(selectedIndex: 2),
      body: SingleChildScrollView(
        child: 
        Padding( padding: EdgeInsets.symmetric(horizontal: 20.sp),
        child: 
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            50.verticalSpace,

            Text(Strings.editProfile, style: FontConstant.resultTitleDisplay,),
            20.verticalSpace,

            //USER AVATAR
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(Strings.previewAvatar, style: FontConstant.ratingPointDisplay,),
                    10.verticalSpace,
                    InkWell(
                      onTap: (){_pickImage(ImageSource.gallery, true);},
                      child: Container(
                        height: 83.sp,
                        width: 83.sp,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(42.sp),
                          color: ColorConstants.formStrokeColor,
                        ),
                        child: _image == null 
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(42.sp),
                              child: Image.network(user.avatar ?? '', fit: BoxFit.cover,))
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(42.sp),
                              child: Image.file(_image!, fit: BoxFit.cover,))),
                    ),
                    
                  ],
                ),
                20.horizontalSpace,
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(Strings.avatarUrl, style: FontConstant.linkDisplay,),
                    10.verticalSpace,
                    Container(
                      width: 240.sp,
                      height: 50.sp,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: ColorConstants.formStrokeColor,
                          width: 1.sp,),
                        borderRadius: BorderRadius.circular(5.sp),
                      ),
                      child:Padding(
                          padding: EdgeInsets.all(5.sp),
                          child: TextField(
                            controller: avatarController,
                            style:  FontConstant.rateContentDisplay,
                            maxLines: 1,
                            decoration: const InputDecoration(
                              hintText: Strings.avatarUrl,
                              fillColor: ColorConstants.transparent,
                              border: InputBorder.none,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              errorBorder: InputBorder.none,
                              disabledBorder: InputBorder.none,
                              hintStyle: TextStyle(color: ColorConstants.secondaryText),
                            ),
                          
                        ),
                    ),),
                  ],
                )
                ],
              ),
            20.verticalSpace,
            //USER BACKGROUND IMAGE
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(Strings.previewCover, style: FontConstant.ratingPointDisplay,),
                      10.verticalSpace,
                      InkWell(
                        onTap: (){_pickImage(ImageSource.gallery, false);},
                        child: Container(
                          height: 82.sp,
                          width: 120.sp,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(42.sp),
                            color: ColorConstants.formStrokeColor,
                          ),
                          child: _coverImgae == null 
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(5.sp),
                                child: Image.network(user.bgImg ?? '', fit: BoxFit.cover,))
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(5.sp),
                                child: Image.file(_coverImgae!, fit: BoxFit.cover,))),
                      ),
                      
                    ],
                  ),
                  10.horizontalSpace,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(Strings.avatarUrl, style: FontConstant.linkDisplay,),
                      10.verticalSpace,
                      Container(
                        width: 210.sp,
                        height: 50.sp,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: ColorConstants.formStrokeColor,
                            width: 1.sp,),
                          borderRadius: BorderRadius.circular(5.sp),
                        ),
                        child:Padding(
                            padding: EdgeInsets.all(5.sp),
                            child: TextField(
                              controller: avatarController,
                              style:  FontConstant.rateContentDisplay,
                              maxLines: 3,
                              decoration: const InputDecoration(
                                hintText: Strings.coverLinkPath,
                                fillColor: ColorConstants.transparent,
                                border: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                hintStyle: TextStyle(color: ColorConstants.secondaryText),
                              ),
                            
                          ),
                      ),),
                    ],
                  )
                  ],
                ),
          
            //USER NAME
            20.verticalSpace,
            Text(Strings.userName, style: FontConstant.ratingPointDisplay,),
            5.verticalSpace,
            Container(
                width: 370.sp,
                height: 50.sp,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorConstants.formStrokeColor,
                    width: 1.sp,),
                  borderRadius: BorderRadius.circular(5.sp),
                ),
                child:Padding(
                    padding: EdgeInsets.all(5.sp),
                    child: TextField(
                      controller: userNameController,
                      style:  FontConstant.dropdownText,
                      decoration: const InputDecoration(
                        hintText: Strings.userName,
                        fillColor: ColorConstants.transparent,
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintStyle: TextStyle(color: ColorConstants.secondaryText),
                      ),
                    
                  ),
              ),
            ),
            
            //USER INTRODUCTION
            20.verticalSpace,
            Text(Strings.userIntroduction, style: FontConstant.ratingPointDisplay,),
            5.verticalSpace,
            Container(
                width: 370.sp,
                height: 150.sp,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorConstants.formStrokeColor,
                    width: 1.sp,),
                  borderRadius: BorderRadius.circular(5.sp),
                ),
                child:Padding(
                    padding: EdgeInsets.all(5.sp),
                    child: TextField(
                      maxLines: 6,
                      textAlign: TextAlign.justify,
                      controller: userIntroductionController,
                      style:  FontConstant.rateContentDisplay,
                      decoration: const InputDecoration(
                        hintText: Strings.userIntroduction,
                        fillColor: ColorConstants.transparent,
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                        errorBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        hintStyle: TextStyle(color: ColorConstants.secondaryText),
                      ),
                    
                  ),
              ),
            ),
            5.verticalSpace,
           
            30.verticalSpace,
            Center(
              child: 
            ElevatedButton(
              onPressed: (){
                //create story and get storyID
                
              },
              child:Padding(padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
                  child: Text(Strings.saveChange, style: FontConstant.headline3White, textAlign: TextAlign.center,),), 
            )),
            40.verticalSpace

          ],))
      ),
    );
  }


  Future<void> _pickImage(ImageSource source, bool avt) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      if (avt) {
        setState(() {
          _image = File(pickedFile.path);
        });
      } else {
         setState(() {
          _coverImgae = File(pickedFile.path);
        });
      }
      
    }
  }
}
