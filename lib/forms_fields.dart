/* The provided code defines custom form field widgets (TextFormFieldName, TextFormFieldNickname, TextFormFieldAge) and 
  helper methods (FormFields) for a Flutter application. These widgets facilitate the collection of user input for a 
  "Slam Book" form, including name, nickname, age, dropdown selection, and radio button selection. Additionally, there's 
  a main application entry point (SlamBookApp) that sets up the Flutter application with a dark theme and displays the 
  SlamBookForm as the home screen. */

import 'package:flutter/material.dart';

// Class containing form field widgets and data
class FormFields {
  // List of options for the dropdown menu
  static final List<String> _dropdownOptions = [
    "Makaflyfly",
    "Maging Invisible",
    "Mapaibig siya",
    "Mapabago ang isip niya",
    "Mapalimot siya",
    "Mabalik ang nakaraan",
    "Mapaghiwalay sila",
    "Makarma sila",
    "Mapasagasaan siya sa pison",
    "Mapaitim tuhod ng iniibig niya"
  ];

  // Map of motto options and their respective boolean values
  static final Map<String, bool> _motto = {
    "Hatters gonna love!": true,
    "Bakers gonna Bake": false,
    "If cannot be, borrow one from three": false,
    "Less is more, more or less": false,
    "Better late than sorry": false,
    "Don’t talk to strangers when your mouth is full": false,
    "Let’s burn bridge when we get there": false
  };

  // Method to generate dropdown items for the form
  List<DropdownMenuItem<String>> get dropdownItems {
    return _dropdownOptions.map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();
  }

  // Method to generate radio list tiles for the form
  List<Widget> radioListTiles(String? groupValue, Function(String?) onChanged) {
    return _motto.keys.map((String key) {
      return RadioListTile<String>(
        title: Text(key),
        value: key,
        groupValue: groupValue,
        onChanged: onChanged,
      );
    }).toList();
  }
}

// Custom TextFormField widget for collecting name input
class TextFormFieldName extends StatelessWidget {
  final TextEditingController controller;

  TextFormFieldName({required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: 'Name'), // Placeholder text
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Please enter your name'; // Validation message
        }
        return null;
      },
    );
  }
}

// Custom TextFormField widget for collecting nickname input
class TextFormFieldNickname extends StatelessWidget {
  final TextEditingController controller;

  TextFormFieldNickname({required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: 'Nickname'), // Placeholder text
    );
  }
}

// Custom TextFormField widget for collecting age input
class TextFormFieldAge extends StatelessWidget {
  final TextEditingController controller;

  TextFormFieldAge({required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number, // Allowing only numeric input
      decoration: InputDecoration(labelText: 'Age'), // Placeholder text
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Please enter your age'; // Validation message
        }
        if (int.tryParse(value ?? '') == null) {
          return 'Please enter a valid age'; // Validation message
        }
        return null;
      },
    );
  }
}
