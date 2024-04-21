import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_file/open_file.dart';

class FilePickerWidget extends StatelessWidget {
  const FilePickerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Pick File"),
            const SizedBox(),
            Center(
              child: OutlinedButton.icon(
                icon: const Icon(Icons.attach_file),
                label: const Text("Select File"),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.deepPurple,
                ),
                onPressed: () async {
                  _pickFile(
                      context); // Panggil method _pickFile saat tombol ditekan
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  void _pickFile(BuildContext context) async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null) {
      OpenFile.open(result.files.single.path);
    }
  }
}
