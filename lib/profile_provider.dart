import 'package:flutter/material.dart';
import 'dart:io';

class ProfileProvider with ChangeNotifier {
  String firstname = 'Your ';
  String lastname = 'Name';
  String email = 'email@example.com';
  String phoneNumber = '123-456-7890';
  String bio = 'Your bio here';
  File? _profilePicture;
  File? get profilePicture => _profilePicture;

  void updateName(String newFName, String newLName) {
    firstname = newFName;
    lastname = newLName;
    notifyListeners();
  }

  void updateEmail(String newEmail) {
    email = newEmail;
    notifyListeners();
  }

  void updatePhoneNumber(String newPhoneNumber) {
    phoneNumber = newPhoneNumber;
    notifyListeners();
  }

  void updateBio(String newBio) {
    bio = newBio;
    notifyListeners();
  }
  // Method to update the profile picture
  void updateProfilePicture(File newProfilePicture) {
    _profilePicture = newProfilePicture;
    notifyListeners(); // Notify the listeners about the change
  }
}
