import 'package:flutter/material.dart';
import 'package:myapps/models/model_images.dart';
import 'package:myapps/views/view_image.dart';

class ImageController extends ChangeNotifier {
  List<String> images = ImageModel().images;

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
