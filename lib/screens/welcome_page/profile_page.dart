import 'package:flutter/material.dart';
import 'package:tr1/screens/login_page/login_screen.dart';
import 'package:tr1/screens/order/order_list/order_list.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu_outlined),
        ),),
        bottomSheet: SizedBox(
          width: MediaQuery.of(context).size.width, 
          child: goonlineButton(context)
        ),
        body: Container(
          margin: const EdgeInsets.only(bottom: 40),
          child: Center(
            child: ListView(
                //padding: const EdgeInsets.only(top:150),
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                children: const [
          
                  Center(
                    child: Text(
                      "Welcome @User Name",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: Text(
                      "Ready to head out?",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 18,
                          color: Colors.black),
                    ),
                  ),
                  SizedBox(
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
                        'https://t4.ftcdn.net/jpg/03/64/21/11/360_F_364211147_1qgLVxv1Tcq0Ohz3FawUfrtONzz8nq3e.jpg',
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
