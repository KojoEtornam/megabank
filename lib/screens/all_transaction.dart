import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:megabank1/screens/profile.dart';
import 'package:megabank1/screens/transaction_screen.dart';

import 'credit_transaction.dart';
import 'debit_transaction.dart';
import 'home_screen.dart';

class Transaction_Screen extends StatefulWidget {
  const Transaction_Screen({super.key});

  @override
  State<Transaction_Screen> createState() => _Transaction_ScreenState();
}

class _Transaction_ScreenState extends State<Transaction_Screen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: const Color(0XFF012d63),
          toolbarHeight: 66,
          actions: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Profile_Screen()));
                  },
                  child: Image.asset(
                    'assets/images/Union.png',
                    height: 42,
                    width: 52,
                  ),
                ),
                //SizedBox(width: MediaQuery.of(context).size.width*0.5),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      const Text('Good Morning'),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Mr John Jimoh',
                        style:
                            GoogleFonts.openSans(fontWeight: FontWeight.w800),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.3),
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
          bottom:const TabBar(
            indicatorColor: Color(0XFF012d63),
            indicatorWeight: 5,
            tabs: [
              Tab(
                text: 'All',
              ),
              Tab(
                text: 'Debit',
              ),
              Tab(
                text: 'Credit',
              )
            ],
          ),
        ),
        // bottomNavigationBar: Row(
        //   // work on the two widgets at the buttom
        //   children: [
        //     // these are containers to carry the next screen
        //     GestureDetector(
        //       onTap: () {
        //         Navigator.of(context).push(
        //             MaterialPageRoute(builder: (context) => const Home_Screen()));
        //       },
        //       child: Container(
        //         height: 72,
        //         width: 187.5,
        //         decoration: const BoxDecoration(
        //           color: Color(0XFF022e64),
        //         ),
        //         child: Column(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           crossAxisAlignment: CrossAxisAlignment.center,
        //           children: const [
        //             Icon(
        //               Icons.home,
        //               size: 32,
        //               color: Color(0XFFe6b014),
        //             ),
        //             SizedBox(
        //               height: 4,
        //             ),
        //             Text(
        //               'Home',
        //               style: TextStyle(
        //                 color: Color(0XFFe6b014),
        //               ),
        //             )
        //           ],
        //         ),
        //       ),
        //     ),
        //     GestureDetector(
        //       onTap: () {
        //         Navigator.of(context).push(MaterialPageRoute(
        //             builder: (context) => const Transaction_Screen()));
        //       },
        //       child: Container(
        //         height: 72,
        //         width: 187.5,
        //         decoration: const BoxDecoration(
        //           color: Colors.white,
        //         ),
        //         child: Column(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           crossAxisAlignment: CrossAxisAlignment.center,
        //           children: const [
        //              Icon(
        //               Icons.payment_sharp,
        //               size: 32,
        //               color: Color(0XFFe6b014),
        //             ),
        //             SizedBox(
        //               height: 4,
        //             ),
        //             Text(
        //               'Transaction',
        //               style: TextStyle(
        //                 color: Color(0XFFe6b014),
        //               ),
        //             )
        //           ],
        //         ),
        //       ),
        //     ),
        //   ],
        // ),hjj
        body: const SafeArea(
          child: TabBarView(
            children: [
              All_Transaction(),
              Debit_Transaction(),
              Credit_Transaction(),
            ],
          ),
        ),
      ),
    );
  }
}
