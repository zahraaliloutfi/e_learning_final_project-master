import 'package:e_learning_final_project/controller/providers/localizationprovider.dart';
import 'package:e_learning_final_project/view/global/utill/custom_fonts.dart';
import 'package:e_learning_final_project/view/global/utill/images.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../controller/providers/themeprovider.dart';
import '../../global/utill/colors.dart';
import '../../global/utill/dimensions.dart';
import '../../widgets/Profile/Genaral_ListTile.dart';
import '../../widgets/Profile/ProfileTextAppBar.dart';
import '../../widgets/Profile/currencydialog.dart';
import 'EditprofileScreen.dart';
import 'Seeting/SettingScreen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}


class _ProfileScreenState extends State<ProfileScreen> {


  String _password = "";
  String _phone = "";
  String _email = "";
  bool _switchButton = ThemeProvider().darkTheme;

  void _loadUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _password = prefs.getString('password') ?? _password;
      _phone = prefs.getString('phone') ?? _phone;
      _email = prefs.getString('email') ?? _email;
      _switchButton = prefs.getBool('SwitchButton') ?? true;
    });
  }

  void _saveSwitchState(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('SwitchButton', value);
  }

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  void _openEditProfileScreen() async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const EditProfileScreen()),
    );
    _loadUserData(); // Reload data after editing
  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: ColorResources.getprimary(context),
        appBar: AppBar(
          backgroundColor: ColorResources.getprimary(context),
          title:  const ProfileTextAppBar(title: 'Account',),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 50,
                    child: Image.asset('assets/images/Profile/Avatar.png'),
                  ),
                ), //CircleAvatar
              ),
              const SizedBox(
                height: 40,
              ),
              Genaral_ListTile(
                title: 'Edit Account',
                icon: IconButton(
                  icon: const Icon(Icons.arrow_forward),
                  onPressed: _openEditProfileScreen,
                ),
              ),
              Genaral_ListTile(
                title: 'Setting and Privacy',
                icon: IconButton(onPressed: (){}, icon: const Icon(Icons.security)),
                // function: Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => SettingScreen(),
                //   ),
                // ),

              ),
              Genaral_ListTile(
                title: 'Help',
                icon: IconButton(onPressed: (){}, icon: const Icon(Icons.help_outline)),
              ),
              SwitchListTile(
                value: _switchButton,
                onChanged: (bool isActive) {
                  _switchButton = isActive;
                  Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
                  _saveSwitchState(isActive);
                },
                title: Text('dark',
                    style: TajwalRegular.copyWith(
                        fontSize: Dimensions.FONT_SIZE_LARGE)),
              ),
              ListTile(
                leading: Image.asset(
                  AssetsManager.languageIcon,
                  width: 25,
                  height: 25,
                  fit: BoxFit.fill,
                  color: ColorResources.gettextcolor(context),
                ),
                title: Text('title',
                    style: TajwalRegular.copyWith(
                        fontSize: Dimensions.FONT_SIZE_LARGE)),
                onTap: () {
                  showDialog(context: context, builder: (context)=>CurrencyDialog());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

