import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mini_project_mobile_app_idea/payment_sumary.dart';
import 'package:mini_project_mobile_app_idea/confirm_payment.dart';
import 'package:mini_project_mobile_app_idea/download_ticket.dart';

void main() {
  testWidgets('PaymentSummaryScreen displays correctly',
      (WidgetTester tester) async {
    // Build the PaymentSummaryScreen widget
    await tester.pumpWidget(MaterialApp(home: PaymentSummaryScreen()));

    // Check that the PaymentSummaryScreen widget displays correctly
    expect(find.text('Payment Summary'), findsOneWidget);
    expect(find.text('Bicu Lounge'), findsOneWidget);
    expect(find.text('Performers Night'), findsOneWidget);
    expect(find.text('Fri, Feb 10, 6:00 PM CAT'), findsOneWidget);
    expect(find.text('Total Cost: \$10'), findsOneWidget);
  });

  testWidgets('PaymentConfirmationPage should have title "Confirm Payment"',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: PaymentConfirmationPage()));
    expect(find.text('Confirm Payment'), findsOneWidget);
  });

  testWidgets('PaymentConfirmationPage should have text "Order Successful"',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: PaymentConfirmationPage()));
    expect(find.text('Order Successful'), findsOneWidget);
  });

  testWidgets(
      'PaymentConfirmationPage should navigate to TicketGenerationPage when "View Ticket" button is pressed',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: PaymentConfirmationPage()));

    // Tap the "View Ticket" button
    await tester.tap(find.text('View Ticket'));
    await tester.pumpAndSettle();

    // Check that we're on the TicketGenerationPage
    expect(find.byType(TicketGenerationPage), findsOneWidget);
  });

  testWidgets('TicketGenerationPage displays ticket title',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: TicketGenerationPage()));
    expect(find.text('Ticket'), findsOneWidget);
  });

  testWidgets('TicketGenerationPage has download button',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: TicketGenerationPage()));
    expect(
        find.widgetWithText(ElevatedButton, 'Download Ticket'), findsOneWidget);
  });

  testWidgets('TicketGenerationPage downloads ticket on button press',
      (WidgetTester tester) async {});
}

