import 'package:evchargingapp/Utils/colors.dart';
import 'package:evchargingapp/View/BottomNavigationBar/MyBottomNavigationBar.dart';
import 'package:evchargingapp/View/ForgetPassword/ForgetPasswrod.dart';
import 'package:evchargingapp/View/SignUp/SignUp.dart';
import 'package:evchargingapp/Widgets/CustomTextField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../ViewModel/ChargingStationsbyChargerType_ViewModel.dart';
import '../../ViewModel/LogIn_ViewModel.dart';
import '../../ViewModel/UserViewModel.dart';
import '../../Widgets/CustomButton.dart';
import '../../Widgets/CustomWidgets.dart';

class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);

  TextEditingController email = TextEditingController(text: 'arr2@gmail.com');
  TextEditingController password = TextEditingController(text: '11111111');
  final LoginViewModel loginViewModel = Get.put(LoginViewModel());
  static final UserViewModel userViewModelMain = Get.put(UserViewModel());
  static final ChargingStationViewModel chargingStationViewModel =
  ChargingStationViewModel();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.46,
                width: double.infinity,
                child: SvgPicture.asset(
                  'assets/signin.svg',
                  fit: BoxFit.cover,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.62,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(40),
                      topLeft: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Text(
                        'Sign In',
                        style: TextStyle(
                          color: ColorValues.blackColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.04,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: CustomTextField(
                          icon: Transform.scale(
                            scale: 0.4,
                            child: SvgPicture.asset('assets/emial.svg'),
                          ),
                          hinttext: 'Email or Phone Number',
                          controller: email,
                        ),
                      ),
                      Obx(
                            () => loginViewModel.loginResponse.value.error !=
                            'Invalid password' &&
                            loginViewModel.loginResponse.value.message !=
                                'Login successful' && loginViewModel.loginResponse.value.error !='' && loginViewModel.loginResponse.value.message != ''
                            ? Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '${loginViewModel.loginResponse.value.message ?? loginViewModel.loginResponse.value.error ?? ""}',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.redAccent,
                              ),
                            ),
                          ),
                        )
                            : Container(),
                      ),
                      SizedBox(height: 7,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0),
                        child: CustomTextField(
                          icon: Transform.scale(
                            scale: 0.4,
                            child: SvgPicture.asset('assets/Lock.svg'),
                          ),
                          hinttext: '********',
                          controller: password,
                        ),
                      ),
                      Obx(
                            () => loginViewModel.loginResponse.value.message !=
                            'Login successful' && loginViewModel.loginResponse.value.error !='' && loginViewModel.loginResponse.value.message != ''
                            ? Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30.0),
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '${loginViewModel.loginResponse.value.message ?? loginViewModel.loginResponse.value.error ?? ""}',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.redAccent,
                              ),
                            ),
                          ),
                        )
                            : Container(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 25.0,top: 4),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ForgetPassword(),
                                ),
                              );
                            },
                            child: Text(
                              'Forget Password?',
                              style: TextStyle(fontSize: 10),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.045,
                      ),
                      Container(
                        height: 32,
                        width: 140,
                        child: CustomButton(
                          text: 'Sign In',
                          onPressed: () async {
                            loginViewModel.login(email.text, password.text);
                            if (loginViewModel.loginResponse.value.message ==
                                'Login successful' &&
                                loginViewModel.loginResponse.value.id != '') {
                              EasyLoading.show(
                                status: 'Signing In...',
                                maskType: EasyLoadingMaskType.black,
                              );
                              await userViewModelMain
                                  .getUserData(); // Call getUserData after successful login
                              chargingStationViewModel.getChargingStationData();
                              await Future.delayed(
                                  const Duration(seconds: 2));
                              Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyBottomNavigationBar(),
                                ),
                                    (route) => false,
                              );
                              EasyLoading.dismiss();
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Obx(
                            () => Text(
                          loginViewModel.errorMessage.value,
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Text(
                        'OR',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.02,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularButtons('assets/google.svg', () {}, 35, 35),
                          SizedBox(
                            width: 10,
                          ),
                          CircularButtons('assets/apple.svg', () {}, 35, 35),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don’t have an Account?',
                            style: TextStyle(color: Colors.grey, fontSize: 11),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignUp(),
                                ),
                              );
                            },
                            child: Text(
                              ' Sign Up',
                              style: TextStyle(
                                color: ColorValues.primaryblue,
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
