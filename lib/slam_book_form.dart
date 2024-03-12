import 'package:flutter/material.dart';
import 'forms_fields.dart';
import 'form_submission.dart';

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

  @override
  void dispose() {
    _nameController.dispose();
    _nicknameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  void _submitForm() {
    FormSubmission().submitForm(
      context,
      _formKey,
      _nameController.text,
      _nicknameController.text,
      _ageController.text,
      _relationshipStatus,
      _happinessLevel,
      _superpowerDropdownValue,
      _favoriteMotto,
    );
  }

  void _resetForm() {
    FormSubmission().resetForm(
      _formKey,
      _nameController,
      _nicknameController,
      _ageController,
          () {
        setState(() {
          _relationshipStatus = false;
          _happinessLevel = 0;
          _superpowerDropdownValue = null;
          _favoriteMotto = '';
        });
      },
    );
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
              TextFormFieldName(controller: _nameController),
              TextFormFieldNickname(controller: _nicknameController),
              TextFormFieldAge(controller: _ageController),
              SwitchListTile(
                title: Text('Relationship Status'),
                value: _relationshipStatus,
                onChanged: (value) {
                  setState(() {
                    _relationshipStatus = value;
                  });
                },
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Happiness Level", style: TextStyle(fontWeight: FontWeight.bold),),
                  const Text("On a scale of 1-happy, gaano kasaya ang adulting?",style: TextStyle(fontStyle: FontStyle.italic,)),
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
                ],
              ),
              Column(
                children: [
                  const Text("Superpower", style: TextStyle(fontWeight: FontWeight.bold),),
                  const Text("If you were to have a superpower, what will you choose?",style: TextStyle(fontStyle: FontStyle.italic,)),
                  DropdownButtonFormField<String>(
                    value: _superpowerDropdownValue,
                    items: FormFields().dropdownItems,
                    onChanged: (String? newValue) {
                      setState(() {
                        _superpowerDropdownValue = newValue;
                      });
                    },
                    decoration: const InputDecoration(labelText: 'Superpower'),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
                child: Text('Favorite Motto', style: TextStyle(fontSize: 17),),
              ),
              Column(
                children: FormFields().radioListTiles(
                  _favoriteMotto,
                      (String? value) {
                    setState(() {
                      _favoriteMotto = value;
                    });
                  },
                ),
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
