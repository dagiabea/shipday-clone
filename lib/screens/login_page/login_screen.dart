import 'package:flutter/material.dart';
import 'package:tr1/screens/login_page/widgets/text_field_custom.dart';
import 'package:tr1/screens/welcome_page/profile_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});


 @override
 Widget build(BuildContext context) {
    return Scaffold(
       body: ListView(
         padding: const EdgeInsets.only(top:150),
         physics: const BouncingScrollPhysics(),
         children: [
            //_Titulo(),

            Positioned(
              top: 80,
              left: MediaQuery.of(context).size.width * 0.38,
              child: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  
                  borderRadius: BorderRadius.circular(50),
                  
                ),
                child: Image.asset(
                    'assets/logo/shipday.png',
                    height: 400,
                    width: 400,
                ), 
              ),
            ),
            

            const SizedBox(height: 100),

            emailAndPasswordField(),

            Container(
              padding: const EdgeInsets.only(right: 25, top: 20),
              alignment: Alignment.centerRight,
              child: const Text(
                    "Forgot Password?", 
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                ),
              ),  
            ),

            const SizedBox(height: 40),

            signinButton(context),
         ],
       )
     );
  }

 Padding emailAndPasswordField() {
   return Padding(
            padding: const EdgeInsets.symmetric(horizontal:20.0),
            child: Column(
              children: const [

                TextFieldCustom(icono: Icons.mail_outline, type: TextInputType.emailAddress,texto: 'Email Address' ),
                SizedBox(height: 20),
                TextFieldCustom(icono: Icons.lock_outlined, type: TextInputType.text, pass: true, texto: 'Password'),
              ],
            ),
          );
 }

 Container signinButton(BuildContext context) {
   return Container(
            margin: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              color: const Color(0xff5511b0),
              borderRadius: BorderRadius.circular(50)
            ),
            child: TextButton(
              child: const Text(
                        "SIGN IN", 
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),), 
              onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ProfilePage()),
                );
              },
            ),
          );
 }
}



