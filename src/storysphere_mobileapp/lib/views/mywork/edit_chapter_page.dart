import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:storysphere_mobileapp/constants/string.dart';
import 'package:storysphere_mobileapp/constants/utils/color_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/font_constant.dart';
import 'package:storysphere_mobileapp/constants/utils/icon_svg.dart';
import 'package:storysphere_mobileapp/models/chapter.dart';

@RoutePage()
class EditChapterPage extends StatefulWidget {
  final Chapter chapter;
  const EditChapterPage({super.key, required this.chapter});

  @override
  State<EditChapterPage> createState() => _EditChapterPage();
}

class _EditChapterPage extends State<EditChapterPage> {
  late Chapter chapter;
  final TextEditingController titleController = TextEditingController();
  late Widget chapterTilteField;
  late Widget buttonList;
  final HtmlEditorController chapterController = HtmlEditorController();
  int wordcount = 0;
  final FocusNode focusNode = FocusNode();
  late bool isKeyboardVisible;


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    super.dispose();
  }

  void onFocusChanged() {
    String? plainText = '';
    
    debugPrint(plainText);
    setState(() {
      if (plainText != "") {     
        wordcount = plainText.split(' ').length;
      } else {
        wordcount = 0;
      }
    });
     
  }
  

  @override
  Widget build(BuildContext context) {
    initData();
    isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom > 0;
  
    return Scaffold(
      body: SingleChildScrollView(
        child: 
        Padding(
          padding: EdgeInsets.all(20.sp),
          child: 
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            40.verticalSpace,
            Text(Strings.editChapter, style: FontConstant.headline1White,),
            10.verticalSpace,

            //BUTTON LIST
            buttonList,

            20.verticalSpace,
            //CHAPTER TITLE
            chapterTilteField,
            
            //CHAPTER CONTENT EDITOR
            10.verticalSpace,
            // Container(
            //   color: ColorConstants.secondaryText,
            //   child: 
            // QuillToolbar.simple(
            //   configurations: QuillSimpleToolbarConfigurations(
            //     controller: chapterController,
            //     color: ColorConstants.secondaryText,
            //     toolbarIconAlignment: WrapAlignment.center,
            //     multiRowsDisplay: false,
            //     toolbarIconCrossAlignment: WrapCrossAlignment.center,
            //     showAlignmentButtons: false,
            //   ),
              
              
            // )),
            //  Container(
            //     height: isKeyboardVisible ? 280.sp:  500.sp,
            //     padding: EdgeInsets.all(10.sp),
            //     decoration: BoxDecoration(
            //       border: Border.all(color: Colors.grey),
            //       borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5.sp), bottomRight: Radius.circular(5.sp))
            //     ),
            //     child: quill.QuillEditor.basic(
            //       configurations: QuillEditorConfigurations(
            //           controller: chapterController,
            //           autoFocus: false,
            //         ),
            //         focusNode: focusNode,
                    
                  
            //   ),
             
                
              
            // ),
            5.verticalSpace,
            Align(
              alignment: Alignment.centerRight,
              child: Text(wordcount.toString() + Strings.words, style: FontConstant.authorNameDisplay,),
            ),

           
          ],
        )),
      ),
    );
   }

  initData(){
    chapter = widget.chapter;
    // final document = htmlParser.parse(chapter.chapterContent ?? '');
    // chapterController.document.insert(0, document.body!.text);
    titleController.text = chapter.chapterName ?? '';

    chapterTilteField = Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: ColorConstants.formStrokeColor,
            width: 1.sp,),
          borderRadius: BorderRadius.circular(5.sp),
        ),
        child:Padding(
            padding: EdgeInsets.all(5.sp),
            child: TextField(
              controller: titleController,
              style:  FontConstant.buttonTextGrey,
              decoration: const InputDecoration(
                hintText: Strings.chapterTitle,
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
   
    buttonList = Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                            backgroundColor: ColorConstants.transparent,
                            shadowColor: ColorConstants.transparent,
                            padding: EdgeInsets.zero, // Remove padding
                            minimumSize: Size.zero,   // Remove minimum size constraints
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap, // Shrink wrap the button
                          ),
                  onPressed: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorConstants.formStrokeColor,
                      borderRadius: BorderRadius.circular(5.sp),
                    ),
                    
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 5.sp),
                    child:  Wrap(
                        children: [
                          IconsSVG.draft,
                          5.horizontalSpace,
                          Text(Strings.saveDraft, style: FontConstant.buttonTextWhite,),
                        ],)),
                  )
                  ),
                5.horizontalSpace,

                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                            backgroundColor: ColorConstants.transparent,
                            shadowColor: ColorConstants.transparent,
                            padding: EdgeInsets.zero, // Remove padding
                            minimumSize: Size.zero,   // Remove minimum size constraints
                            tapTargetSize: MaterialTapTargetSize.shrinkWrap, // Shrink wrap the button
                          ),
                  onPressed: () {
                   
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorConstants.buttonLightGreen,
                      borderRadius: BorderRadius.circular(5.sp),
                    ),
                    
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 5.sp),
                    child: 
                      Wrap(
                        children: [
                          IconsSVG.publish,
                          5.horizontalSpace,
                          Text(Strings.publish, style: FontConstant.buttonTextWhite,),
                        ],))
                  
                  )
                  ),
              ],
            );

    chapter.chapterContent = '''
<p>Trong <strong>căn phòng nhỏ</strong>, ánh đèn bàn mờ nhạt chiếu xuống những trang sách cũ kỹ. Minh Anh ngồi bên cửa sổ, lặng lẽ ngắm nhìn những chiếc lá rơi ngoài sân. Đêm nay, như mọi đêm khác, cô cảm thấy một nỗi buồn vô định xâm chiếm lòng mình. Bỗng, tiếng chuông điện thoại vang lên phá tan bầu không khí tĩnh mịch.</p>

<p>Minh Anh nhìn chiếc điện thoại cổ xưa nằm trên bàn, chiếc điện thoại mà cô đã tìm thấy trong căn gác xép của bà ngoại. Đó là một chiếc điện thoại quay số màu đen, từ thời bà cô còn trẻ. Cô đã thử sử dụng nó nhiều lần, nhưng chưa bao giờ thấy tín hiệu. Vậy mà đêm nay, chiếc điện thoại ấy lại đổ chuông.</p>

<p>Do dự một lát, Minh Anh cầm ống nghe lên. Tiếng rè rè phát ra từ đầu dây bên kia. Cô khẽ nói:</p>

<p>"Alo, ai đó?"</p>

<p>Im lặng kéo dài một lúc, rồi một giọng nói khàn khàn cất lên:</p>

<p>"Minh Anh, là cháu phải không?"</p>

<p>Minh Anh giật mình, tim đập thình thịch. Giọng nói này quen thuộc nhưng cô không thể nhớ ra là của ai. Cô hỏi lại, giọng run run:</p>

<p>"Vâng, là cháu đây. Ai đang nói vậy?"</p>

<p>Giọng nói kia tiếp tục:</p>

<p>"Cháu không nhận ra ta sao? Ta là bà ngoại của cháu đây."</p>

<p>Minh Anh kinh ngạc, chiếc điện thoại suýt nữa rơi khỏi tay cô. Bà ngoại cô đã mất từ ba năm trước. Cô không tin vào tai mình, nhưng giọng nói ấy thật sự là của bà ngoại.</p>

<p>"Bà ngoại? Làm sao... làm sao bà có thể gọi cho cháu được?"</p>

<p>Giọng nói bên kia nhẹ nhàng nhưng đầy vẻ bí ẩn:</p>

<p>"Đừng lo, cháu yêu. Bà không có nhiều thời gian. Bà muốn cảnh báo cháu về một nguy hiểm đang đến gần. Cháu phải cẩn thận, và nhớ kỹ rằng, những gì cháu tìm thấy trong căn gác xép sẽ giúp cháu."</p>

<p>Minh Anh cảm thấy rùng mình. Cô nhớ lại những hộp cũ, những cuốn sách và bức ảnh đã tìm thấy trên gác xép, nhưng không thấy gì đặc biệt. Cô hỏi:</p>

<p>"Bà nói rõ hơn được không? Cháu phải làm gì?"</p>

<p>Tiếng rè rè lại vang lên, giọng bà ngoại bắt đầu yếu dần:</p>

<p>"Hãy tin vào trực giác của cháu, và luôn cẩn trọng với những người xung quanh. Bà phải đi rồi, nhớ kỹ lời bà."</p>

<p>Cuộc gọi kết thúc đột ngột, tiếng rè rè biến mất, để lại Minh Anh với vô số câu hỏi và nỗi sợ hãi không tên. Cô đặt ống nghe xuống, tâm trí rối bời. Chuyện gì đang xảy ra? Làm sao bà ngoại có thể gọi từ bên kia thế giới?</p>

<p>Minh Anh nhìn quanh căn phòng, ánh đèn bàn bỗng trở nên lạnh lẽo hơn bao giờ hết. Cô quyết định sẽ lên gác xép kiểm tra lại mọi thứ vào sáng mai. Nhưng trước khi đi ngủ, cô khóa chặt cửa sổ và cửa ra vào, cảm giác có điều gì đó rất đáng sợ đang rình rập bên ngoài.</p>

<p>Đêm ấy, Minh Anh không tài nào chợp mắt được. Những lời cảnh báo của bà ngoại cứ vang vọng trong đầu, như một lời tiên tri đầy ám ảnh. Cô cảm nhận rõ ràng rằng cuộc sống của mình sẽ không còn như trước nữa. Cái gì đó bí ẩn và nguy hiểm đang đến gần, và cô phải sẵn sàng đối mặt với nó.</p>''';


   }
}
