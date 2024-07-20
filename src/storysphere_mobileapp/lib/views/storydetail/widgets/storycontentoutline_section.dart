
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storysphere_mobileapp/constants/string.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';

class StoryContentOutlineWidget extends StatefulWidget {
  final String data;
  const StoryContentOutlineWidget({super.key, required this.data});

  @override
  State<StoryContentOutlineWidget> createState() => _StoryContentOutlineWidget();
}

class _StoryContentOutlineWidget extends State<StoryContentOutlineWidget> {
  String data =
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque sit amet accumsan tortor. '
        'Donec et massa nec ante faucibus luctus. Vivamus scelerisque nibh et semper porta. '
        'Suspendisse potenti. Integer vehicula, nulla in fermentum fringilla, sapien ligula venenatis elit, '
        'sed fringilla lorem nulla sed elit. Donec euismod enim in libero ultricies vehicula.';
  late Widget showMoreButton;
  bool isExpanded = false;


  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    initData();
    return 
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.sp),
          child: 
         Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            AnimatedSize(
              duration: const Duration(milliseconds: 300),
              child: ConstrainedBox(
                constraints: isExpanded
                    ? const BoxConstraints()
                    : BoxConstraints(maxHeight: 100.sp),
                child: Text(
                  data,
                  style: FontConstant.contentOutLine,
                  overflow: TextOverflow.fade,
                  softWrap: true,
                  textAlign: TextAlign.justify,
                ),
              ),
            ),
            10.verticalSpace,
            Align(
              alignment: Alignment.bottomRight,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: Text(
                  isExpanded ? Strings.showLess : Strings.readMore,
                  style: FontConstant.purpleText,
                ),
              ),
            ),
            
          ])
        
    );
   }

  
  void initData() {
    // Code ở đây sẽ chỉ chạy một lần khi state được khởi tạo
    //data = widget.data;
    

  }
   
}
