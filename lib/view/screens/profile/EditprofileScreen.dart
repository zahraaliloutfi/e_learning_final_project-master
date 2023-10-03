import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../global/utill/colors.dart';
import '../../widgets/Profile/CustomTextField.dart';
import '../../widgets/Profile/ProfileTextAppBar.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  void _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _passwordController.text = prefs.getString('name') ?? '';
      _phoneController.text = prefs.getString('phone') ?? '';
      _emailController.text = prefs.getString('email') ?? '';
    });
  }

  void _saveUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('password', _passwordController.text);
    prefs.setString('phone', _phoneController.text);
    prefs.setString('email', _emailController.text);
  }

  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

  @override
  void initState() {
    super.initState();
    _user = _auth.currentUser;
    _loadUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResources.getprimary(context),
      appBar: AppBar(
        backgroundColor: ColorResources.getprimary(context),
        title:  const ProfileTextAppBar(title: 'Edit Profile',),
        elevation: 0,
        leading: IconButton(onPressed: (){Navigator.of(context).pop();}, icon: Icon(Icons.arrow_back, color: ColorResources.textColor(context),)),
      ),
      body:_user != null
          ?  Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextField(nameController: _phoneController, title: 'Phone',),
            CustomTextField(nameController: _emailController, title: 'Email',),
            CustomTextField(nameController: _passwordController, title: 'Password',),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _saveUserData();
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        ),
      ) : const Center(child: Text('User not logged in' , style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25), )),
    );
  }
}

