import 'package:flutter/material.dart';

void main() {
  runApp(SlamBookApp());
}

class SlamBookApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Slam Book',
      theme: ThemeData.dark(),
      home: SlamBookForm(),
    );
  }
}

class SlamBookForm extends StatefulWidget {
  @override
  _SlamBookFormState createState() => _SlamBookFormState();
}

class _SlamBookFormState extends State<SlamBookForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  String? _superpowerDropdownValue;
  bool _relationshipStatus = false;
  double _happinessLevel = 0;
  String? _favoriteMotto = '';

  static final List<String> _dropdownOptions = [
    "Makalipad",
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
    "Hatters gonna hate": true,
    "Bakers gonna Bake": false,
    "If cannot be, borrow one from three": false,
    "Less is more, more or less": false,
    "Better late than sorry": false,
    "Don’t talk to strangers when your mouth is full": false,
    "Let’s burn bridge when we get there": false
  };

  @override
  void dispose() {
    _nameController.dispose();
    _nicknameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      String summary = "Name: ${_nameController.text}\n";
      summary += "Nickname: ${_nicknameController.text}\n";
      summary += "Age: ${_ageController.text}\n";
      summary +=
      "Relationship Status: ${_relationshipStatus ? 'Single' : 'In a Relationship'}\n";
      summary += "Happiness Level: ${_happinessLevel.toStringAsFixed(1)}\n";
      summary += "Superpower: ${_superpowerDropdownValue ?? ''}\n";
      summary += "Favorite Motto: ${_favoriteMotto ?? ''}";
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Slam Book Summary'),
            content: Text(summary),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  void _resetForm() {
    _formKey.currentState?.reset();
    _nameController.clear();
    _nicknameController.clear();
    _ageController.clear();
    _relationshipStatus = false;
    _happinessLevel = 0;
    _superpowerDropdownValue = null;
    _favoriteMotto = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slam Book'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _nicknameController,
                decoration: InputDecoration(labelText: 'Nickname'),
              ),
              TextFormField(
                controller: _ageController,
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
              ),
              SwitchListTile(
                title: Text('Relationship Status'),
                value: _relationshipStatus,
                onChanged: (value) {
                  setState(() {
                    _relationshipStatus = value;
                  });
                },
              ),
              Slider(
                value: _happinessLevel,
                min: 0,
                max: 10,
                divisions: 10,
                label: 'Gaano ka kahappy: ${_happinessLevel.toStringAsFixed(1)}',
                onChanged: (value) {
                  setState(() {
                    _happinessLevel = value;
                  });
                },
              ),
              DropdownButtonFormField<String>(
                value: _superpowerDropdownValue,
                items: _dropdownOptions.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    _superpowerDropdownValue = newValue;
                  });
                },
                decoration: InputDecoration(labelText: 'Superpower'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text('Favorite Motto'),
              ),
              Column(
                children: _motto.keys.map((String key) {
                  return RadioListTile<String>(
                    title: Text(key),
                    value: key,
                    groupValue: _favoriteMotto,
                    onChanged: (String? value) {
                      setState(() {
                        _favoriteMotto = value;
                      });
                    },
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _submitForm,
                    child: Text('Add'),
                  ),
                  ElevatedButton(
                    onPressed: _resetForm,
                    child: Text('Reset'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
