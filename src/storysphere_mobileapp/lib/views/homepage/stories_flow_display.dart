import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storysphere_mobileapp/models/story.dart';
import 'package:storysphere_mobileapp/services/story_service.dart';
import 'package:storysphere_mobileapp/views/widgets/book_display_widget.dart';

// ignore: must_be_immutable
class DisplayStoriesFlowHomepageWidget extends StatefulWidget {
  final String title;
  final String id;
  int? userId;
  DisplayStoriesFlowHomepageWidget({super.key, required this.title, required this.id, this.userId});

  @override
  _DisplayStoriesFlowHomepageWidgetState createState() => _DisplayStoriesFlowHomepageWidgetState();
}

class _DisplayStoriesFlowHomepageWidgetState extends State<DisplayStoriesFlowHomepageWidget> {
  List<Story> bookList = [];
  String title = '';
  int userId = -1;
  String id = '';

  @override
  void initState() {
    super.initState();
  }

  void fetchFileContent(){
    title = widget.title;
    if (widget.userId != null) userId = widget.userId!;
    id = widget.id;

     // GET DATA
     if (bookList.isEmpty) {
      final result;
      switch (id) {
        case 'YOUWOULDLIKE': {
          //result =  StoryService().getStoryByFavGenre(userId);
           result =  StoryService().getHorStories();
          break;
          }
        case 'HOTSTORIES': {
          result =  StoryService().getHorStories();
          break;
          }
        case 'UPDATEDRECENTLY' :{
          result =  StoryService().recentlyUpdated();
          break;
        }
        case 'STORYRECOMMENDED': {
          result = StoryService().getMostRating();
          break;
        }
        default: {
           result =  StoryService().getHorStories();
           break;

        }
      }
      
      result.whenComplete(() {
        result.then((value) {
          if (value != null) {
            setState(() {
              bookList = value;
              debugPrint('Length: ' + id + bookList.length.toString());
            });
          }
        });
      });
    }
 
  }


  @override
  Widget build(BuildContext context) {
    fetchFileContent();
    return Padding(
      padding: EdgeInsets.all(5.sp),
      child: 
      bookList.isEmpty
      ? const CircularProgressIndicator()
      :  SizedBox(
        height: 230.0,  // specify a height
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: bookList.length,
          itemBuilder: (context, index) {
            final item = bookList[index];
            return BookDisplayWidget(
                story: item,
              );

          }
        )),
          
      );
    
  }

}
