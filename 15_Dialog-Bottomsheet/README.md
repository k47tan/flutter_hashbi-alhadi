# Summary

---

- **AlertDialog**
  AlertDialog adalah dialog yang muncul di atas aplikasi dan meminta pengguna untuk memilih satu atau beberapa opsi. AlertDialog memiliki beberapa properti, seperti `title`, `content`, dan `actions`. Menggunakan `showDialog` untuk menampilkan AlertDialog dan membutuhkan properti `context` dan `builder`.

  contoh penggunaan AlertDialog:

  ```dart
  showDialog(
      context: context,
      builder: (BuildContext context) {
      return AlertDialog(
          title: Text('Title'),
          content: Text('Content'),
          actions: <Widget>[
          FlatButton(
              child: Text('Cancel'),
              onPressed: () {
              Navigator.of(context).pop();
              },
          ),
          FlatButton(
              child: Text('OK'),
              onPressed: () {
              Navigator.of(context).pop();
              },
          ),
          ],
      );
      },
  );
  ```

- **BottomSheet**
  BottomSheet adalah dialog yang muncul dari bawah aplikasi dan meminta pengguna untuk memilih satu atau beberapa opsi. BottomSheet memiliki beberapa properti, seperti `title`, `content`, dan `actions`. Menggunakan `showModalBottomSheet` untuk menampilkan BottomSheet dan membutuhkan properti `context` dan `builder`.
  contoh penggunaan BottomSheet:
  ```dart
  showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
      return Container(
          child: Wrap(
          children: <Widget>[
              ListTile(
              leading: Icon(Icons.music_note),
              title: Text('Music'),
              onTap: () {
                  Navigator.of(context).pop();
              },
              ),
              ListTile(
              leading: Icon(Icons.videocam),
              title: Text('Video'),
              onTap: () {
                  Navigator.of(context).pop();
              },
              ),
          ],
          ),
      );
      },
  );
  ```
