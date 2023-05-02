import 'package:flutter/material.dart';
import 'package:mini_project_mobile_app_idea/download_ticket.dart';
import 'package:mini_project_mobile_app_idea/main.dart';

class PaymentConfirmationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirm Payment'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Payment',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            Text(
              'Order Successful',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Text(
              'We just wanted to say\nthank you for using our services :)',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => TicketGenerationPage()));

                // Navigate to ticket page
              },
              child: Text('View Ticket'),
            ),
            SizedBox(height: 20),
            TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()));

                // Navigate back to home page
              },
              child: Text('Go back home'),
            ),
          ],
        ),
      ),
    );
  }
}
