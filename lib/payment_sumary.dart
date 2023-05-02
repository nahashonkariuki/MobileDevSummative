import 'package:flutter/material.dart';
import 'package:mini_project_mobile_app_idea/confirm_payment.dart';

class PaymentSummaryScreen extends StatefulWidget {
  @override
  _PaymentSummaryScreenState createState() => _PaymentSummaryScreenState();
}

class _PaymentSummaryScreenState extends State<PaymentSummaryScreen> {
  // Define variables and methods as required

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Summary'),
      ),
      body: Container(
        child:Column(

          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/img.png'),
            const Text(
              'Bicu Lounge',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),
            ),
            const Text(
              'Performers Night',
              style: TextStyle(
                fontStyle: FontStyle.italic,
              ),
            ),
            const Text(
              'Fri, Feb 10, 6:00 PM CAT',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            Text("Total Cost: \$10")
          ],
        ), // Implement the layout and design based on the Figma design you provided
      ),

      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => PaymentConfirmationPage()));


                  // Add navigation logic to move to the checkout screen
                },
                child: Text(
                  'Checkout',
                  style: TextStyle(fontSize: 18.0),
                ),
              ),
              //Text(
                // Display the total cost of the booking
              //),
            ],
          ),

        ),
      ),
    );
  }
}
