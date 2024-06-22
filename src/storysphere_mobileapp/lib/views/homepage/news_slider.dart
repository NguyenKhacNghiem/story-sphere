import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NewsSliderHomepageWidget extends StatefulWidget {
  @override
  _NewsSliderHomepageWidgetState createState() => _NewsSliderHomepageWidgetState();
}

class _NewsSliderHomepageWidgetState extends State<NewsSliderHomepageWidget> {

    List<String> imgList = [];

  @override
  void initState() {
    super.initState();
    fetchFileContent();
  }

  Future<void> fetchFileContent() async {
    //File with Image IDs
    const url = 'https://drive.google.com/uc?export=download&id=1Ee6YJ2lYGCq-49NlFLpjAuQ-HZK0a695';
    

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        setState(() {
          imgList = response.body.split(',');
        });
      } else {
        throw Exception('Failed to load file');
      }
    } catch (e) {}
  }


  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CarouselSlider(
              options: CarouselOptions(
                height: 400.0,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
              ),
              items: imgList.map((item) => Container(
                child: Center(
                  child: Image.network('https://drive.google.com/uc?export=view&id=$item', fit: BoxFit.cover, width: 1000)
                ),
              )).toList(),
            ),
          ],
        ),
      );
    
  }

  
  
}
