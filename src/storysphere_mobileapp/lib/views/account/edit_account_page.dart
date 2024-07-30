import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:storysphere_mobileapp/constants/string.dart';
import 'package:storysphere_mobileapp/constants/utils/color_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';
import 'package:storysphere_mobileapp/models/user.dart';
import 'package:storysphere_mobileapp/services/account_service.dart';
import 'package:storysphere_mobileapp/services/cloud_service.dart';
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
  XFile? _image;
  XFile? _coverImgae;  final ImagePicker _picker = ImagePicker();
  DateTime? _selectedDate;
  String? userAvatarLinkPath;
  String? userCoverLinkPath;
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController userIntroductionController = TextEditingController();
  bool loading = false;
 
  
  @override
  void dispose() {
    userNameController.dispose();
    userIntroductionController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    user = widget.user;
    userNameController.text = user.displayName ?? '';
    userIntroductionController.text = user.selfIntroduction ?? '';
    if (_image == null) {
      userAvatarLinkPath = user.avatar ?? Strings.defaultCover;
    }
    if (_coverImgae == null) {
      userCoverLinkPath = user.bgImg ?? Strings.defaultBgImg;
    }
    _selectedDate = user.dateOfBirth;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
   
    
   
    return Scaffold(
      bottomNavigationBar: const SPBottomNavigationBar(selectedIndex: 4),
      body: SingleChildScrollView(
        child: 
        Padding( padding: EdgeInsets.symmetric(horizontal: 20.sp),
        child: 
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            50.verticalSpace,

            Text(Strings.editProfile, style: FontConstant.resultTitleDisplay,),
            20.verticalSpace,

            //USER AVATAR
            Text(Strings.previewAvatar, style: FontConstant.ratingPointDisplay,),
                    10.verticalSpace,
                    InkWell(
                      onTap: (){_pickImage(true);},
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
                              child: Image.file(File(_image!.path), fit: BoxFit.cover,))),
                    ),
            30.verticalSpace,
            //USER BACKGROUND IMAGE
            Text(Strings.previewCover, style: FontConstant.ratingPointDisplay,),
                      10.verticalSpace,
                      InkWell(
                        onTap: (){_pickImage(false);},
                        child: Container(
                          height: 150.sp,
                          width: 280.sp,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(42.sp),
                            color: ColorConstants.formStrokeColor,
                          ),
                          child: _coverImgae == null 
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(5.sp),
                                child: Image.network(user.bgImg ?? Strings.defaultBgImg, fit: BoxFit.cover,))
                            : ClipRRect(
                                borderRadius: BorderRadius.circular(5.sp),
                                child: Image.file(File(_coverImgae!.path), fit: BoxFit.cover,))),
                      ),
          
            //USER NAME
            40.verticalSpace,
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
            30.verticalSpace,
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

            //DATE OF BIRTH
            30.verticalSpace,
            Text(Strings.dateOfBirth, style: FontConstant.ratingPointDisplay,),
            5.verticalSpace,
            Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: ColorConstants.formStrokeColor,
                    width: 1.sp,
                  ),
                  borderRadius: BorderRadius.circular(5.sp),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 5.sp),
                  child: 
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  Text(
                      _selectedDate == null
                      ? user.dateOfBirth == null
                          ? Strings.chooseDoB
                          : user.dateOfBirth!.toString()
                        : '${_selectedDate!.day}/${_selectedDate!.month}/${_selectedDate!.year}',
                      style: FontConstant.ratingPointDisplay,
                    ),
                  
             
              
               20.horizontalSpace,
                ElevatedButton(
                  onPressed: () => _selectDate(context),
                  child: Icon(
                    Icons.date_range_outlined,
                    size: 25.sp,
                    weight: 0.5.sp,
                    color: ColorConstants.bgWhite,),
                ),
              ],)
            )),
           
            30.verticalSpace,
            Center(
              child: 
            ElevatedButton(
              onPressed: (){
                //create story and get storyID
                validationAndSubmit();
                
              },
              child:Padding(padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
                  child: Text(Strings.saveChange, style: FontConstant.headline3White, textAlign: TextAlign.center,),), 
            )),
            40.verticalSpace

          ],))
      ),
    );
  }
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: ColorConstants.buttonPastelGreen,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: Colors.black,
            ),
           
          ),
          child: child!,
        );
      },
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  Future<void> _pickImage(bool avt) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        if (avt) {
            setState(() {
            _image = pickedFile; // Update state with the picked file
          });
        } else {
          setState(() {
            _coverImgae = pickedFile;
          });
        }
      }
    } catch (e) {
      print('Error picking image: $e');
    }
  }
  
   Future<void> validationAndSubmit() async {
    loading = true;
    if (loading) {
      showDialog(
      context: context,
      barrierDismissible: false, // Ngăn người dùng tương tác với phần còn lại của màn hình
      builder: (BuildContext context) {
        return AlertDialog(
          content: Row(
            children: [
              CircularProgressIndicator(),
              20.horizontalSpace,
              Text('Đang lưu thay đổi...'),
            ],
          ),
        );});
    }

    if (_image != null || _coverImgae != null){
      List<Future<void>> futures = [];
      if (_image != null) {
        futures.add(
          CloudService().uploadImage(_image).then((value){
            userAvatarLinkPath = value;
          })
        );
      }
      if (_coverImgae != null) {
        futures.add(
          CloudService().uploadImage(_coverImgae).then((value){
            userCoverLinkPath = value;
          })
        );
      }
      await Future.wait(futures);
      updateAccount();
     
    } else {
      updateAccount();
    }
    
  
  }

  Future<void> updateAccount() async {
    String displayName = userNameController.text;
    String introduction = userIntroductionController.text;
    DateTime dateOfBirth = _selectedDate ?? DateTime.now();
    if (_image == null) userAvatarLinkPath = user.avatar;
    if (_coverImgae == null) userCoverLinkPath = user.bgImg;
    try {
      final response = await AccountService().updateProfile(user.userId ?? -1, displayName, introduction, dateOfBirth, userAvatarLinkPath, userCoverLinkPath);
      if (response.statusCode == 200) {
        debugPrint('Review sent successfully: ${response.body}');
        final responseData = json.decode(response.body);
         if (responseData['code'] == 0 || responseData['code'] == 100) {
            showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text(Strings.profileUpdatedSuccessfully),
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
                       Navigator.of(context, rootNavigator: true).pop();
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
