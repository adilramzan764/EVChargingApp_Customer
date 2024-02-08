import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import '../Utils/colors.dart';



class ImagePickerHandler {
  final ImagePicker _picker = ImagePicker();
  final BuildContext context;
  final void Function(File?) onImagePicked;

  ImagePickerHandler(this.context, this.onImagePicked);

  Future<void> _getImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source);

    if (pickedFile != null) {
      onImagePicked(File(pickedFile.path));
    }
  }
  Future<void> _getImageFromGallery() async {
    FilePickerResult? imageResult =
    await FilePicker.platform.pickFiles(type: FileType.image);

    if (imageResult != null) {
      onImagePicked(File(imageResult.files.first.path!));
    }
  }

  Future<void> showPickerDialog() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(height: 10),
              InkWell(
                onTap: () {
                  _getImage(ImageSource.camera);
                  Navigator.pop(context); // Close the dialog
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 1,
                      )
                    ],
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/Camera.svg',
                        color: ColorValues.green,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Take a Photo',
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 15),
              InkWell(
                onTap: () {
                  _getImageFromGallery();
                  // _getImage(ImageSource.gallery);
                  Navigator.pop(context); // Close the dialog
                },
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.06,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 1,
                      )
                    ],
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/gallery.svg',
                        color: ColorValues.green,
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Choose from Gallery',
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }
}