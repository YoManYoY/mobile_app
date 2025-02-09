import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // ນຳເຂົ້າ package intl

class DateOfBirthField extends StatefulWidget {
  const DateOfBirthField({super.key});

  @override
  _DateOfBirthFieldState createState() => _DateOfBirthFieldState();
}

class _DateOfBirthFieldState extends State<DateOfBirthField> {
  final TextEditingController _dateOfBirthController = TextEditingController();
  DateTime? _selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        // ຈັດຮູບແບບວັນທີເປັນ DD/MM/YYYY
        _dateOfBirthController.text = DateFormat('dd/MM/yyyy').format(picked);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Date of Birth",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: TextFormField(
              controller: _dateOfBirthController,
              readOnly: true,
              onTap: () => _selectDate(context),
              validator: (value) {
                if (value!.isEmpty) {
                  return "Date of Birth ຫ້າມວ່າງ!";
                }
                return null;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                errorBorder: OutlineInputBorder(),
                focusedErrorBorder: OutlineInputBorder(),
                prefixIcon: Icon(
                  Icons.calendar_today,
                  color: Colors.grey,
                ),
                hintText: "DD/MM/YYYY",
                // ປ່ຽນ hintText ເປັນ DD/MM/YYYY
              ),
            ),
          ),
        ],
      ),
    );
  }
}
