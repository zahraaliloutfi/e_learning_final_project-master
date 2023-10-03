import 'package:e_learning_final_project/view/screens/auth/auth_pages/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../../global/utill/colors.dart';
import '../validation_logic.dart/auth_verify.dart';

class MyPhone extends StatefulWidget {
  static String verify = '';

  const MyPhone({Key? key, required this.isTeasher, required this.isGuest})
      : super(key: key);
  final bool isTeasher;
  final bool isGuest;

  @override
  State<MyPhone> createState() => _MyPhoneState();
}

class _MyPhoneState extends State<MyPhone> {
  TextEditingController controllerr = TextEditingController();
  TextEditingController countryCode = TextEditingController();

  var phone = '';
  bool _isObscure = true;

  @override
  void initState() {
    // TODO: implement initState
    countryCode.text = '+20';

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorResources.kPrimaryColor,
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_outlined,
              color: Colors.black,
            ),
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => LoginPage(
                  isTeasher: widget.isTeasher,
                  isGuest: widget.isGuest,
                ),
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 260,
                  color: ColorResources.kPrimaryColor,
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            IconButton(
                                icon: Icon(
                                  _isObscure
                                      ? Icons.visibility_outlined
                                      : Icons.visibility_off_outlined,
                                  color: ColorResources.kPrimaryColorblack,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _isObscure = !_isObscure;
                                  });
                                }),
                            const SizedBox(
                              width: 40,
                            ),
                            Text(
                              'Continue with Phone',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(30),
                          child: Image.asset(
                            'assets/images/auth_images/phone image.png',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                const Text(
                  "Enter Your Phone Number",
                  style: TextStyle(
                    fontSize: 19,
                    color: ColorResources.kPrimaryColorGrey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                //---------------------------------------------------------------
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                            border: Border.all(
                                width: 1,
                                color: ColorResources.kPrimaryColorGrey),
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: TextField(
                            obscureText: _isObscure,
                            onChanged: (value) => phone = value,
                            controller: controllerr,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                              hintText: '+63 283 835 2999',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                            color: ColorResources.kPrimaryColorBlue,
                            border: Border.all(
                                width: 1,
                                color: ColorResources.kPrimaryColorBlue),
                            borderRadius: BorderRadius.circular(10)),
                        width: 120,
                        child: TextButton(
                          child: const Text(
                            'Continue',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                            ),
                          ),
                          onPressed: () async {
                            await FirebaseAuth.instance.verifyPhoneNumber(
                              phoneNumber: phone,
                              verificationCompleted:
                                  (PhoneAuthCredential credential) {},
                              verificationFailed: (FirebaseAuthException e) {},
                              codeSent:
                                  (String verificationId, int? resendToken) {
                                MyPhone.verify = verificationId;
                                Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => MyVerify(
                                      isTeasher: widget.isTeasher,
                                      isGuest: widget.isGuest,
                                    ),
                                  ),
                                );
                                getPhone(phone) {
                                  var value = phone;
                                  return value;
                                }
                              },
                              codeAutoRetrievalTimeout:
                                  (String verificationId) {},
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
