import 'package:day_17_with_flutter/signup.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 70, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "kuv16.",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Text(
                    "Sign in",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Please fill the credentials",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black38,
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  TextField(
                    controller: _emailController,
                    cursorColor: Color.fromARGB(255, 0, 0, 0),
                    style: TextStyle(color: Colors.black45),
                    decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle:
                            TextStyle(color: Colors.black54, fontSize: 12),
                        prefixIcon: Icon(
                          Icons.alternate_email,
                          size: 19,
                        ),
                        prefixIconColor: MaterialStateColor.resolveWith(
                            (states) => states.contains(MaterialState.focused)
                                ? Colors.black
                                : Colors.grey),
                        filled: true,
                        fillColor: Color.fromARGB(255, 247, 225, 225),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: _passwordController,
                    cursorColor: Color.fromARGB(255, 0, 0, 0),
                    style: TextStyle(color: Colors.black45),
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Password",
                        hintStyle:
                            TextStyle(color: Colors.black54, fontSize: 12),
                        prefixIcon: Icon(
                          Icons.key,
                          size: 19,
                        ),
                        prefixIconColor: MaterialStateColor.resolveWith(
                            (states) => states.contains(MaterialState.focused)
                                ? Colors.black
                                : Colors.grey),
                        filled: true,
                        fillColor: Color.fromARGB(255, 247, 225, 225),
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  SizedBox(
                    height: 43,
                  ),
                  GestureDetector(
                    onTap: signIn,
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16,vertical: 18),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 255, 92, 92),
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Center(child: Text("Sing in",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),
                    ),
                  ),
                  
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      textAlign: TextAlign.center,
                      "Don't have an account?",
                      style: TextStyle(
                        color: Colors.black38,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUp(),
                          ),
                        );
                      },
                      child: Text(
                        "Sign up",
                        style:
                            TextStyle(color: Color.fromARGB(255, 255, 92, 92)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ClipPath(
              clipper: CustomClipPath(),
              child: Container(
                color: Color.fromARGB(255, 251, 219, 219),
                height: 130,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomClipPath extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path0 = Path();
    //path0.moveTo(size.width*0.0010000,size.height*0.5412000);
    //path0.moveTo(0,size.height*0.4276000);
    path0.lineTo(size.width * 0.0025000, size.height * 0.9960000);
    path0.lineTo(size.width * 0.9975000, size.height * 0.9980000);
    path0.lineTo(size.width, size.height * 0.4992000);
    path0.quadraticBezierTo(size.width * 0.9388750, size.height * 0.5099000,
        size.width * 0.8355000, size.height * 0.6452000);
    path0.cubicTo(
        size.width * 0.7673750,
        size.height * 0.7406000,
        size.width * 0.6853750,
        size.height * 0.8134000,
        size.width * 0.6070000,
        size.height * 0.8156000);
    path0.cubicTo(
        size.width * 0.2447500,
        size.height * 0.7938000,
        size.width * 0.2398125,
        size.height * 0.3570000,
        0,
        size.height * 0.4276000);
    path0.close();

    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
