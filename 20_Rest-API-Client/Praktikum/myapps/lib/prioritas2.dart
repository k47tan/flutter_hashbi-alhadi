import 'dart:math';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas Dicebear',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ImageGrid(),
    );
  }
}

class ImageGrid extends StatefulWidget {
  @override
  _ImageGridState createState() => _ImageGridState();
}

class _ImageGridState extends State<ImageGrid> {
  Dio _dio = Dio();
  List<String> _imageUrls = [];

  @override
  void initState() {
    super.initState();
    _generateImages();
  }

  void _generateImages() async {
    _imageUrls.clear();
    for (int i = 0; i < 10; i++) {
      final randomSeed = Random().nextInt(100000);
      final response = await _dio
          .get('https://api.dicebear.com/8.x/personas/png?seed=$randomSeed');
      if (response.statusCode == 200) {
        setState(() {
          _imageUrls.add(
              'https://api.dicebear.com/8.x/personas/png?seed=$randomSeed');
        });
      } else {
        // Handle error
        print('Failed to fetch image: ${response.statusCode}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DiceBear Image Grid'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: _generateImages,
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
        ),
        itemCount: _imageUrls.length,
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            _imageUrls[index],
            width: 150,
            height: 150,
          );
        },
      ),
    );
  }
}
