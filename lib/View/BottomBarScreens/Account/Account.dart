import 'package:evchargingapp/View/AccountOption_Screens/ChangePassword.dart';
import 'package:evchargingapp/View/AccountOption_Screens/EditProfile.dart';
import 'package:evchargingapp/View/AccountOption_Screens/Language.dart';
import 'package:evchargingapp/View/AccountOption_Screens/MyWallet.dart';
import 'package:evchargingapp/View/SignIn/SignIn.dart';
import 'package:evchargingapp/Widgets/CustomWidgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Utils/colors.dart';
import '../../../ViewModel/UserViewModel.dart';
import '../../AccountOption_Screens/HelpandFAQs.dart';
import '../../AccountOption_Screens/PaymentMethods.dart';
import '../../AccountOption_Screens/PrivacyPolicy.dart';

class Account extends StatefulWidget {
  Account({Key? key}) : super(key: key);

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  final List<String> icons = [
    'assets/blue profile.svg',
    'assets/wallet.svg',
    'assets/paymentmethod.svg',
    'assets/blueLock.svg',
    'assets/privacypolicy.svg',
    'assets/noti.svg',
    'assets/language.svg',
    'assets/help.svg',
  ];

  final List<String> texts = [
    'Edit Profile',
    'My Wallet',
    'Payment Methods',
    'Change Password',
    'Privacy & Policy ',
    'Notification',
    'Language',
    'Help and FAQs',
  ];
  UserViewModel userViewModel = SignIn.userViewModelMain;

  // void clearMarkers() {
  //   setState(() {
  //     markers.clear();
  //   });
  // }
  //
  // void stopLocationService() {
  //   _locationController.stop();
  // }
  //
  // void turnOffMapServices() {
  //   // Clear markers on the map
  //   clearMarkers();
  //
  //   // Stop location updates
  //   stopLocationService();
  // }

  Future<void> _clearLoggedIn() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('isLoggedIn');
    await prefs.remove('id');
  }


  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: 85,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    spreadRadius: 1,
                    blurRadius: 1),
              ],
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Text(
                  'Account',
                  style: TextStyle(color: Colors.black, fontSize: 15),
                ),
              ),
            ),
          ),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Row(
                    children: [
                      if (userViewModel.userExists.value.profileImage != null)
                        Container(
                          height: 80,
                          width: 80,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  image: NetworkImage(
                                    userViewModel.userExists.value.profileImage!,
                                  ),
                                  fit: BoxFit.cover)

                          ),
                        )
                      else
                      CircularImage('assets/blank-profile-picture.jpg', 70, 70),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userViewModel.userExists.value.firstName +" "+ userViewModel.userExists.value.lastName,

                            // 'Hamza Abbasi',
                            style: TextStyle(color: Colors.black, fontSize: 13),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            userViewModel.userExists.value.phone,
                            style: TextStyle(
                                color: Colors.grey.withOpacity(0.7),
                                fontSize: 10),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.39,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 1),
                    ],
                  ),
                  child: MediaQuery.removePadding(
                    context: context,
                    removeTop: true,
                    child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: icons.length, // Number of items in your list
                      itemBuilder: (BuildContext context, int index) {
                        // Return a widget for each item at the specified index
                        return InkWell(
                          onTap: () {
                            if (texts[index] == 'Edit Profile')
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      EditProfile(), // Replace with your next screen widget.
                                ),
                              );
                            if (texts[index] == 'My Wallet')
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      MyWallet(), // Replace with your next screen widget.
                                ),
                              );
                            if (texts[index] == 'Payment Methods')
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      PaymentMethods(), // Replace with your next screen widget.
                                ),
                              );
                            if (texts[index] == 'Privacy & Policy ')
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      PrivacyPolicy(), // Replace with your next screen widget.
                                ),
                              );
                            if (texts[index] == 'Language')
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Language(), // Replace with your next screen widget.
                                ),
                              );
                            if (texts[index] == 'Help and FAQs')
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      HelpandFAQs(), // Replace with your next screen widget.
                                ),
                              );
                            if (texts[index] == 'Change Password')
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ChangePassword(), // Replace with your next screen widget.
                                ),
                              );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              children: [
                                SvgPicture.asset(icons[index]),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  texts[index],
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 12),
                                ),
                                Expanded(
                                    child: Align(
                                  alignment: Alignment.centerRight,
                                  child: texts[index] == 'Notification'
                                      ? MediaQuery.removePadding(
                                          context: context,
                                          removeTop: true,
                                          removeBottom: true,
                                          removeLeft: true,
                                          removeRight: false,
                                          child: Container(
                                            height: 20,
                                            width: 20,
                                            child: Transform.scale(
                                              scale: 0.6,
                                              // Adjust the scale factor as needed
                                              child: Switch(
                                                value: switchValue,
                                                onChanged: (value) {
                                                  setState(() {
                                                    switchValue = value;
                                                  });
                                                },
                                                activeColor:
                                                    ColorValues.primaryblue,
                                              ),
                                            ),
                                          ),
                                        )
                                      : Icon(
                                          CupertinoIcons.right_chevron,
                                          size: 16,
                                        ),
                                ))
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () async {
                    EasyLoading.show(
                      status: 'Signing Out...',
                      maskType: EasyLoadingMaskType.black,
                    );
                    await Future.delayed(Duration(seconds: 3));

                    _clearLoggedIn();
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SignIn(),
                      ),
                          (route) => false,
                    );
                    EasyLoading.dismiss();
                  },
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 1),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/signout.svg'),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Sign Out',
                            style: TextStyle(color: Colors.black, fontSize: 12),
                          ),
                          Expanded(
                              child: Align(
                            alignment: Alignment.centerRight,
                            child: Icon(
                              CupertinoIcons.right_chevron,
                              size: 16,
                            ),
                          ))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          )
        ],
      ),
    );
  }
}
