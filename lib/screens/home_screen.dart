import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:megabank1/screens/profile.dart';

import '../widget.dart';
import 'all_transaction.dart';

const activebottomcolor = Color(0XFF022e64);
const inactivebottomcolor = Colors.white;

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  //Map<String, dynamic> data = {}; // Adjust data type
  List<CustomerTransactionData> customerTransactionDataList = [];

  Future<void> readData(BuildContext context) async {
    try {
      String jsonData = await DefaultAssetBundle.of(context)
          .loadString("json/customer_data.json");
      Map<String, dynamic> jsonMap = json.decode(jsonData);

      List<Map<String, dynamic>> transactions =
          List<Map<String, dynamic>>.from(jsonMap['customerTransactionData']);
      customerTransactionDataList = transactions
          .map((transaction) => CustomerTransactionData(
                customerID: transaction['customerID'],
                transactionDate: transaction['transactionDate'],
                transactionAmount: transaction['transactionAmount'],
                transactionDirection: transaction['transactionDirection'],
                transactionNarration: transaction['transactionNarration'],
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
    readData(context);
  }

  @override
  Widget build(BuildContext context) {
    // readData(context);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
          //medabank 2nd appbar
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
          ),
          // bottomSheet: Row(
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
          //             Icon(
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
          // ),
          //backgroundColor: Color(0XFF012d63),
          body: SafeArea(
            child: Column(
              children: [
                // applike Container
                Container(
                  height: 198,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('assets/images/Main Card.png'),
                    fit: BoxFit.fill,
                  )),
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(16, 50, 16, 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Account Balance',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        const Text(
                          'GHC 10,000.00',
                          style: TextStyle(
                              fontSize: 36,
                              fontWeight: FontWeight.w700,
                              color: Colors.white),
                        ),
                        SizedBox(height: 5),
                        Row(
                          children: const [
                            Text(
                              'Checking Account',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              width: 70,
                            ),
                            Text(
                              '8754311431137098707',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14,
                                  color: Colors.white),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 42,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0XFFf5f7fa),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Recent Transaction',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'See All',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
                ),
                //Divider(thickness: 1,),
                Expanded(
                  child: ListView.builder(
                      itemCount: customerTransactionDataList.length,
                      itemBuilder: (context, index) {
                        //final transactions = getTransactions[index];
                        CustomerTransactionData transaction =
                            customerTransactionDataList[index];

                        return Container(
                            height: 88,
                            width: double.infinity,
                            child: Column(
                              children: [
                                ListTile(
                                  onTap: () {
                                    showModalBottomSheet<void>(
                                      context: context,
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.vertical(
                                        top: Radius.circular(20),
                                      )),
                                      builder: (BuildContext context) {
                                        return Container(
                                          padding: const EdgeInsets.all(20.0),
                                          height: 500,
                                          decoration: const BoxDecoration(
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20),
                                                topLeft: Radius.circular(20)),
                                          ),
                                          child: Column(
                                            children: <Widget>[
                                              const Text(
                                                  'Transactions Details'),
                                              const SizedBox(
                                                height: 30,
                                              ),
                                              Row(
                                                children: [
                                                  const Text(
                                                      'Balance Before Transaction'),
                                                  Expanded(child: Container()),
                                                  const Text(
                                                    'GHC 0.00',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 12),
                                                  )
                                                ],
                                              ),
                                              const SizedBox(height: 5),
                                              Row(
                                                children: [
                                                  const Text(
                                                      'Balance After Transaction'),
                                                  Expanded(child: Container()),
                                                  const Text(
                                                    '10,000.00',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 12),
                                                  )
                                                ],
                                              ),
                                              const Divider(
                                                thickness: 1,
                                              ),
                                              const SizedBox(
                                                height: 15,
                                              ),
                                              Row(
                                                children: [
                                                  const Text(
                                                      'Transaction Date'),
                                                  Expanded(child: Container()),
                                                  Text(
                                                    transaction.transactionDate,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 12),
                                                  )
                                                ],
                                              ),
                                              const SizedBox(height: 5),
                                              Row(
                                                children: [
                                                  const Text(
                                                      'Transaction Direction'),
                                                  Expanded(child: Container()),
                                                  Text(
                                                    transaction
                                                        .transactionDirection,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 12),
                                                  )
                                                ],
                                              ),
                                              const SizedBox(height: 5),
                                              Row(
                                                children: [
                                                  const Text(
                                                      'Transaction Narration'),
                                                  Expanded(child: Container()),
                                                  Text(
                                                    transaction
                                                        .transactionNarration,
                                                    style: const TextStyle(
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        fontSize: 12),
                                                  )
                                                ],
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                    );
                                  },
                                  leading:
                                      Image.asset('assets/images/icon1.png'),
                                  title: Row(
                                    children: [
                                      Text(
                                          'GHC ${transaction.transactionAmount} '),
                                      Container(
                                        height: 22,
                                        width: 42,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: const Color(0XFF78C8E1)
                                              .withOpacity(0.6),
                                        ),
                                        child: Center(
                                            child: Text(transaction
                                                .transactionDirection)),
                                      )
                                    ],
                                  ),
                                  subtitle:
                                      Text(transaction.transactionNarration),
                                  trailing: Text(transaction.transactionDate),
                                ),
                                const Divider(
                                  thickness: 1,
                                )
                              ],
                            ));
                      }),
                )
              ],
            ),
          )),
    );
  }
}
