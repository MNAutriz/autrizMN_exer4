/* The provided code defines a class FormSubmission with methods to handle form submission and resetting in a Flutter application. 
It includes functionality to display a summary dialog of the submitted form data and to reset the form fields.
*/

import 'package:flutter/material.dart';

// Class for handling form submission and resetting
class FormSubmission {
  // Method to submit the form and display a summary dialog
  void submitForm(
    BuildContext context,
    GlobalKey<FormState> formKey,
    String name,
    String nickname,
    String age,
    bool relationshipStatus,
    double happinessLevel,
    String? superpowerDropdownValue,
    String? favoriteMotto,
  ) {
    // Validate form fields
    if (formKey.currentState?.validate() ?? false) {
      formKey.currentState?.save(); // Save form data

      // Generate summary text
      String summary = "Name: $name\n";
      summary += "Nickname: $nickname\n";
      summary += "Age: $age\n";
      summary +=
          "Relationship Status: ${relationshipStatus ? 'Single' : 'In a Relationship'}\n";
      summary += "Happiness Level: ${happinessLevel.toStringAsFixed(1)}\n";
      summary += "Superpower: ${superpowerDropdownValue ?? ''}\n";
      summary += "Favorite Motto: ${favoriteMotto ?? ''}";

      // Show summary dialog
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Slam Book Summary'),
            content: Text(summary), // Displaying form summary
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Dismiss dialog
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    }
  }

  // Method to reset the form
  void resetForm(
    GlobalKey<FormState> formKey,
    TextEditingController nameController,
    TextEditingController nicknameController,
    TextEditingController ageController,
    Function resetState,
  ) {
    formKey.currentState?.reset(); // Reset form state
    nameController.clear(); // Clear name field
    nicknameController.clear(); // Clear nickname field
    ageController.clear(); // Clear age field
    resetState(); // Reset additional form state if needed
  }
}
