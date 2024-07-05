import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:storysphere_mobileapp/models/story.dart';
import 'package:storysphere_mobileapp/views/widgets/book_display_widget.dart';

class DisplayStoriesFlowHomepageWidget extends StatefulWidget {
  final String title;
  final String id;
  const DisplayStoriesFlowHomepageWidget({super.key, required this.title, required this.id});

  @override
  _DisplayStoriesFlowHomepageWidgetState createState() => _DisplayStoriesFlowHomepageWidgetState();
}

class _DisplayStoriesFlowHomepageWidgetState extends State<DisplayStoriesFlowHomepageWidget> {

  List<Story> bookList = [];
  String title = '';
  String id = '';

  @override
  void initState() {
    super.initState();
    fetchFileContent();
  }

  Future<void> fetchFileContent() async {
    title = widget.title;
    id = widget.id;
    
    bookList = [
      Story(
        storyId: 1, 
        storyCover: 'assets/example_data/bc_descendant_of_the_crane.jpg', 
        storyName: 'Descendant of the crane'
      ),
      Story(
        storyId: 2, storyCover: 'assets/example_data/bc_drowned_country.jpg', storyName: 'Drowned Country'
      ),
      Story(
        storyId: 3, storyCover: 'assets/example_data/bc_lore_of_aetherra.jpg', storyName: 'Lore of Aetherra'
      ),
      Story(
        storyId: 4, storyCover: 'assets/example_data/bc_take_your_turn.jpg', storyName: 'Take your turn Teddy'
      ),
      Story(
        storyId: 5, storyCover: 'assets/example_data/bc_the_crime_of_steamfield.jpg', storyName: 'The crime of Steamfield'
      ),
      
    ];
 
  }


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5.sp),
      child: 
        SizedBox(
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
