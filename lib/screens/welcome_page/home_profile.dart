import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:tr1/screens/order/order_list/order_list.dart';
import 'package:tr1/screens/profile_page/profile_page.dart';

class HomeProfile extends StatefulWidget {
  const HomeProfile({super.key});

  @override
  State<HomeProfile> createState() => _HomeProfileState();
}

class _HomeProfileState extends State<HomeProfile> {
  final user = FirebaseAuth.instance.currentUser!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.black),
          backgroundColor: Colors.white,
          elevation: 1,
          leading: IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const EditProfilePage()),
              );
              
              
              //user.updatePhoneNumber(251934725011);
              // user.updateDisplayName("ፋጤ");
              // user.updatePhotoURL(
              //     'https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg');
            },
            icon: const Icon(Icons.menu_outlined),
          ),
        ),
        bottomSheet: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: goonlineButton(context)),
        body: Container(
          margin: const EdgeInsets.only(bottom: 40),
          child: Center(
            child: ListView(
                //padding: const EdgeInsets.only(top:150),
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                children: [
                  Center(
                    child: Text(
                      "Welcome ${user.displayName}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Center(
                    child: Text(
                      "Ready to head out?",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 18,
                          color: Colors.black),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CircleAvatar(
                    radius:
                        70, // Change this radius for the width of the circular border
                    backgroundColor: Colors.white,
                    child: CircleAvatar(
                      radius:
                          68, // This radius is the radius of the picture in the circle avatar itself.
                      backgroundImage: NetworkImage(
                        "${user.photoURL}",
                      ),
                    ),
                  )
                ]),
          ),
        ));
  }

  Container goonlineButton(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(25),
      decoration: BoxDecoration(
          color: const Color(0xff5511b0),
          borderRadius: BorderRadius.circular(50)),
      child: TextButton(
        child: const Text(
          "Go Online",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const OrderList()),
          );
        },
      ),
    );
  }
}
