
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'update_bio_page.dart';
import 'update_phone_page.dart';
import 'update_profile_pic.dart';
import 'profile_provider.dart';
import 'update_name_page.dart';
import 'update_email_page.dart';



class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final profile = Provider.of<ProfileProvider>(context);
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 50.0,
        centerTitle: true,
        title: Text('Edit Profile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
            fontSize: 25,
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: ListView(
            children: <Widget>[
              // SizedBox(height: 32),
              Center(
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    SizedBox(height: 50),
                    CircleAvatar(
                      backgroundColor: Colors.blueAccent,
                      radius: 65,
                      child: CircleAvatar(
                        radius: 58,
                        backgroundColor: Colors.white,
                        backgroundImage: profile.profilePicture != null
                            ? FileImage(profile.profilePicture!) // Use the profile picture if available
                            : AssetImage('assets/profile_placeholder.png') as ImageProvider, // Placeholder image
                      ),
                    ),
                    Positioned(
                      top: 0,
                      left: 90,
                      // right: 30,
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: InkWell(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => UpdateProfilePicPage()),
                            ),
                            borderRadius: BorderRadius.circular(20),
                            child: Icon(
                              Icons.edit,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 0.0),
                child: ListTile(
                  title: Text('Name',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                  subtitle: Text(profile.firstname + profile.lastname, style: TextStyle(fontWeight: FontWeight.bold)),
                  trailing: Icon(Icons.arrow_forward_ios_outlined, color: Colors.grey),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UpdateNamePage()),
                  ),
                ),
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 0.0),
                child: ListTile(
                  title: Text('Phone',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                  subtitle: Text(profile.phoneNumber, style: TextStyle(fontWeight: FontWeight.bold)),
                  trailing: Icon(Icons.arrow_forward_ios_outlined, color: Colors.grey),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UpdatePhonePage()),
                  ),
                ),
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 0.0),
                child: ListTile(
                  title: Text('Email',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios_outlined, color: Colors.grey),
                  subtitle: Text(profile.email, style: TextStyle(fontWeight: FontWeight.bold)),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UpdateEmailPage()),
                  ),
                ),
              ),
              Divider(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 0.0),
                child: ListTile(
                  title: Text('Tell us about yourself',
                    style: TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.w500,
                      fontSize: 13,
                    ),
                  ),
                  subtitle: Text(profile.bio, style: TextStyle(fontWeight: FontWeight.bold)),
                  trailing: Icon(Icons.arrow_forward_ios_outlined, color: Colors.grey),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UpdateBioPage()),
                  ),
                ),
              ),
              Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
