import 'package:flutter/material.dart';

class BookTicketPage extends StatefulWidget {
  @override
  _BookTicketPageState createState() => _BookTicketPageState();
}

class _BookTicketPageState extends State<BookTicketPage> {
  int _selectedTickets = 1;
  String _selectedFormat = '2D';
  String _selectedLanguage = 'English';
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay(hour: 10, minute: 0);
  List<String> _formats = ['2D', '3D'];
  List<String> _languages = ['English', 'Spanish', 'French'];
  List<String> _showtimes = ['10:00 AM', '1:00 PM', '4:00 PM', '7:00 PM'];
  double _ticketPrice = 10.0;

  void _showDatePicker() async {
    final DateTime? date = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2030),
    );
    if (date != null) {
      setState(() {
        _selectedDate = date;
      });
    }
  }

  void _showTimePicker() async {
    final TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (time != null) {
      setState(() {
        _selectedTime = time;
      });
    }
  }

  void _selectFormat(String format) {
    setState(() {
      _selectedFormat = format;
    });
  }

  void _selectLanguage(String language) {
    setState(() {
      _selectedLanguage = language;
    });
  }

  void _updateTickets(int value) {
    setState(() {
      _selectedTickets = value;
    });
  }

  double _calculateTotalCost() {
    return _ticketPrice * _selectedTickets;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Book Ticket'),
        ),
        body: Padding(
        padding: const EdgeInsets.all(16.0),
    child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
    'BLACK ADAM',
    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
    ),
    SizedBox(height: 16.0),
    Text(
    'Format',
    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
    ),
    Row(
    children: [
    for (String format in _formats)
    Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: FilterChip(
    label: Text(format),
    selected: _selectedFormat == format,
    onSelected: (bool selected) {
    _selectFormat(format);
    },
    ),
    ),
    ],
    ),
    SizedBox(height: 16.0),
    Text(
    'Language',
    style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
    ),
    Row(
    children: [
    for (String language in _languages)
    Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: FilterChip(
    label: Text(language),
    selected: _selectedLanguage == language,
    onSelected: (bool selected) {
    _selectLanguage(language);
    },
    ),
    ),
    ],
    ),
    SizedBox(height: 16.0),
    Text(
    'Date and Time',
    style: TextStyle(fontSize:16.0, fontWeight: FontWeight.bold),
    ),
      Row(
        children: [
          Expanded(
            child: InkWell(
              onTap: _showDatePicker,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Date',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 16.0),
          Expanded(
            child: InkWell(
              onTap: _showTimePicker,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Time',
                    style: TextStyle(fontSize: 16.0),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    '${_selectedTime.format(context)}',
                    style: TextStyle(fontSize: 20.0),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      SizedBox(height: 16.0),
      Text(
        'Tickets',
        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 8.0),
      Row(
        children: [
          TextButton(
            onPressed: _selectedTickets > 1
                ? () => _updateTickets(_selectedTickets - 1)
                : null,
            child: Text('-'),
          ),
          SizedBox(width: 16.0),
          Text(
            '$_selectedTickets',
            style: TextStyle(fontSize: 20.0),
          ),
          SizedBox(width: 16.0),
          TextButton(
            onPressed: () => _updateTickets(_selectedTickets + 1),
            child: Text('+'),
          ),
        ],
      ),
      SizedBox(height: 16.0),
      Text(
        'Total Cost',
        style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 8.0),
      Text(
        '\$${_calculateTotalCost().toStringAsFixed(2)}',
        style: TextStyle(fontSize: 20.0),
      ),
      Spacer(),
      ElevatedButton(
        onPressed: () {},
        child: Text('Book Now'),
      ),
    ],
    ),
        ),
    );
  }
}



