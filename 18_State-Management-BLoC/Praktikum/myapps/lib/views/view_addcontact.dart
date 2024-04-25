import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:myapps/blocs/bloc_contact.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ViewContact extends StatefulWidget {
  const ViewContact({super.key});

  @override
  State<ViewContact> createState() => _ViewContactState();
}

class _ViewContactState extends State<ViewContact> {
  DateTime selectedDate = DateTime.now();
  Color pickerColor = const Color(0xff2196f3);
  Color currentColor = const Color(0xff443a49);

  late ContactBloc _contactBloc;

  @override
  void initState() {
    super.initState();
    _contactBloc = ContactBloc();
  }

  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future colorPickerDialog() {
    return showDialog(
      context: context,
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
                    left: 30.0, top: 0.0, right: 30.0, bottom: 0.0)),
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text('CLOSE', style: TextStyle(color: Colors.blue)),
          ),
        ],
      ),
    );
  }

  int _parseColor(String colorString) {
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

  List<Map<String, String>> contactsList = [
    {
      'title': 'Contacts1',
      'subtitle': 'Contacts',
      'date': 'Date',
      'color': 'Color',
      'file': 'File'
    },
  ];

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();

  int? selectedIndex;
  String? selectedFile;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _contactBloc,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Contacts BLOC"),
        ),
        body: BlocBuilder<ContactBloc, List<Map<String, String>>>(
            builder: (context, contactsList) {
          return SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  const Icon(Icons.phone_android),
                  const SizedBox(height: 10),
                  const Text(
                    "Create New Contacts",
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Silahkan isi informasi kontak yang ingin anda simpan, masukan informasi yang valid agar dapat dihubungi",
                    textAlign: TextAlign.center,
                  ),
                  const Divider(
                    color: Colors.grey,
                    thickness: 0.5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(231, 224, 236, 1),
                        border: BorderDirectional(bottom: BorderSide()),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: TextFormField(
                          controller: _nameController,
                          decoration: const InputDecoration(
                            labelText: "Name",
                            hintText: 'Insert Your Name',
                            border: InputBorder.none,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Mohon masukkan nama Anda';
                            }
                            if (!RegExp(r'^[A-Z][a-z]*(\s[A-Z][a-z]*)+$')
                                .hasMatch(value)) {
                              return 'Format nama salah';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color.fromRGBO(231, 224, 236, 1),
                        border: BorderDirectional(bottom: BorderSide()),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: TextFormField(
                          controller: _numberController,
                          decoration: const InputDecoration(
                            labelText: "Nomor",
                            hintText: '08',
                            border: InputBorder.none,
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Mohon masukkan nomor Anda';
                            }
                            if (!RegExp(r'^0[0-9]{8,14}$').hasMatch(value)) {
                              return 'Format nomor salah';
                            }
                            return null;
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Date"),
                        const Spacer(),
                        GestureDetector(
                          child: const Text(
                            "Select",
                            style: TextStyle(
                              color: Colors.blue,
                            ),
                          ),
                          onTap: () => _selectDate(context),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${selectedDate.day}-${selectedDate.month}-${selectedDate.year}',
                        ),
                      ),
                    ],
                  ),
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("Color"),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: double.infinity,
                      height: 100,
                      decoration: BoxDecoration(color: pickerColor),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () => colorPickerDialog(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: pickerColor,
                        shape: const LinearBorder(),
                      ),
                      child: const Text(
                        "Pick color",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Pick Files",
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () async {
                        try {
                          await Permission.storage.request();
                          if (await Permission.storage.isDenied) {
                            await Permission.storage.request();
                          } else {
                            // Open file picker to allow user to pick a file
                            FilePickerResult? result =
                                await FilePicker.platform.pickFiles();

                            if (result != null) {
                              PlatformFile file = result.files.single;
                              print('File picked: ${file.name}');
                              setState(() {
                                selectedFile = file.name;
                              });
                            } else {
                              // User canceled the file picking
                              print('User canceled the file picking');
                            }
                          }
                        } catch (e) {
                          print('Error picking file: $e');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: const LinearBorder(),
                      ),
                      child: const Text(
                        "Pick and Open File",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (selectedIndex != null) {
                        // Show edit dialog
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              title: const Text("Edit Contact"),
                              content: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  TextFormField(
                                    controller: _nameController,
                                    decoration: const InputDecoration(
                                      labelText: "Name",
                                      hintText: 'Insert Your Name',
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Mohon masukkan nama Anda';
                                      }
                                      if (!RegExp(
                                              r'^[A-Z][a-z]*(\s[A-Z][a-z]*)+$')
                                          .hasMatch(value)) {
                                        return 'Format nama salah';
                                      }
                                      return null;
                                    },
                                  ),
                                  TextFormField(
                                    controller: _numberController,
                                    decoration: const InputDecoration(
                                      labelText: "Nomor",
                                      hintText: '08',
                                    ),
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Mohon masukkan nomor Anda';
                                      }
                                      if (!RegExp(r'^0[0-9]{8,14}$')
                                          .hasMatch(value)) {
                                        return 'Format nomor salah';
                                      }
                                      return null;
                                    },
                                  ),
                                ],
                              ),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text("Cancel"),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    if (nameValidation() &&
                                        numberValidation()) {
                                      String name = _nameController.text;
                                      String number = _numberController.text;
                                      context.read<ContactBloc>().add(
                                              UpdateContactEvent(
                                                  selectedIndex!, {
                                            'title': name,
                                            'subtitle': number,
                                            'date':
                                                '${selectedDate.day}-${selectedDate.month}-${selectedDate.year}',
                                            'color': pickerColor.toString(),
                                            'file': '$selectedFile'
                                            // Updated contact details here
                                          }));
                                      setState(() {});
                                      Navigator.pop(context);
                                    }
                                  },
                                  child: const Text("Save"),
                                ),
                              ],
                            );
                          },
                        );
                      } else {
                        if (nameValidation() && numberValidation()) {
                          String name = _nameController.text;
                          String number = _numberController.text;
                          context.read<ContactBloc>().add(AddContactEvent({
                                'title': name,
                                'subtitle': number,
                                'date':
                                    '${selectedDate.day}-${selectedDate.month}-${selectedDate.year}',
                                'color': pickerColor.toString(),
                                'file': '$selectedFile'
                              }));
                        }
                      }
                    },
                    child: const Text("Submit"),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    "List Contacts",
                    style: TextStyle(fontSize: 20),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: contactsList
                        .asMap()
                        .entries
                        .map(
                          (entry) => ListTile(
                            leading: CircleAvatar(
                              child: Text(entry.value['title']![0]),
                            ),
                            title: Text(entry.value['title']!),
                            subtitle: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(entry.value['subtitle']!),
                                Text(entry.value['date']!),
                                Row(
                                  children: [
                                    const Text("Color: "),
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color: Color(_parseColor(
                                            entry.value['color'].toString())),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                  ],
                                ),
                                Text('${entry.value['file']}'),
                              ],
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () {
                                    setState(() {
                                      selectedIndex = entry.key;
                                      _nameController.text =
                                          entry.value['title'] ?? '';
                                      _numberController.text =
                                          entry.value['subtitle'] ?? '';
                                    });
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {
                                    context
                                        .read<ContactBloc>()
                                        .add(DeleteContactEvent(entry.key));
                                  },
                                ),
                              ],
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }

  bool nameValidation() {
    String name = _nameController.text;

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

  bool numberValidation() {
    String number = _numberController.text;

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
    String name = _nameController.text;
    String number = _numberController.text;
    if (name.isNotEmpty && number.isNotEmpty) {
      setState(() {
        contactsList.add({
          'title': name,
          'subtitle': number,
          'date':
              '${selectedDate.day}-${selectedDate.month}-${selectedDate.year}',
          'color': pickerColor.toString(),
          'file': '$selectedFile'
        });
        print(contactsList);
        _nameController.clear();
        _numberController.clear();
      });
    }
  }

  void updateContact(int index) {
    String name = _nameController.text;
    String number = _numberController.text;
    if (name.isNotEmpty && number.isNotEmpty) {
      setState(() {
        contactsList[index] = {'title': name, 'subtitle': number};
        _nameController.clear();
        _numberController.clear();
        selectedIndex = null; // Reset selected index after updating
      });
    }
  }

  void deleteContact(int index) {
    setState(() {
      contactsList.removeAt(index);
      if (selectedIndex == index) {
        // Reset selected index if the deleted item was selected
        selectedIndex = null;
        _nameController.clear();
        _numberController.clear();
      } else if (selectedIndex != null && selectedIndex! > index) {
        // Adjust selected index if necessary
        selectedIndex = selectedIndex! - 1;
      }
    });
  }

  @override
  void dispose() {
    _nameController.dispose();
    _numberController.dispose();
    _contactBloc.close();
    super.dispose();
  }
}
