import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'profile_provider.dart';


class UpdateEmailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<ProfileProvider>(context);
    TextEditingController emailController = TextEditingController(text: profile.email);
    return Scaffold(
      appBar: AppBar(
        title: Text(''), // Empty title
      ),
      body: Padding(
        padding: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "What\'s your email?", // Displayed below the app bar
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 25,
              ),
            ),
            SizedBox(height: 16.0), // Provide spacing between text fields
            Expanded(
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Your email address',
                  hintText: 'TimCook@icloud.com',
                ),
              ),
            ),
            SizedBox(height: 24.0), // Provide spacing before the button
            SizedBox(height: 200.0),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size(300, 70),
                  primary: Colors.black,
                  onPrimary: Colors.white,
                  shadowColor: Colors.black,
                  elevation: 3,

                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0)),
                ),
                child: Text('Update',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    // fontSize: 25,
                  ),
                ),
                onPressed: () {
                  profile.updateEmail(emailController.text);
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

