

class CustomerStaticData {
  String customerID;
  String customerName;
  String gender;
  String title;

  CustomerStaticData({
    required this.customerID,
    required this.customerName,
    required this.gender,
    required this.title,
  });
}

class CustomerTransactionData {
  String customerID;
  String transactionDate;
  int transactionAmount;
  String transactionDirection;
  String transactionNarration;

  CustomerTransactionData({
    required this.customerID,
    required this.transactionDate,
    required this.transactionAmount,
    required this.transactionDirection,
    required this.transactionNarration,
  });
}
