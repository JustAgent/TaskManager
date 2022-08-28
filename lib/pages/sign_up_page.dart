import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';
import 'package:task_manager/database/crud.dart';
import 'package:task_manager/model/local_storage.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key, required this.onClickedSignUp}) : super(key: key);
  final VoidCallback onClickedSignUp;

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();


  Future signUp() async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
          );
      const Request().createUser(emailController.text.trim(), usernameController.text.trim());
      userEmail = emailController.text.trim();
    } on FirebaseAuthException catch (e) {
      print(e);
    }
    }


  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color(bgMain),
        title: Text(
        'NOTELY',
        style: GoogleFonts.titanOne(
          color: Color(appBarTextColor),
          fontSize: 25,
        ),
        )
      ),
      backgroundColor: Color(bgMain),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Text(
                    'Create a free account',
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w900,
                      fontSize: 24,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(35, 10, 35, 40),
                  child: Text(
                    'Join Notely for free. Create and share unlimited notes with your friends.',
                    maxLines: 2,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  ),
                ),
                Column(
                  children: [
                    TextFieldContainer(
                        child: TextField(
                          controller: usernameController,
                          obscureText: true,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Username',
                              hintStyle: GoogleFonts.nunito(
                                fontSize: 16,
                                fontWeight:  FontWeight.w700,
                              )
                          ),
                        )
                    ),
                    TextFieldContainer(
                        child: TextFormField(
                          controller: emailController,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          validator: (email) =>
                          email != null && !EmailValidator.validate(email)
                          ? 'Enter a valid email'
                          : null,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Email Address',
                              hintStyle: GoogleFonts.nunito(
                                fontSize: 16,
                                fontWeight:  FontWeight.w700,
                              )
                          ),
                        )
                    ),
                    TextFieldContainer(
                        child: Stack(
                          children: [
                            TextFormField(
                            controller: passwordController,
                            obscureText: true,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (password) =>
                            password != null && password.length < 6
                                ? 'Enter min 6 characters'
                                : null,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Password',
                              hintStyle: GoogleFonts.nunito(
                                fontSize: 16,
                                fontWeight:  FontWeight.w700,
                              )
                          ),
                            ),
                            Container(
                              padding: const EdgeInsets.fromLTRB(260, 12, 12, 0),
                              child: const Icon(
                                Icons.remove_red_eye,
                              ),
                            )
                          ]
                        )
                    ),

                    Container(
                      margin: const EdgeInsets.only(top: 40),
                      child: ElevatedButton(
                        onPressed: () {
                          signUp();
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Color(btnBgMain),
                            padding: const EdgeInsets.symmetric(horizontal: 96, vertical: 26),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)
                            )
                        ),
                        child: Text(
                            'Create Account',
                            style: GoogleFonts.nunito(
                                fontWeight: FontWeight.w900,
                                color: Color(btnColor),
                                fontSize: 20)
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 5, 0, 10),
                      child: TextButton(
                        onPressed: () {
                          widget.onClickedSignUp();
                          },
                        child: Text(
                          'Already have an account?',
                          style: GoogleFonts.nunito(
                            fontWeight: FontWeight.w800,
                            fontSize: 16,
                            color: Color(btnBgMain),
                          ),
                        ),
                      ),
                    )
                  ],
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TextFieldContainer extends StatelessWidget {
  final Widget child;
  const TextFieldContainer({Key? key, required this.child}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: Color(noteMain),
        borderRadius: BorderRadius.circular(12)
      ),
      child: child,
    );
  }
}

//TODO
//COLOR SELECTOR
//FIX EYE POSITION ON DIF DEVICES
//MAKE EYE LOGIC
//LOGIN AND FIREBASE USAGE
//CHANGE LOCAL STORAGE TO FIREBASE
//CELEBRATE

