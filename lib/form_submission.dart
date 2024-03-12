import 'package:flutter/material.dart';

class FormSubmission {
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
    if (formKey.currentState?.validate() ?? false) {
      formKey.currentState?.save();
      String summary = "Name: $name\n";
      summary += "Nickname: $nickname\n";
      summary += "Age: $age\n";
      summary +=
      "Relationship Status: ${relationshipStatus ? 'Single' : 'In a Relationship'}\n";
      summary += "Happiness Level: ${happinessLevel.toStringAsFixed(1)}\n";
      summary += "Superpower: ${superpowerDropdownValue ?? ''}\n";
      summary += "Favorite Motto: ${favoriteMotto ?? ''}";
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

  void resetForm(
      GlobalKey<FormState> formKey,
      TextEditingController nameController,
      TextEditingController nicknameController,
      TextEditingController ageController,
      Function resetState,
      ) {
    formKey.currentState?.reset();
    nameController.clear();
    nicknameController.clear();
    ageController.clear();
    resetState();
  }
}
