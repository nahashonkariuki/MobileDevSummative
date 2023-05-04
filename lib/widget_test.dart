// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mini_project_mobile_app_idea/book_event.dart';
import 'package:mini_project_mobile_app_idea/signup_page.dart';
import 'package:mini_project_mobile_app_idea/notifications.dart';
import 'package:mini_project_mobile_app_idea/payment_screen.dart';
import 'package:mini_project_mobile_app_idea/payment_sumary.dart';
import 'package:mini_project_mobile_app_idea/confirm_payment.dart';

void main() {
  testWidgets('BookTicketPage displays title', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: BookTicketPage()));
    expect(find.text('Book Ticket'), findsOneWidget);
  });

  testWidgets('Email and Password fields are displayed',
      (WidgetTester tester) async {
    // Build the SignUpPage widget
    await tester.pumpWidget(MaterialApp(home: SignUpPage()));

    // Check that the Email and Password text fields are displayed
    expect(find.widgetWithText(TextField, 'Email'), findsOneWidget);
    expect(find.widgetWithText(TextField, 'Password'), findsOneWidget);
  });

  testWidgets('Test if all notifications are displayed',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp());
  });

  testWidgets('Test if the notification title and date are displayed correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp());

    for (final item in notificationList) {
      expect(find.text(item.title), findsOneWidget);
      expect(find.text(item.date), findsOneWidget);
    }
  });

  testWidgets('tap Proceed button with no payment method selected',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: PaymentScreen()));

    await tester.tap(find.text('Proceed'));
    await tester.pump();

    expect(find.text('Error'), findsOneWidget);
    expect(find.text('Please select a payment method.'), findsOneWidget);
    expect(find.text('OK'), findsOneWidget);
  });

  testWidgets('PaymentSummaryScreen displays the correct information',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: PaymentSummaryScreen(),
    ));

    // Verify that the page displays the correct information
    expect(find.text('Bicu Lounge'), findsOneWidget);
    expect(find.text('Performers Night'), findsOneWidget);
    expect(find.text('Fri, Feb 10, 6:00 PM CAT'), findsOneWidget);
    expect(find.text('Total Cost: \$10'), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
    expect(find.byType(ElevatedButton), findsOneWidget);
  });

  testWidgets(
      'PaymentSummaryScreen navigates to the PaymentConfirmationPage when the checkout button is pressed',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: PaymentSummaryScreen(),
    ));

    // Tap the checkout button
    await tester.tap(find.text('Checkout'));
    await tester.pumpAndSettle();

    // Verify that the PaymentConfirmationPage is displayed
    expect(find.byType(PaymentConfirmationPage), findsOneWidget);
  });
}
