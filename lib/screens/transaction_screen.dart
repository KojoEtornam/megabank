import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget.dart';

class All_Transaction extends StatefulWidget {
  const All_Transaction({super.key});

  @override
  State<All_Transaction> createState() => _All_TransactionState();
}

class _All_TransactionState extends State<All_Transaction> {

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
    return  Scaffold(
      body: SizedBox(
height: 350,
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
                                          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 12),
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
                                        const Text('Transaction Date'),
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
                                        const Text('Transaction Direction'),
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
                                        const Text('Transaction Naration'),
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
    );
  }
}
