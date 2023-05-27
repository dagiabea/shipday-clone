import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailcontroller = TextEditingController();
  final _passwordcontroller = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailcontroller.text.trim(),
        password: _passwordcontroller.text.trim());
        
  }

  @override
  void dispose() {
    _emailcontroller.dispose();
    _passwordcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      padding: const EdgeInsets.only(top: 150),
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

        //emailAndPasswordField(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              TextField(
                controller: _emailcontroller,
                keyboardType: TextInputType.emailAddress,
                obscureText: false,
                decoration: InputDecoration(
                  hintText: 'Email Address',
                  filled: true,
                  fillColor: const Color(0xffEBDCFA),
                  prefixIcon:
                      const Icon(Icons.mail_outline, color: Colors.grey),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xffEBDCFA)),
                      borderRadius: BorderRadius.circular(50)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xffEBDCFA)),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _passwordcontroller,
                keyboardType: TextInputType.text,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Password',
                  filled: true,
                  fillColor: const Color(0xffEBDCFA),
                  prefixIcon:
                      const Icon(Icons.lock_outlined, color: Colors.grey),
                  border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xffEBDCFA)),
                      borderRadius: BorderRadius.circular(50)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xffEBDCFA)),
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            showSnackBar(context);
          },
          child: Container(
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
        ),

        const SizedBox(height: 40),

        signinButton(context),
      ],
    ));
  }

  void showSnackBar(BuildContext context) {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'Sorry!',
        message: 'forget password page not found',
        contentType: ContentType.failure,
      ),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  Container signinButton(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(25),
      decoration: BoxDecoration(
          color: const Color(0xff5511b0),
          borderRadius: BorderRadius.circular(50)),
      child: TextButton(
        child: const Text(
          "SIGN IN",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
        ),
        onPressed: () {
          signIn();
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => const ProfilePage()),
          // );
        },
      ),
    );
  }
}
