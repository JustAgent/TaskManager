import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_manager/constants/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_validator/email_validator.dart';

class ResetPage extends StatefulWidget {
  const ResetPage({Key? key}) : super(key: key);

  @override
  State<ResetPage> createState() => _ResetPageState();
}

class _ResetPageState extends State<ResetPage> {
  final emailController = TextEditingController();



  Future resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: emailController.text.trim());
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }



  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          iconTheme: IconThemeData(color: Color(appBarTextColor)),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
          },
          ),
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
                    'Forgot password?',
                    style: GoogleFonts.nunito(
                      fontWeight: FontWeight.w900,
                      fontSize: 24,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(35, 10, 35, 40),
                  child: Text(
                    'Receive an email to reset your password',
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
                    Container(
                      margin: const EdgeInsets.only(top: 40),
                      child: ElevatedButton(
                        onPressed: () {
                          resetPassword();
                        },
                        style: ElevatedButton.styleFrom(
                            primary: Color(btnBgMain),
                            padding: const EdgeInsets.symmetric(horizontal: 96, vertical: 26),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)
                            )
                        ),
                        child: Text(
                            'Send email',
                            style: GoogleFonts.nunito(
                                fontWeight: FontWeight.w900,
                                color: Color(btnColor),
                                fontSize: 20)
                        ),
                      ),
                    ),
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

