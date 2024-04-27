import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:myapps/model/model_contact.dart';

class ContactController extends GetxController {
  DateTime selectedDate = DateTime.now();
  Color pickerColor = Colors.blue;
  Color currentColor = Colors.black;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController numberController = TextEditingController();
  RxList<ContactModel> contactsList = <ContactModel>[].obs;
  RxInt? selectedIndex;
  RxString? selectedFile;

  void changeColor(Color color) {
    pickerColor = color;
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      selectedDate = picked;
    }
  }

  Future<void> colorPickerDialog() async {
    return showDialog(
      context: Get.context!,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
        content: SingleChildScrollView(
          child: BlockPicker(
            pickerColor: pickerColor,
            onColorChanged: changeColor,
          ),
        ),
        actions: <Widget>[
          TextButton(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0.0)),
              padding: const EdgeInsets.only(
                  left: 30.0, top: 0.0, right: 30.0, bottom: 0.0),
            ),
            onPressed: () {
              Get.back(result: false);
            },
            child: const Text('CLOSE', style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
    );
  }

  int parseColor(String colorString) {
    // Check if colorString matches the MaterialColor format
    RegExp regExp = RegExp(
        r'MaterialColor\(primary value: Color\(0xff([A-Fa-f0-9]{6})\)\)');
    Iterable<Match> matches = regExp.allMatches(colorString);

    if (matches.isNotEmpty) {
      String hexColor = matches.first.group(1)!; // Extract hex color value
      return int.parse(hexColor, radix: 16) +
          0xFF000000; // Convert to integer and add alpha value
    } else {
      // Default color if string format is not recognized
      return Colors.grey.value;
    }
  }

  bool nameValidation(BuildContext context) {
    String name = nameController.text;

    // Cek apakah nama diisi oleh user
    if (name.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nama harus diisi!')),
      );
      return false;
    }

    // Cek apakah nama terdiri dari minimal 2 kata
    List<String> nameParts = name.split(' ');
    if (nameParts.length < 2) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Nama harus terdiri dari minimal 2 kata!')),
      );
      return false;
    }

    // Cek setiap kata harus dimulai dengan huruf kapital
    for (String part in nameParts) {
      if (part.substring(0, 1).toUpperCase() != part.substring(0, 1)) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text(
                  'Setiap kata dalam nama harus dimulai dengan huruf kapital!')),
        );
        return false;
      }
    }

    // Cek apakah nama mengandung angka atau karakter khusus
    RegExp specialChars = RegExp(r'[!@#\$%^&*(),.?":{}|<>0-9]');
    if (specialChars.hasMatch(name)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
                'Nama tidak boleh mengandung angka atau karakter khusus!')),
      );
      return false;
    }

    // Jika semua kriteria terpenuhi, maka nama valid
    return true;
  }

  bool numberValidation(BuildContext context) {
    String number = numberController.text;

    // Cek apakah nomor telepon diisi oleh user
    if (number.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nomor telepon harus diisi!')),
      );
      return false;
    }

    // Cek apakah nomor telepon terdiri dari angka saja
    if (!RegExp(r'^[0-9]+$').hasMatch(number)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Nomor telepon harus terdiri dari angka saja!')),
      );
      return false;
    }

    // Cek panjang nomor telepon harus minimal 8 digit dan maksimal 15 digit
    if (number.length < 8 || number.length > 15) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
                'Panjang nomor telepon harus minimal 8 digit dan maksimal 15 digit!')),
      );
      return false;
    }

    // Cek nomor telepon harus dimulai dengan angka 0
    if (number.substring(0, 1) != '0') {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Nomor telepon harus dimulai dengan angka 0!')),
      );
      return false;
    }

    // Jika semua kriteria terpenuhi, maka nomor telepon valid
    return true;
  }

  void addContact() {
    String name = nameController.text;
    String number = numberController.text;
    if (name.isNotEmpty && number.isNotEmpty) {
      ContactModel contact = ContactModel(
        title: name,
        subtitle: number,
        date:
            '${DateTime.now().day}-${DateTime.now().month}-${DateTime.now().year}',
        color: pickerColor.value.toString(),
        file: selectedFile?.value ?? "",
      );
      contactsList.add(contact);
      nameController.clear();
      numberController.clear();
    }
  }

  void updateContact(int index) {
    String name = nameController.text;
    String number = numberController.text;
    if (name.isNotEmpty && number.isNotEmpty) {
      ContactModel updatedContact =
          contactsList[index].copyWith(title: name, subtitle: number);
      contactsList[index] = updatedContact;
      nameController.clear();
      numberController.clear();
      selectedIndex!.value = 0; // Reset selected index after updating
    }
  }

  void deleteContact(int index) {
    contactsList.removeAt(index);
    if (selectedIndex!.value == index) {
      // Reset selected index if the deleted item was selected
      selectedIndex!.value = 0;
      nameController.clear();
      numberController.clear();
    } else if (selectedIndex!.value > index) {
      // Adjust selected index if necessary
      selectedIndex!.value = selectedIndex!.value - 1;
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    numberController.dispose();
    super.dispose();
  }
}
