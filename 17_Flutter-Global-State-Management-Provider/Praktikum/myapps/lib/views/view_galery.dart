import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapps/models/model_images.dart';
import 'package:myapps/views/view_image.dart';

class ViewGallery extends StatefulWidget {
  const ViewGallery({super.key});

  @override
  State<ViewGallery> createState() => _ViewGalleryState();
}

class _ViewGalleryState extends State<ViewGallery> {
  final List<String> images = ImageModel().images;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Gallery',
          style: GoogleFonts.roboto(
            fontSize: 20,
            letterSpacing: 3.0,
            color: Colors.black,
          ),
        ),
      ),
      body: GridView.builder(
        itemCount: images.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
        ),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _showBottomSheet(context, images[index]);
            },
            child: Image(
              image: AssetImage(images[index]),
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }

  void _showBottomSheet(BuildContext context, String imagePath) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
            Text(
              'Apakah anda ingin melihat gambar ini?',
              style: GoogleFonts.roboto(
                fontSize: 10,
                color: Colors.black,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ViewImage(imagePath: imagePath),
                      ),
                    );
                  },
                  child: const Text('Ya'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Tidak'),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
