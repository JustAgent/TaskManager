import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_manager/constants/colors.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Password',
                              hintStyle: GoogleFonts.nunito(
                                fontSize: 16,
                                fontWeight:  FontWeight.w700,
                              )
                          ),
                        )
                    ),
                    TextFieldContainer(
                        child: TextField(
                          obscureText: true,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Repeat Password',
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
                        onPressed: () {},
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
      margin: EdgeInsets.symmetric(vertical: 10),
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
