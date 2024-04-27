import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapps/viewmodel/viewmodel_contact.dart';
import 'package:permission_handler/permission_handler.dart';

class ViewContact extends StatelessWidget {
  ViewContact({super.key});

  final contactController = Get.put(ContactController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: AppBar(
            title: const Text("Contacts"),
          ),
          body: SingleChildScrollView(
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
                          controller: contactController.nameController,
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
                          controller: contactController.numberController,
                          decoration: const InputDecoration(
                            labelText: "Nomor",
                            hintText: '+62...',
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
                          onTap: () => contactController.selectDate(context),
                        )
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          '${contactController.selectedDate.day}-${contactController.selectedDate.month}-${contactController.selectedDate.year}',
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
                      decoration:
                          BoxDecoration(color: contactController.pickerColor),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Center(
                    child: ElevatedButton(
                      onPressed: () => contactController.colorPickerDialog(),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: contactController.pickerColor,
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
                              contactController.selectedFile = file.name.obs;
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
                      if (contactController.selectedIndex != null) {
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
                                    controller:
                                        contactController.nameController,
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
                                    controller:
                                        contactController.numberController,
                                    decoration: const InputDecoration(
                                      labelText: "Nomor",
                                      hintText: '+62...',
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
                                    if (contactController
                                            .nameValidation(context) &&
                                        contactController
                                            .numberValidation(context)) {
                                      contactController.updateContact(
                                          contactController
                                              .selectedIndex!.value);
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
                        if (contactController.nameValidation(context) &&
                            contactController.numberValidation(context)) {
                          contactController.addContact();
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
                    children: contactController.contactsList
                        .asMap()
                        .entries
                        .map(
                          (entry) => ListTile(
                            leading: CircleAvatar(
                              child: Text(entry.value.title[0]),
                            ),
                            title: Text(entry.value.title),
                            subtitle: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(entry.value.subtitle),
                                Text(entry.value.date),
                                Row(
                                  children: [
                                    const Text("Color: "),
                                    Container(
                                      width: 20,
                                      height: 20,
                                      decoration: BoxDecoration(
                                        color:
                                            Color(int.parse(entry.value.color)),
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                    ),
                                  ],
                                ),
                                Text('${entry.value.file ?? ""}'),
                              ],
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.edit),
                                  onPressed: () {
                                    contactController.selectedIndex!.value =
                                        entry.key;
                                    contactController.nameController.text =
                                        entry.value.title;
                                    contactController.numberController.text =
                                        entry.value.subtitle;
                                  },
                                ),
                                IconButton(
                                  icon: const Icon(Icons.delete),
                                  onPressed: () {
                                    contactController.deleteContact(entry.key);
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
          ),
        ));
  }
}
