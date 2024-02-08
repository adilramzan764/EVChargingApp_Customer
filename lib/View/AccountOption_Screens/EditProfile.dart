import 'dart:io';

import 'package:evchargingapp/Utils/colors.dart';
import 'package:evchargingapp/Widgets/CustomButton.dart';
import 'package:evchargingapp/Widgets/CustomWidgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../ViewModel/EditProfile_ViewModel.dart';
import '../../ViewModel/UserViewModel.dart';
import '../../Widgets/ImagePicker_Dialog.dart';
import '../SignIn/SignIn.dart';

class EditProfile extends StatefulWidget {
  EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  UserViewModel userViewModel = SignIn.userViewModelMain;

  final EditProfileViewModel editProfile_ViewModel =
      Get.put(EditProfileViewModel());
  TextEditingController firstname = TextEditingController();

  TextEditingController lastname = TextEditingController();

  TextEditingController phonenumber = TextEditingController();

  TextEditingController email = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController address = TextEditingController();

  File? _selectedImage;

  @override
  Widget build(BuildContext context) {
    final ImagePickerHandler _imagePickerHandler = ImagePickerHandler(
      context,
      (File? pickedImage) {
        setState(() {
          _selectedImage = pickedImage;
        });
      },
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: Icon(
                          CupertinoIcons.left_chevron,
                          size: 16,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      Text(
                        'Edit Profile',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                      SizedBox(
                        height: 30,
                        width: 30,
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: Stack(
                children: [
                  if (_selectedImage != null)
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: Image.file(
                            _selectedImage!,
                            height: 120,
                            width: 120,
                            fit: BoxFit.cover,
                          ).image,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  else if (userViewModel.userExists.value.profileImage != null)
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
                    CircularImage('assets/blank-profile-picture.jpg', 80, 80),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: InkWell(
                      onTap: () {
                        _imagePickerHandler.showPickerDialog();
                      },
                      child: Container(
                        height: 24,
                        width: 24,
                        decoration: BoxDecoration(
                          color: ColorValues.primaryblue,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            CupertinoIcons.camera_fill,
                            size: 12,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            EditProfile_TextField('assets/profile-grey.svg',userViewModel.userExists.value.firstName,firstname),
            SizedBox(height: MediaQuery.of(context).size.height*0.01,),
            EditProfile_TextField('assets/profile-grey.svg',userViewModel.userExists.value.lastName,lastname),
            SizedBox(height: MediaQuery.of(context).size.height*0.01,),
            EditProfile_TextField('assets/emial.svg',userViewModel.userExists.value.email,email),SizedBox(height: MediaQuery.of(context).size.height*0.01),



            EditProfile_TextField('assets/Location-grey.svg','Address',address),
            SizedBox(height: MediaQuery.of(context).size.height*0.01,),
            EditProfile_TextField('assets/Call.svg',userViewModel.userExists.value.phone,phonenumber),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ),
            Container(
                height: 32,
                width: 140,
                child: CustomButton(
                    text: 'Save',
                    onPressed: () async {
                      SharedPreferences preferences =
                          await SharedPreferences.getInstance();
                      String? userId = preferences.getString("id");

                      if (userId != null) {
                        await EasyLoading.show(
                          status: 'Updating...',
                          maskType: EasyLoadingMaskType.black,
                        );

                        // print(newuser.toString());
                        print("first name field" + firstname.text);

                        editProfile_ViewModel
                            .updatebuyer(
                                userId,
                                firstname.text,
                                lastname.text,
                                email.text,
                                password.text,
                                phonenumber.text,
                                _selectedImage?.path ?? '',
                                context)
                            .then(
                              (value) async => await EasyLoading.dismiss(),
                            );
                      } else {
                        // Handle the case where userId is null (optional)
                        print('User ID is null');
                      }
                    }))
          ],
        ),
      ),
    );
  }
}
