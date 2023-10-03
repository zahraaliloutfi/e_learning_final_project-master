import 'package:e_learning_final_project/view/screens/auth/auth_helper/dialoge_screen.dart';
import 'package:e_learning_final_project/view/screens/auth/auth_helper/show_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../../global/utill/colors.dart';
import '../auth_pages/auth_phone.dart';

class MyVerify extends StatefulWidget {
  const MyVerify({Key? key, required this.isTeasher, required this.isGuest})
      : super(key: key);
  final bool isTeasher;
  final bool isGuest;

  @override
  State<MyVerify> createState() => _MyVerifyState();
}

class _MyVerifyState extends State<MyVerify> {
  final currentUser = FirebaseAuth.instance.currentUser;
  TextEditingController controllerr = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 60,
      textStyle: const TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(30, 60, 87, 1),
          fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: ColorResources.kPrimaryColorGrey),
        borderRadius: BorderRadius.circular(15),
      ),
    );
    var code = '';
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        toolbarHeight: 90,
        centerTitle: true,
        title: const Text(
          "verify phone ",
          style: TextStyle(
            fontSize: 25,
            color: ColorResources.kPrimaryColorblack,
          ),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => MyPhone(
                  isGuest: widget.isGuest,
                  isTeasher: widget.isTeasher,
                ),
              ),
            );
          },
          icon: const Icon(
            Icons.close,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 25, right: 25),
        alignment: Alignment.center,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Code sent to ${currentUser!.phoneNumber}',
                style: const TextStyle(
                  fontSize: 22,
                  color: ColorResources.kPrimaryColorGrey,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 20,
              ),
              Pinput(
                length: 6,
                defaultPinTheme: defaultPinTheme,
                keyboardType: TextInputType.phone,
                showCursor: true,
                onCompleted: (pin) => print(pin),
                onChanged: (value) {
                  code = value;
                },
              ),
              const SizedBox(
                height: 70,
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorResources.kPrimaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10))),
                    onPressed: () async {
                      try {
                        PhoneAuthCredential credential =
                            PhoneAuthProvider.credential(
                                verificationId: MyPhone.verify, smsCode: code);

                        // Sign the user in (or link) with the credential
                        await auth.signInWithCredential(credential);
                        showSnackBar(context, 'Success');
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DialogScreen(
                                isTeasher: widget.isTeasher,
                                isGuest: widget.isGuest,
                              ),
                            ));
                      } catch (e) {
                        print('wrong otp becoaaaaaaaaaaase : $e');
                      }
                    },
                    child: const Padding(
                      padding: EdgeInsets.all(15),
                      child: Text("Verify and create acount "),
                    ),
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
