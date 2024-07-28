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
import 'package:storysphere_mobileapp/models/user.dart';
import 'package:storysphere_mobileapp/services/account_service.dart';
import 'package:storysphere_mobileapp/services/category_service.dart';
import 'package:storysphere_mobileapp/services/story_service.dart';
import 'package:storysphere_mobileapp/views/main_widgets/bottom_navigator.dart';

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
  bool isCategorySelectExpand = false;
  late Widget categorySelect;
  late Widget tagsSelect;
  User? currentUser;
  Category? selectedCategory;
  List<int> selectedTags = [];
  List<Category> listTag = [];
  List<Category> dropdownBookCategories = [];
  List<Category> dropdownNovelCategories = [];
  
  @override
  void dispose() {
    coverController.dispose();
    storyNameController.dispose();
    storyContentOutlineController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    fetchCategories();
    fetchUser();
  
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
                            maxLines: 3,
                            style:  FontConstant.rateContentDisplay,
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
                      controller: storyContentOutlineController,
                      style:  FontConstant.rateContentDisplay,
                      maxLines: 6,
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
            listTag.isEmpty
            ? const CircularProgressIndicator()
            : buildCategorySelection(),

            //TAG SELECTION
            20.verticalSpace,
            Text(Strings.tag, style: FontConstant.ratingPointDisplay,),
            5.verticalSpace,
            listTag.isEmpty
            ? const CircularProgressIndicator()
            : Wrap(
              children: 
                listTag.map((item) => _buildCustomSelection(item)).toList()),

            40.verticalSpace,
            Center(
              child: 
            ElevatedButton(
              onPressed: (){
                if (selectedCategory == null || storyNameController.text.isEmpty) {
                  _showWarningDialog(context);
                } else {
                  // Thực hiện hành động khi thể loại được chọn
                  validationAndSubmit();
                }
                
              },
              child:Padding(padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
                  child: Text(Strings.next, style: FontConstant.headline3White, textAlign: TextAlign.center,),), 
            )),
            40.verticalSpace
          ],))
      ),
    );
  }


Future<void> fetchUser() async{
    if (currentUser == null) {
    final result =  AccountService().getUserById(widget.userId);
      result.whenComplete(() {
        result.then((value) {
          if (value != null) {
           currentUser = value;
           debugPrint(currentUser!.displayName.toString());
          }
          else {
            return null;
          }
        });
      });
  }
    
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

              //WIDGET PREPARE
              dropdownNovelCategories = listTag.where((category) => 
                  category.categoryUrl== true && category.isCategory == true).toList();

              dropdownBookCategories = listTag.where((category) => 
                  category.categoryUrl == false && category.isCategory == true).toList();
                    });
            return value;
          } else {
            return null;
          }
        });
      });
    }
    
}

Widget buildCategorySelection(){
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
                    selectedCategory != null 
                    ?  selectedCategory!.categoryName ?? ''
                    :  isNonFiction ? Strings.bookCategories : Strings.novelCategories,
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
                      children:
                      isNonFiction 
                      ? dropdownBookCategories.map((Category item) {
                        return InkWell(
                          onTap: () {
                            setState(() {
                               selectedCategory = item;
                              isCategorySelectExpand = false;
                            });
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.sp, horizontal: 16.sp),
                            child: Text(item.categoryName ?? ''),
                          ),
                        );
                      }).toList()
                      : dropdownNovelCategories.map((Category item) {
                        return InkWell(
                          onTap: () {
                            selectedCategory = item;
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.sp, horizontal: 16.sp),
                            child: Text(item.categoryName ?? ''),
                          ),
                        );
                      }).toList(),
                    ),
                  )
                : 0.verticalSpace,
          ),]);
  }

  Widget _buildCustomSelection(Category item) {
    bool isSelected = selectedTags.contains(item.categoryId ?? '');
    if (item.isCategory == true) {
      return 0.verticalSpace;
    }
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

  Future<void> validationAndSubmit() async {
    Story newStory = Story();
    String categories = selectedCategory!.categoryId.toString();
    String tags = '';
    for (int tag in selectedTags) {
      tags+= ',$tag';
    }
     var temptstoryContentString = storyContentOutlineController.text;

      newStory.storyContentOutline = temptstoryContentString;
      newStory.storyCover = coverController.text;
      newStory.storyName = storyNameController.text;
      newStory.fkPublisherAccount = widget.userId;
      newStory.chapterCount = 0;
      newStory.viewCount = 0;
      newStory.bookAuthorName = currentUser?.displayName ?? '';
      newStory.bookPublisherName = currentUser?.displayName ?? '';
      newStory.selfComposedStory = true;
      //get selected category
      newStory.categoriesAndTags = categories;
      //get selected tags
      newStory.categoriesAndTags = '${newStory.categoriesAndTags}$tags';
      newStory.storySellPrice = 0.0;
      newStory.matureContent = false;
      newStory.commercialActivated = false;
      newStory.bookPublishDate = DateTime.now();
      newStory.bookISBNcode = 'NOCODE';

      
    try {
      final response = await StoryService().createStory(newStory);
      if (response.statusCode == 200) {
        debugPrint('Story create successfully: ${response.body}');
        //context.pushRoute(AddChapterPage(storyId: storyId));

      }
      
    } catch (e) {
      debugPrint('Error sending review: $e');
    }
    
  }

  void _showWarningDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(Strings.alertTitle, style: FontConstant.headline2White,),
          content: Text(Strings.alertContent,  style: FontConstant.subTitleText,),
          actions: <Widget>[
            TextButton(
              child: Text('OK', style: FontConstant.buttonTextWhite,),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }




}
