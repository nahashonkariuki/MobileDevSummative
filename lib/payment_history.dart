import 'package:flutter/material.dart';


class PaymentHistory extends StatefulWidget {
  const PaymentHistory({Key? key}) : super(key: key);

  @override
  _PaymentHistoryState createState() => _PaymentHistoryState();
}

class _PaymentHistoryState extends State<PaymentHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment History'),
      ),
      body: ListView.builder(
        itemCount: paymentList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(paymentList[index].description),
            subtitle: Text(paymentList[index].date),
            trailing: Text(paymentList[index].amount),
          );
        },
      ),
    );
  }
}

class Payment {
  final String description;
  final String date;
  final String amount;

  Payment({required this.description, required this.date, required this.amount});
}

List<Payment> paymentList = [
  Payment(description: 'Payment 1', date: '2023-04-28', amount: '\$10.00'),
  Payment(description: 'Payment 2', date: '2023-04-22', amount: '\$15.00'),
  Payment(description: 'Payment 3', date: '2023-04-15', amount: '\$20.00'),
  // Add more payments here if needed
];
