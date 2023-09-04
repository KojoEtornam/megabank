import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:megabank1/screens/change_password.dart';
import 'package:megabank1/screens/change_password.dart';

import '../widget.dart';

class Profile_Screen extends StatefulWidget {
  const Profile_Screen({super.key});

  @override
  State<Profile_Screen> createState() => _Profile_ScreenState();
}

class _Profile_ScreenState extends State<Profile_Screen> {

  List<CustomerStaticData> CustomerStaticDataList = [];

  Future<void> readCustomerData(BuildContext context) async {
    try {
      String jsonData = await DefaultAssetBundle.of(context)
          .loadString("assets/json/customer_data.json");
      Map<String, dynamic> jsonMap = json.decode(jsonData);

      List<Map<String, dynamic>> transactions =
      List<Map<String, dynamic>>.from(jsonMap['customerTransactionData']);
      CustomerStaticDataList = transactions
          .map((transaction) => CustomerStaticData(
        customerID: transaction['customerID'],
        customerName: transaction['customerName'],
        gender: transaction['gender'],
        title: transaction['title'],
      ))
          .toList();

      setState(() {});
    } catch (error) {
      print('-----------------------------------------------');
      print("Error loading data: $error");
      print('-----------------------------------------------');
    }
  }

  @override
  void initState() {
    super.initState();
    readCustomerData(context);
  }

  @override
  Widget build(BuildContext context) {
    // error here why
    // Assuming you want to display data for the first customer in the list
    CustomerStaticData customerData = CustomerStaticData(
      customerID: '23399922',
      customerName: 'John Jimoh',
      gender: 'M',
      title: 'Mr',
    );



    return SafeArea(
      child: Scaffold(
        //megaBank main appbar
        appBar: AppBar(
          backgroundColor: const Color(0XFF012d63),
          toolbarHeight: 66,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios),
          ),
          actions: [
            Row(
              children: [
                const Text('Back'),
                SizedBox(width: MediaQuery.of(context).size.width * 0.55),
                Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: Image.asset(
                    'assets/images/Group 3 (1).png',
                    height: 32,
                    width: 81,
                  ),
                ),
              ],
            )
          ],
        ),
        //backgroundColor: Color(0XFF012d63),
        body: Column(

          children: [
            Container(
                height: 156,
                width: 392,
                color: const Color(0XFFfdf8ec),
                child: Row(
                  children: [
                    Container(
                      height: 156,
                      width: 193,
                      child: Image.asset(
                        'assets/images/Union.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
    Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(

            children: [
              Column(
                children: [
                  Text(
                    'First Name',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: Color(0XFF022E64)),
                  ),
                  Text(
                    customerData.customerName,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      color: Color(0XFF022E64)),
                  ),
                  SizedBox(height: 20,),
                  Text(
                    'GENDER',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: Color(0XFF022E64)),
                  ),
                  Text(
                    customerData.gender,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      color: Color(0XFF022E64)),
                  ),


                ],
              ),
              SizedBox(width: 30,),
              Column(
                children:  [
                  Text(
                    'Other Names',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: Color(0XFF022E64)),
                  ),
                  Text(
                    customerData.customerName,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      color: Color(0XFF022E64)),
                  ),
                  SizedBox(height: 20,),
                  Text(
                    'TITLE',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: Color(0XFF022E64)),
                  ),
                  Text(
                    customerData.title,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      color: Color(0XFF022E64)),
                  ),

                ],
              ),
            ],
          ),


          const Text(
            'ID',
            style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 12,
                color: Color(0XFF022E64)),
          ),
          const Text(
            '23399922',
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 12,
                color: Color(0XFF022E64)),
          ),
        ],

    )
                  ],
                )
                ),
            Container(
              decoration: const BoxDecoration(
                color: Color(0XFFf5f7fa),
              ),
              height: 48,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Account Setting',
                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Password_Screen()));
              },
              child: Card(
                shadowColor: null,
                elevation: 0.0,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 18, 16, 18),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.password,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        width: 16,
                      ),
                      Text(
                        'Change Account Password',
                        style:
                            GoogleFonts.openSans(fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              shadowColor: null,
              elevation: 0.0,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 18, 16, 18),
                child: Row(
                  children: [
                    const Icon(
                      Icons.logout_rounded,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      'Logout',
                      style: GoogleFonts.openSans(fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Color(0XFFf5f7fa),
              ),
              height: 48,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'About',
                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Card(
              shadowColor: null,
              elevation: 0.0,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 18, 16, 18),
                child: Row(
                  children: [
                    //Icon(Icons.password,color: Colors.black,),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      'Terms And Condition',
                      style: GoogleFonts.openSans(fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
            Card(
              shadowColor: null,
              elevation: 0.0,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 18, 16, 18),
                child: Row(
                  children: [
                    //Icon(Icons.logout_rounded,color: Colors.black,),
                    const SizedBox(
                      width: 16,
                    ),
                    Text(
                      'Privacy Policy',
                      style: GoogleFonts.openSans(fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


