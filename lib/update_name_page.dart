import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'profile_provider.dart';
//
// void main() {
//   runApp(UpdateNamePage());
// }

class UpdateNamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<ProfileProvider>(context);
    TextEditingController FnameController = TextEditingController(text: profile.firstname);
    TextEditingController LnameController = TextEditingController(text: profile.lastname);

    return Scaffold(
      appBar: AppBar(
        title: Text(''), // Empty title
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              "What's your name?", // Displayed below the app bar
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 25,
              ),
            ),
            SizedBox(height: 16.0), // Provide spacing between text fields
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextFormField(
                    controller: FnameController,
                    decoration: InputDecoration(
                      labelText: 'First Name',
                      border: OutlineInputBorder(),
                      hintText: 'Micah',
                    ),
                  ),
                ),
                SizedBox(width: 16.0), // Provide spacing between text fields
                Expanded(
                  child: TextFormField(
                    controller: LnameController,
                    decoration: InputDecoration(
                      labelText: 'Last Name',
                      border: OutlineInputBorder(),
                      hintText: 'Smith',
                    ),
                  ),
                ),
              ],
            ),
        SizedBox(width: 100, // <-- Your width
              height: 300),// Provide some more spacing before the button
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
                profile.updateName(FnameController.text+" ", LnameController.text);
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

