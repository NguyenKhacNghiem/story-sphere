import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:storysphere_mobileapp/constants/string.dart';
import 'package:storysphere_mobileapp/constants/utils/color_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/icon_svg.dart';

@RoutePage()
class AddStoryPage extends StatefulWidget {
  final int userId;
  const AddStoryPage({super.key, required this.userId});

  @override
  State<AddStoryPage> createState() => _AddStoryPage();
}

class _AddStoryPage extends State<AddStoryPage> {
  late int storyId;
  File? _image;
  final TextEditingController coverController = TextEditingController();
  final TextEditingController storyNameController = TextEditingController();
  final TextEditingController storyContentOutlineController = TextEditingController();
  bool isNonFiction = false;
  
  @override
  void dispose() {
    coverController.dispose();
    storyNameController.dispose();
    storyContentOutlineController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
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

            Text(Strings.storyInfor, style: FontConstant.resultTitleDisplay,),
            20.verticalSpace,

            //STORY COVER
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
                      onTap: (){_pickImage(ImageSource.gallery);},
                      child: Container(
                        height: 155.sp,
                        width: 100.sp,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.sp),
                          color: ColorConstants.formStrokeColor,
                        ),
                        child: _image == null 
                          ? const Icon(Icons.add_a_photo_outlined,) 
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(5.sp),
                              child: Image.file(_image!, fit: BoxFit.cover,))),
                    ),
                    
                  ],
                ),
              
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(Strings.coverLinkPath, style: FontConstant.ratingPointDisplay,),
                    10.verticalSpace,
                    Container(
                      width: 220.sp,
                      height: 100.sp,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: ColorConstants.formStrokeColor,
                          width: 1.sp,),
                        borderRadius: BorderRadius.circular(5.sp),
                      ),
                      child:Padding(
                          padding: EdgeInsets.all(5.sp),
                          child: TextField(
                            controller: coverController,
                            style:  FontConstant.buttonTextGrey,
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
          
            //STORY NAME
            20.verticalSpace,
            Text(Strings.storyName, style: FontConstant.ratingPointDisplay,),
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
                      controller: storyNameController,
                      style:  FontConstant.buttonTextGrey,
                      decoration: const InputDecoration(
                        hintText: Strings.storyName,
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
            
            //STORY CONTENT OUTLINE
            20.verticalSpace,
            Text(Strings.storyIntro, style: FontConstant.ratingPointDisplay,),
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
                      controller: storyContentOutlineController,
                      style:  FontConstant.buttonTextGrey,
                      decoration: const InputDecoration(
                        hintText: Strings.storyIntro,
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
            Row(
              children: [
                Checkbox(
                  value: isNonFiction,
                  onChanged: (bool? value) {
                    setState(() {
                      isNonFiction = value ?? false;
                    });
                  },
                ),
                5.horizontalSpace,
                Text(Strings.nonfictionBook, style: FontConstant.categoryDescrip),
                5.horizontalSpace,
                InkWell(
                  child: IconsSVG.information,
                )
              ],
            ),
          
            //CATEGORY SELECTION

            //TAG SELECTION
          ],))
      ),
    );
   }

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }
}
