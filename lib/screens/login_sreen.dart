import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:megabank1/screens/home_screen.dart';
import 'package:megabank1/screens/password_reset.dart';
import 'package:megabank1/screens/splash_screen.dart';
class Login_Screen extends StatelessWidget {
  const Login_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0XFF012d63),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 125, 0, 62),
                  child: Center(
                      child: Image.asset(
                    'assets/images/Group 3 (1).png',
                  )),
                ),
                 custom_TextField(colour: Colors.white, text: 'email', ),
                SizedBox(height: 12),
                custom_TextField(colour: Colors.white, text: 'password'),
                SizedBox(height: MediaQuery.of(context).size.width * 0.2),
                //custom_TextField(colour: Color(0XFFe6b014), text: 'Login'),
                GestureDetector(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Splash_Screen()));
                  },
                    child: custom_button(Cus_text: 'Login',)),
                SizedBox(height: size.height * 0.26),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => Password_reset()));
              },
              child: Text('forget password?', style: GoogleFonts.openSans(
                color: Colors.white
              ),),
            )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class custom_button extends StatelessWidget {
   custom_button({
    required this.Cus_text,
    super.key,
  });
String Cus_text;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height:56,
      decoration:  BoxDecoration(
        boxShadow: const [
          BoxShadow(
            blurRadius: 45,
            spreadRadius: 0,
            color: Color.fromRGBO(120, 37, 139, 0.25),
            offset: Offset(0, 25),
          )
        ],
        borderRadius: BorderRadius.circular(20),
        color: const Color(0XFFe6b014),
      ),
      child:  Text(
        Cus_text,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}

class custom_TextField extends StatelessWidget {

   custom_TextField({super.key,
   required this.colour, required this.text
  });
  Color colour;
  String  text;
  @override
  Widget build(BuildContext context) {
    return TextField(
     decoration: InputDecoration(
       border: OutlineInputBorder(
         borderRadius: BorderRadius.circular(16.0),
       ),
       contentPadding: const EdgeInsets.fromLTRB(20, 20, 0, 20),
       filled: true,
       hintText: text,
       fillColor: colour,
     ),
              );
  }
}
