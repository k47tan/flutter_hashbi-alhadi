import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// list image
class Gallery extends StatefulWidget {
  const Gallery({super.key});

  @override
  State<Gallery> createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  final List<String> image = [
    'assets/images/1.jpg',
    'assets/images/2.png',
    'assets/images/3.jpg',
    'assets/images/4.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Gallery',
          style: GoogleFonts
              .philosopher(), // penerepan fonts dari package google_fonts
        ),
      ),
      body: GridView.builder(
        itemCount: image.length, // panjang list
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          // mengatur grid
          crossAxisCount: 2,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              _showBottomSheet(context, image[index]);
            },
            child: Image(
              image: AssetImage(image[index]),
              fit: BoxFit.cover,
            ),
          );
        },
      ),
    );
  }

// fungsi menampilkan bottom sheet
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => NewPage(imagePath: imagePath),
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

class NewPage extends StatelessWidget {
  final String imagePath;

  // Constructor imagePath
  const NewPage({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Page'),
      ),
      body: Center(
        child: Image(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
