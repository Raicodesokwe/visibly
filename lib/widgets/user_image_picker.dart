import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:visibly/utils/constants.dart';

class UserImagePicker extends StatefulWidget {
  final void Function(File pickedImage) onPickImage;
  const UserImagePicker({super.key,
  required this.onPickImage
  });

  @override
  State<UserImagePicker> createState() => _UserImagePickerState();
}

class _UserImagePickerState extends State<UserImagePicker> {
  File? _pickedImageFile;
  void _pickImage()async{
    final pickedImage=await ImagePicker().pickImage(source: ImageSource.camera,imageQuality: 50,maxWidth: 150);
    if(pickedImage==null)return;   
 setState(() {
      _pickedImageFile=File(pickedImage.path);
    });
    widget.onPickImage(_pickedImageFile!);
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
    shape: BoxShape.circle, // Ensures the border is circular
    border: Border.all(
      color: AppColors.appGreen,// Color of the border
      width: 3.0, // Border width
    ),
  ),
          child: CircleAvatar(
            radius: 40,
            backgroundColor: Colors.grey,
            foregroundImage: _pickedImageFile!=null?FileImage(_pickedImageFile!):null,
          ),
        ),
        TextButton.icon(onPressed: _pickImage, icon:const Icon(Icons.image,color: AppColors.appGreen,), label:const Text(
          'Add Image',
          style: TextStyle(color: AppColors.appGreen),
        ))
      ],
    );
  }
}