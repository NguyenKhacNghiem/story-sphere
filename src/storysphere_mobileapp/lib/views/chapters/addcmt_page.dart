import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:storysphere_mobileapp/constants/string.dart';
import 'package:storysphere_mobileapp/constants/utils/color_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';
import 'package:storysphere_mobileapp/models/comment.dart';
import 'package:storysphere_mobileapp/services/comment_service.dart';
import 'package:storysphere_mobileapp/views/chapters/widgets/comlist_itemwidget.dart';

@RoutePage()
class AddCommentPage extends StatefulWidget {
  final int chapterId;
  const AddCommentPage({super.key, required this.chapterId});

  @override
  State<AddCommentPage> createState() => _AddCommentPage();
}

class _AddCommentPage extends State<AddCommentPage> {
  late int chapterId;
  late int userId;
  final TextEditingController commentController = TextEditingController();
  List<Comment> commentList = [];
  int currentPage = 1;
  int totalPages = 1;

  @override
  void initState() {
    _loadUserId();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    chapterId = widget.chapterId;
    initData();
  
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
             60.verticalSpace,
             Center(
              child: Text(Strings.userComments, style: FontConstant.bookTitleDisplay,),
             ),
             
             5.verticalSpace,
             Container(
              width: 340.sp,
              height: 1.sp,
              color: ColorConstants.formStrokeColor,
             ),

             30.verticalSpace,
             Text(Strings.writeNewComment, style: FontConstant.bookTitleItem,),
             10.verticalSpace,
             commentEditor(),
            //SUBMIT BUTTON
            20.verticalSpace,
            Center(
              child: 
               ElevatedButton(
                style: ElevatedButton.styleFrom(
                          backgroundColor: ColorConstants.transparent,
                          shadowColor: ColorConstants.transparent,
                          padding: EdgeInsets.zero, // Remove padding
                          minimumSize: Size.zero,   // Remove minimum size constraints
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap, // Shrink wrap the button
                        ),
                  onPressed: () {
                    validationAndSubmit();
                  },
                child: Container(
                  decoration: BoxDecoration(
                    color: ColorConstants.buttonLightGreen,
                    borderRadius: BorderRadius.circular(5.sp),
                  ),
                  
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
                  child: 
                        Text(Strings.submitConmment, style: FontConstant.bookTitleItem,),
                      )
                
                )
                ),
            ),
             commentList.isEmpty
             ? const Text(Strings.writeNewComment)
             :ListView.builder(
              scrollDirection: Axis.vertical,
              controller: ScrollController(),
              physics: const ClampingScrollPhysics(),
              shrinkWrap: true,
              itemCount: commentList.length,
              itemBuilder: (context, index) {
                Comment comment = commentList.elementAt(index); 
                if (comment.replyTo == -1) {
                   List<Comment> replyComment = [];
                   replyComment = commentList
                    .where((review1) => review1.replyTo == comment.comtId)
                    .toList();
                
                  return Padding(
                        padding: EdgeInsets.only(top: 10.sp),
                        child: CommentListItemWidget(comment: comment, replyComment: replyComment,));
                
                } else {
                  return 2.verticalSpace;
                }
                 
              }),

            //Pagination
            20.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildPageButtons(),
            ),
             
          ],
        )
      ),
    );
  }

  Widget commentEditor (){
   return  Container(
      width: (MediaQuery.of(context).size.width - 25.sp).sp,
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
            controller: commentController,
            maxLines: 3,
            style:  FontConstant.rateContentDisplay,
            decoration: const InputDecoration(
              hintText: Strings.comment,
              fillColor: ColorConstants.transparent,
              border: InputBorder.none,
              enabledBorder: InputBorder.none,
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              hintStyle: TextStyle(color: ColorConstants.secondaryText),
            ),
        ),
    ),);
  }

  Future<void> _loadUserId() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      userId = prefs.getInt('userId') ?? 100004;
    });
  }

  void initData(){
    // GET DATA
     if (commentList.isEmpty) {
      final result =  CommentService().getCommentByChapter(chapterId, currentPage);
      result.whenComplete(() {
        result.then((value) {
          if (value != null) {
            setState(() {
              commentList = value.result;
              currentPage = value.currentPage;
              totalPages = value.totalPages;
            });
          }
        });
      });
    }

  }

   Future<void> validationAndSubmit() async {
    Comment newComment = Comment();
     var temptstoryContentString = commentController.text;
      newComment.comtContent = temptstoryContentString;
      newComment.replyTo = null;
      newComment.comtTime = DateTime.now();
      newComment.userId = userId;
      newComment.chapterId = widget.chapterId;

    try {
      final response = await CommentService().sendComment(newComment);
      if (response.statusCode == 200) {
        debugPrint('Review sent successfully: ${response.body}');
        setState(() {
          commentList.add(newComment);
        });

      }
      
    } catch (e) {
      debugPrint('Error sending review: $e');
    }
    
  }

  List<Widget> _buildPageButtons() {
    List<Widget> buttons = [];

    // Add previous button if not on the first page
    if (currentPage > 1) {
      buttons.add(
        _buildPageButton(currentPage - 1, 'Previous'),
      );
    }

    // Add page number buttons
    for (int i = 1; i <= totalPages; i++) {
      buttons.add(
        _buildPageButton(i, i.toString()),
      );
    }

    // Add next button if not on the last page
    if (currentPage < totalPages) {
      buttons.add(
        _buildPageButton(currentPage + 1, 'Next'),
      );
    }

    return buttons;
  }

  Widget _buildPageButton(int pageNumber, String label) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            currentPage = pageNumber;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: currentPage == pageNumber ? ColorConstants.buttonPastelGreen : ColorConstants.formStrokeColor,
        ),
        child: Text(label, style: FontConstant.buttonTextWhite,),
      ),
    );
  }

}
