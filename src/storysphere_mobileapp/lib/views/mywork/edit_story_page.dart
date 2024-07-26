import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:storysphere_mobileapp/constants/string.dart';
import 'package:storysphere_mobileapp/constants/utils/color_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/icon_svg.dart';
import 'package:storysphere_mobileapp/models/category.dart';
import 'package:storysphere_mobileapp/models/story.dart';
import 'package:storysphere_mobileapp/views/main_widgets/bottom_navigator.dart';
import 'package:storysphere_mobileapp/views/mywork/widgets/chapterlist_section.dart';

@RoutePage()
class EditStoryPage extends StatefulWidget {
  final Story story;
  const EditStoryPage({super.key, required this.story});

  @override
  State<EditStoryPage> createState() => _EditStoryPage();
}

class _EditStoryPage extends State<EditStoryPage> {
  late int storyId;
  File? _image;
  final TextEditingController coverController = TextEditingController();
  final TextEditingController storyNameController = TextEditingController();
  final TextEditingController storyContentOutlineController = TextEditingController();
  bool isNonFiction = false;
  bool isCategorySelectExpand = false;
  late Widget categorySelect;
  late Widget tagsSelect;
  String? selectedItem;
  List<int> selectedTags = [];
  List<Category> listTag = [
    Category(categoryId: 1, categoryName: 'Kinh dị'),
    Category(categoryId: 2, categoryName: 'Trinh thám'),
    Category(categoryId: 3, categoryName: 'Cơ khí'),
    Category(categoryId: 4, categoryName: 'Lãng mạn'),
  ];

  final List<String> dropdownBookCategories = [
    'Sách tâm lý', 'Sách kỹ năng', 'Sách y học', 'Sách lịch sử', 'Sách tài chính', 'Sách khoa học công nghệ', 'Sách tôn giáo - tâm linh'
  ];
  final List<String> dropdownNovelCategories = [
    'Bí ẩn','Kinh dị', 'Khoan học viễn tưởng', 'Lãng mạn', 'Cổ tích', 'Truyện thiếu nhi','Viễn tưởng'
  ];
  
  @override
  void dispose() {
    coverController.dispose();
    storyNameController.dispose();
    storyContentOutlineController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    coverController.text = widget.story.storyCover ?? '';
    storyNameController.text = widget.story.storyName ?? '';
    storyContentOutlineController.text = widget.story.storyContentOutline ?? '';
    storyId = widget.story.storyId ?? -1;
  
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
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(5.sp),
                              child: Image.network(widget.story.storyCover ?? '', fit: BoxFit.cover,))
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
                    Text(Strings.coverLinkPath, style: FontConstant.linkDisplay,),
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
                      style:  FontConstant.dropdownText,
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
                      maxLines: 6,
                      textAlign: TextAlign.justify,
                      controller: storyContentOutlineController,
                      style:  FontConstant.rateContentDisplay,
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
            20.verticalSpace,
            buildCategorySelection(),

            //TAG SELECTION
            20.verticalSpace,
            Text(Strings.tag, style: FontConstant.ratingPointDisplay,),
            5.verticalSpace,
            Wrap(
              children: 
                listTag.map((item) => _buildCustomSelection(item)).toList()),

            40.verticalSpace,
            ChapterListWriteSection(storyId: storyId),
            40.verticalSpace
          ],))
      ),
    );
  }

  Widget buildCategorySelection(){
    if (isNonFiction) {
      //get category
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(Strings.categories, style: FontConstant.ratingPointDisplay,),
      5.verticalSpace,
            GestureDetector(
            onTap: () {
              setState(() {
                isCategorySelectExpand = ! isCategorySelectExpand;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 5.sp),
              decoration: const BoxDecoration(
                border: Border(bottom: BorderSide(color: ColorConstants.lightText)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    selectedItem ?? Strings.novelCategories,
                    style: FontConstant.dropdownText.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    isCategorySelectExpand ? Icons.arrow_drop_up : Icons.arrow_drop_down,
                    color: ColorConstants.buttonPastelGreen,
                  ),
                ],
              ),
            ),
          ),
           AnimatedSize(
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
            child: isCategorySelectExpand
                ? Container(
                    margin: EdgeInsets.symmetric(horizontal: 16.sp),
                    padding: EdgeInsets.only(top: 8.sp),
                    decoration: BoxDecoration(
                      border: Border.all(color: ColorConstants.transparent),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: dropdownNovelCategories.map((String item) {
                        return InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.sp, horizontal: 16.sp),
                            child: Text(item),
                          ),
                        );
                      }).toList(),
                    ),
                  )
                : 0.verticalSpace,
          ),]);
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

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }
}
