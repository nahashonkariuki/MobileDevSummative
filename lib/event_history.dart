import 'package:flutter/material.dart';

class EventHistory extends StatefulWidget {
  const EventHistory({Key? key}) : super(key: key);

  @override
  _EventHistoryState createState() => _EventHistoryState();
}

class _EventHistoryState extends State<EventHistory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event History'),
      ),
      body: ListView.builder(
        itemCount: eventList.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text(eventList[index].title),
            subtitle: Text(eventList[index].date),
            onTap: () {
              // Handle the tap for each event
            },
          );
        },
      ),
    );
  }
}

class Event {
  final String title;
  final String date;

  Event({required this.title, required this.date});
}

// Sample data for eventList
List<Event> eventList = [
  Event(title: 'Event 1', date: '2023-04-25'),
  Event(title: 'Event 2', date: '2023-04-20'),
  Event(title: 'Event 3', date: '2023-04-15'),
  // Add more events here if needed
];
