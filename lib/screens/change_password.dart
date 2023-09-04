import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:megabank1/screens/password_reset.dart';
import 'package:megabank1/screens/splash_screen.dart';
import 'package:google_fonts/google_fonts.dart';

import 'login_sreen.dart';

class Password_Screen extends StatefulWidget {
  const Password_Screen({super.key});

  @override
  State<Password_Screen> createState() => _Password_ScreenState();
}

class _Password_ScreenState extends State<Password_Screen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return  Scaffold(
      backgroundColor: Color(0XFF012d63),
      appBar:  AppBar(
        elevation: 0.0,
        backgroundColor: Color(0XFF012d63),
        toolbarHeight: 66,
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon:Icon(Icons.arrow_back_ios),
        ),
        actions: [
          Row(
            children: [
              Text('Back'),
              SizedBox(width: MediaQuery.of(context).size.width*0.55),
              Padding(
                padding: const EdgeInsets.only(right: 15),
                child: Image.asset('assets/images/Group 3 (1).png',height: 32,width: 81,),
              ),
            ],
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                // appbar like container
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 125, 0, 62),
                ),
                custom_TextField(
                  colour: Colors.white,
                  text: 'old password',
                ),
                SizedBox(height: 12),
                custom_TextField(colour: Colors.white, text: 'new password'),
                SizedBox(height: 12),
                custom_TextField(
                  colour: Colors.white,
                  text: 'confirm new password',
                ),
                SizedBox(height: MediaQuery.of(context).size.width * 0.2),
                //custom_TextField(colour: Color(0XFFe6b014), text: 'Login'),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Splash_Screen()));
                  },
                  child: custom_button(
                    Cus_text: 'Change password',
                  ),
                ),
                //SizedBox(height: size.height * 0.26),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
