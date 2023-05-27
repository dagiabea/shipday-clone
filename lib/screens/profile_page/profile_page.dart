import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({Key? key}) : super(key: key);

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final user = FirebaseAuth.instance.currentUser!;
  final _namecontroller = TextEditingController();
  final _emailcontroller = TextEditingController();
  final _phonecontroller = TextEditingController();
  final _idcontroller = TextEditingController();
  final _platecontroller = TextEditingController();
  final _citycontroller = TextEditingController();

  @override
  void initState() {
    _namecontroller.text = user.displayName!;
    _emailcontroller.text = user.email!;
    //_phonecontroller.text = user.phoneNumber!;
    super.initState();
  }

  File? _image;
  // This is the image picker
  final _picker = ImagePicker();
  // Implementing the image picker
  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //final controller = Get.put(ProfileController());
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "profile",
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              // -- IMAGE with ICON
              GestureDetector(
                onTap: () {
                  _openImagePicker();
                  //_getFromGallery();
                  //File picture = await ImagePicker.pickImage(source: ImageSource.gallery);
                  //Image.file(picture, width: 500, height: 500),
                },
                child: Stack(
                  children: [
                    SizedBox(
                        width: 120,
                        height: 120,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: _image != null
                              ? Image.file(_image!, fit: BoxFit.cover)
                              : Image.asset(
                                  'assets/logo/ava.png',
                                ),
                        )),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        width: 35,
                        height: 35,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white),
                        child: const Icon(Icons.camera,
                            color: Colors.black, size: 20),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 50),

              // -- Form Fields
              Form(
                child: Column(
                  children: [
                    TextFormField(
                      controller: _namecontroller,
                      //initialValue: user.displayName,
                      readOnly: true,
                      decoration: const InputDecoration(
                          label: Text("Name"),
                          prefixIcon: Icon(Icons.person_2_outlined)),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      readOnly: true,
                      controller: _emailcontroller,
                      decoration: const InputDecoration(
                          label: Text("Email"),
                          prefixIcon: Icon(Icons.email_outlined)),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _phonecontroller,
                      decoration: const InputDecoration(
                          label: Text("Phone"),
                          prefixIcon: Icon(Icons.phone_outlined)),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _idcontroller,
                      //initialValue: user.displayName,
                      decoration:  InputDecoration(
                          label: const Text("Personal ID"),
                          prefixIcon: Image.asset('assets/logo/idcard.png',
                          width: 1,)),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _platecontroller,
                      //initialValue: user.displayName,
                      readOnly: true,
                      decoration: const InputDecoration(
                          label: Text("Plate"),
                          prefixIcon: Icon(Icons.numbers_outlined)),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      controller: _citycontroller,
                      //initialValue: user.displayName,
                      readOnly: true,
                      decoration: const InputDecoration(
                          label: Text("City"),
                          prefixIcon: Icon(Icons.location_on_outlined)),
                    ),
                    const SizedBox(height: 30),
                    // -- Form Submit Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff5511b0),
                            side: BorderSide.none,
                            shape: const StadiumBorder()),
                        child: const Text("Save",
                            style: TextStyle(color: Colors.white)),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
