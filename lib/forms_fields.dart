import 'package:flutter/material.dart';

class FormFields {
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

  static final Map<String, bool> _motto = {
    "Hatters gonna love!": true,
    "Bakers gonna Bake": false,
    "If cannot be, borrow one from three": false,
    "Less is more, more or less": false,
    "Better late than sorry": false,
    "Don’t talk to strangers when your mouth is full": false,
    "Let’s burn bridge when we get there": false
  };

  List<DropdownMenuItem<String>> get dropdownItems {
    return _dropdownOptions.map((String value) {
      return DropdownMenuItem<String>(
        value: value,
        child: Text(value),
      );
    }).toList();
  }

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

class TextFormFieldName extends StatelessWidget {
  final TextEditingController controller;

  TextFormFieldName({required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: 'Name'),
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Please enter your name';
        }
        return null;
      },
    );
  }
}

class TextFormFieldNickname extends StatelessWidget {
  final TextEditingController controller;

  TextFormFieldNickname({required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: 'Nickname'),
    );
  }
}

class TextFormFieldAge extends StatelessWidget {
  final TextEditingController controller;

  TextFormFieldAge({required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'Age'),
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Please enter your age';
        }
        if (int.tryParse(value ?? '') == null) {
          return 'Please enter a valid age';
        }
        return null;
      },
    );
  }
}
