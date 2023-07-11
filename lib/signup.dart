import 'package:day_17_with_flutter/auth.dart';
import 'package:day_17_with_flutter/signin.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool error = false;
  Future signUp() async {
    if (passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const Auth(),
        ),
      );
    }
  }

  bool passwordConfirmed() {
    if (_passwordController.text.trim() ==
        _confirmPasswordController.text.trim()) {
      return true;
    } else {
      setState(() {
        error = true;
        _passwordController.text = "";
        _confirmPasswordController.text = "";
      });

      return false;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Stack(
              children: [
                ClipPath(
                  clipper: CustomClipPath(),
                  child: Container(
                    color: Color.fromARGB(255, 251, 219, 219),
                    height: 130,
                  ),
                ),
                Positioned(
                  top: 45,
                  right: 30,
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                    ),
                  ),
                ),
                Positioned(
                  top: 45,
                  left: 20,
                  child: Text(
                    "kuv16.",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  TextField(
                    controller: _emailController,
                    cursorColor: Color.fromARGB(255, 0, 0, 0),
                    style: TextStyle(color: Colors.black45),
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: "Email",
                        hintStyle:
                            TextStyle(color: Colors.black54, fontSize: 12),
                        prefixIcon: Icon(
                          Icons.alternate_email_rounded,
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
                    height: 20,
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
                    height: 20,
                  ),
                  TextField(
                    controller: _confirmPasswordController,
                    cursorColor: Color.fromARGB(255, 0, 0, 0),
                    style: TextStyle(color: Colors.black45),
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Confirm Password",
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
                    height: 15,
                  ),
                  Container(
                      alignment: Alignment.centerLeft,
                      padding: EdgeInsets.only(left: 10),
                      child: Text(
                        error ? "Passwords are not the same..." : "",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      )),
                  SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: signUp,
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 16, vertical: 18),
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 255, 92, 92),
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                          child: Text(
                        "Register",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      )),
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      textAlign: TextAlign.center,
                      "Already have an account?",
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
                        Navigator.pop(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignIn()));
                      },
                      child: Text(
                        "Sign in",
                        style:
                            TextStyle(color: Color.fromARGB(255, 255, 92, 92)),
                      ),
                    ),
                  ),
                ],
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
    double w = size.width;
    double h = size.height;

    final path = Path();

    Path path0 = Path();
    path0.moveTo(0, 0);
    path0.lineTo(0, size.height * 0.0440000);
    path0.quadraticBezierTo(size.width * 0.3328125, size.height * 0.1555000,
        size.width * 0.6637500, size.height * 0.6400000);
    path0.quadraticBezierTo(size.width * 0.8596875, size.height * 0.8865000,
        size.width, size.height * 0.6340000);
    path0.lineTo(size.width, size.height * 0.0020000);
    path0.lineTo(0, 0);
    path0.close();

    return path0;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
