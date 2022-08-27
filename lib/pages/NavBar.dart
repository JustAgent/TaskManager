import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_manager/constants/colors.dart';

class NavBar extends StatefulWidget {
  NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  final user = FirebaseAuth.instance.currentUser;

  String? email = 'example@gmail.com';

  void logout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  void initState() {
    if (user != null) {
      email = user?.email;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(bgMain),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Color(btnBgMain),
              ),
          currentAccountPicture: CircleAvatar(
            child: ClipOval(
              child: Image.network('https://oflutter.com/wp-content/uploads/2021/02/girl-profile.png',
              width: 90,
              height: 90,
              fit: BoxFit.cover,
              ),
            ),
          ),
            accountName: Text('UserName',
              style: GoogleFonts.nunito(
                fontWeight: FontWeight.w900,
                color: Color(bgMain),
                fontSize: 18,
              ),
            ),
            accountEmail: Text(email!,
              style: GoogleFonts.nunito(
                fontWeight: FontWeight.w700,
                color: Color(bgMain),
                fontSize: 16,
              ),)),
          ListTile(
            leading: Icon(Icons.logout_outlined),
            title: Text('Log out',
              style: GoogleFonts.nunito(
                fontWeight: FontWeight.w700,
                color: Color(appBarTextColor),
                fontSize: 16,
              ),),
            onTap: () {
              logout();
            },
          )
        ],
      ),
    );
  }
}

