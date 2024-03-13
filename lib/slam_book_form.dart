/* This code is a Flutter widget that creates a form for a "Slam Book" app. It collects various information including name, nickname, 
  age, relationship status, happiness level, preferred superpower, and favorite motto. The form includes text fields, switches, sliders, 
  dropdowns, and radio buttons for user input. It also handles form submission and resetting. */

import 'package:flutter/material.dart';
import 'forms_fields.dart'; // Importing custom form field widgets
import 'form_submission.dart'; // Importing form submission logic

// A form widget to collect information for a Slam Book
class SlamBookForm extends StatefulWidget {
  @override
  _SlamBookFormState createState() => _SlamBookFormState();
}

class _SlamBookFormState extends State<SlamBookForm> {
  // Key for managing the form state
  final _formKey = GlobalKey<FormState>();

  // Controllers for managing text input fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();

  // Variables for managing form data
  String? _superpowerDropdownValue; // Selected superpower from dropdown
  bool _relationshipStatus = false; // Relationship status (single/married)
  double _happinessLevel = 0; // Current happiness level
  String? _favoriteMotto = ''; // Selected favorite motto

  @override
  void dispose() {
    // Dispose controllers when the widget is disposed
    _nameController.dispose();
    _nicknameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  // Function to handle form submission
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

  // Function to reset the form
  void _resetForm() {
    FormSubmission().resetForm(
      _formKey,
      _nameController,
      _nicknameController,
      _ageController,
      () {
        // Resetting form data when reset button is pressed
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
        title: Text('Slam Book'), // Title of the form
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Assigning the form key to manage the form
          child: ListView(
            children: <Widget>[
              // Text input fields for name, nickname, and age
              TextFormFieldName(controller: _nameController),
              TextFormFieldNickname(controller: _nicknameController),
              TextFormFieldAge(controller: _ageController),

              // Switch for relationship status
              SwitchListTile(
                title: Text('Relationship Status'),
                value: _relationshipStatus,
                onChanged: (value) {
                  setState(() {
                    _relationshipStatus = value;
                  });
                },
              ),

              // Slider for happiness level
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Happiness Level",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "On a scale of 1-happy, gaano kasaya ang adulting?",
                    style: TextStyle(fontStyle: FontStyle.italic),
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
                ],
              ),

              // Dropdown for selecting superpower
              Column(
                children: [
                  const Text(
                    "Superpower",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "If you were to have a superpower, what will you choose?",
                    style: TextStyle(fontStyle: FontStyle.italic),
                  ),
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

              // Radio buttons for selecting favorite motto
              const Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
                child: Text(
                  'Favorite Motto',
                  style: TextStyle(fontSize: 17),
                ),
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

              // Buttons for form submission and reset
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _submitForm,
                    child: Text('Add'), // Button text for submitting the form
                  ),
                  ElevatedButton(
                    onPressed: _resetForm,
                    child: Text('Reset'), // Button text for resetting the form
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
