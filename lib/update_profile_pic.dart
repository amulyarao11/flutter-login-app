import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'profile_provider.dart';


class UpdateProfilePicPage extends StatefulWidget {
  @override
  _UpdateProfilePicPageState createState() => _UpdateProfilePicPageState();
}

class _UpdateProfilePicPageState extends State<UpdateProfilePicPage> {
  File? _image;

  Future<void> _pickImage() async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        setState(() {
          _image = File(pickedFile.path);
        });
        // If you want to upload the image to a server or local storage,
        // this is where you would do it.
        // _updateProfilePicAndNavigateBack(pickedFile.path);
      }
    } catch (e) {
      // Handle any errors that occur during the image picking process.
      print(e);
    }
  }

  // void _updateProfilePicAndNavigateBack(File newProfilePic) {
  //   // Code here to update the profile pic in your data source
  //   // You can replace this with your logic to update the profile picture
  //   // For example, you might call a method from your provider to update the picture
  //
  //   // After updating the profile picture, navigate back to the main page
  //   final profileProvider = Provider.of<ProfileProvider>(context, listen: false);
  //   profileProvider.updateProfilePicture(newProfilePic);
  //   Navigator.pop(context); // This will go back to the main page
  // }

  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<ProfileProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              'Upload a photo of yourself:',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              await _pickImage();
            },
            child: const Text('Select file'),
          ),
          Expanded(
            child: Center(
              child: _image == null ? Text('No image selected.') : Image.file(_image!),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
            // child: ElevatedButton(
            //   style: ElevatedButton.styleFrom(
            //     minimumSize: Size.fromHeight(50), // Set the button's height.
            //   ),
            //   onPressed: () {
            //     profile.updateProfilePicture(_image!);
            //     Navigator.pop(context);
            //   },
            //   child: Text('Update'),
            // ),
            child: Center(
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
                  profile.updateProfilePicture(_image!);
                  Navigator.pop(context);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}



// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'main_page.dart';
//
// class UpdateProfilePicPage extends StatefulWidget {
//   @override
//   _UpdateProfilePicPageState createState() => _UpdateProfilePicPageState();
// }
//
// class _UpdateProfilePicPageState extends State<UpdateProfilePicPage> {
//   File? _image;
//
//   Future getImage() async {
//     final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
//     setState(() {
//       if (pickedFile != null) {
//         _image = File(pickedFile.path);
//       } else {
//         print('No image selected.');
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Upload a photo of yourself:'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             _image == null
//                 ? Text('No image selected.')
//                 : Image.file(_image!),
//             ElevatedButton(
//               onPressed: () =>  Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => MainPage()),
//               ),
//               child: Text('Update'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
