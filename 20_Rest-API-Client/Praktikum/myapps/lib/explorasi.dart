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
      home: ImageGenerator(),
    );
  }
}

class ImageGenerator extends StatefulWidget {
  @override
  _ImageGeneratorState createState() => _ImageGeneratorState();
}

class _ImageGeneratorState extends State<ImageGenerator> {
  TextEditingController _styleController = TextEditingController();
  String _imageUrl = '';

  Dio _dio = Dio();

  void _fetchImage() async {
    final styleName = _styleController.text.trim();
    if (styleName.isNotEmpty) {
      try {
        final response = await _dio
            .get('https://api.dicebear.com/8.x/personas/png?seed=$styleName');
        if (response.statusCode == 200) {
          setState(() {
            _imageUrl =
                'https://api.dicebear.com/8.x/personas/png?seed=$styleName';
          });
        } else {
          print('Failed to fetch image: ${response.statusCode}');
        }
      } catch (e) {
        print('Error fetching image: $e');
      }
    } else {
      print('Please enter a style name');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DiceBear'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: TextField(
                controller: _styleController,
                decoration: const InputDecoration(
                  labelText: 'Enter Style Name',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: _fetchImage,
              child: const Text('Generate Image'),
            ),
            const SizedBox(height: 20),
            _imageUrl.isNotEmpty
                ? Image.network(
                    _imageUrl,
                    width: 200,
                    height: 200,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _styleController.dispose();
    super.dispose();
  }
}
