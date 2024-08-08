import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:cloudinary/cloudinary.dart';

class NewsSliderHomepageWidget extends StatefulWidget {
  @override
  _NewsSliderHomepageWidgetState createState() => _NewsSliderHomepageWidgetState();
}

class _NewsSliderHomepageWidgetState extends State<NewsSliderHomepageWidget> {

  List<String> imgList = [];
  //Cách để thêm banner: 
  // 1. Upload trên cloudinary
  // 2. Gắn tag 'banner' cho ảnh

  @override
  void initState() {
    super.initState();
    fetchFileContent();
  }

  Future<void> fetchFileContent() async {
    final apiKey = '812141854164164';
    final apiSecret = 'XK19xo3om-m7Mz1Q6lK4lzQ2B6E';
    final cloudName = 'story-sphere';
    final collectionName = 'banner'; // Collection name

    final url = 'https://api.cloudinary.com/v1_1/$cloudName/resources/image/tags/$collectionName';
    final auth = 'Basic ' + base64Encode(utf8.encode('$apiKey:$apiSecret'));

    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {'Authorization': auth},
      );

      List<String> imgs = [];

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final images = data['resources'];
        for (var image in images) {
          print('Image URL: ${image['secure_url']}');
          imgs.add(image['secure_url']);
        }

         setState(() {
          imgList = imgs;
        });
      } else {
        print('Failed to load images: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            CarouselSlider(
              options: CarouselOptions(
                //height: 400.0,
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                viewportFraction: 0.8,
              ),
              items: imgList.map((item) => Container(
                child: Center(
                  child: Image.network(item, fit: BoxFit.cover, width: 1000)
                ),
              )).toList(),
            ),
          ],
        ),
      );
    
  }

  
  
}
