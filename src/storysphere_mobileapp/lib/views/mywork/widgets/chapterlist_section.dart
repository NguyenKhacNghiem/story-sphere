import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storysphere_mobileapp/constants/string.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';
import 'package:storysphere_mobileapp/models/chapter.dart';
import 'package:storysphere_mobileapp/models/pagination_result.dart';
import 'package:storysphere_mobileapp/routing/router.gr.dart';
import 'package:storysphere_mobileapp/services/chapter_services.dart';
import 'package:storysphere_mobileapp/views/mywork/widgets/chapterlistitem_widget.dart';

class ChapterListWriteSection extends StatefulWidget {
  final int storyId;
  const ChapterListWriteSection({super.key, required this.storyId});

  @override
  State<ChapterListWriteSection> createState() => _ChapterListWriteSection();
}

class _ChapterListWriteSection extends State<ChapterListWriteSection> {
  List<Chapter> chapterList = [];

  @override
  Widget build(BuildContext context) {
    initData();
  
    return 
      Padding(
        padding: EdgeInsets.symmetric(vertical: 20.sp),
        child:
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(Strings.chapterListDisplay.toUpperCase(), style: FontConstant.resultTitleDisplay,),

                chapterList.isEmpty 
                ? buildloading(widget.storyId)
                : 
                ListView.builder(
                    scrollDirection: Axis.vertical,
                    controller: ScrollController(),
                    physics: const ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: chapterList.length,
                    itemBuilder: (context, index) {
                    return
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 8.sp), 
                      child: InkWell(
                        onTap: (){ 
                          context.pushRoute(EditChapterPage(chapter: chapterList.elementAt(index)));
                        },
                        child: ChapterListWriteItemWidget(chapter: chapterList.elementAt(index),),
                      ),
                      
                    );
                }),
              ],)
        );
    
  }

  Widget buildloading(int storyId){
    //get chapter by storyiD
    
    if (chapterList.isEmpty){
       return const CircularProgressIndicator();
    } else {
      return 0.horizontalSpace;
    }
   }

    
  void initData() {
    // GET DATA
     if (chapterList.isEmpty) {
      final result =  ChapterService().getChaptesrByStoryId(widget.storyId, 1);
      result.whenComplete(() {
        result.then((value) {
          if (value != null && value is PaginationResult<Chapter> ) {
            setState(() {
              chapterList = value.result;
            });
          }
        });
      });
    }
    

  }
   
}
