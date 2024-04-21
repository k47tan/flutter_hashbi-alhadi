import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({Key? key}) : super(key: key);

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  late DateTime currentDate;
  late DateTime dueDate;

  @override
  void initState() {
    super.initState();
    currentDate = DateTime.now();
    dueDate = currentDate;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Date"),
            TextButton.icon(
              icon: const Icon(Icons.save),
              style: TextButton.styleFrom(
                iconColor: Colors.deepPurple,
                padding: const EdgeInsets.only(
                  top: 20.0,
                  right: 10.0,
                ),
              ),
              label: const Text("Select"),
              onPressed: () async {
                final selectedDate = await showDatePicker(
                  context: context,
                  initialDate: currentDate,
                  firstDate: DateTime(1990),
                  lastDate: DateTime(currentDate.year + 10),
                );
                setState(() {
                  if (selectedDate != null) dueDate = selectedDate;
                });
              },
            ),
          ],
        ),
        Text(DateFormat("dd-MM-yyyy").format(dueDate)),
      ],
    );
  }
}
