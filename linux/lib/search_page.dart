import 'package:flutter/material.dart';


class EventSearchDelegate extends SearchDelegate<Event?> {
  final List<Event> events;
  final TextEditingController _searchController = TextEditingController();

  EventSearchDelegate(this.events);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [      IconButton(        icon: Icon(Icons.clear),        onPressed: () {          query = '';          _searchController.clear();        },      )    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    _searchController.text = query;
    final List<Event> results = events
        .where((event) => event.title.toLowerCase().contains(query))
        .toList();
    return ListView.builder(
      itemCount: results.length,
      itemBuilder: (BuildContext context, int index) {
        final event = results[index];
        return ListTile(
          title: Text(event.title),
          subtitle: Text(event.location),
          onTap: () {
            close(context, event);
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    _searchController.text = query;
    final List<Event> suggestions = events
        .where((event) => event.title.toLowerCase().startsWith(query))
        .toList();
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int index) {
        final event = suggestions[index];
        return ListTile(
          title: Text(event.title),
          subtitle: Text(event.location),
          onTap: () {
            close(context, event);
          },
        );
      },
    );
  }
}






class Event {
  final String category;
  final String title;
  final String location;
  final ImageProvider<Object> imageUrl;


  const Event({
    required this.category,
    required this.title,
    required this.location,
    required this.imageUrl,


  });
}


class EventPage extends StatefulWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  _EventPageState createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  final List<Event> _events = [
    Event(
      category: 'Movies',
      title: 'Avengers: Endgame',
      location: 'New York',
      imageUrl: AssetImage('assets/images/img.png'),
    ),
    Event(
      category: 'Movies',
      title: 'Black Panther',
      location: 'Los Angeles',
      imageUrl: AssetImage('assets/images/img.png'),
    ),
    Event(
      category: 'Conferences',
      title: 'Flutter Summit',
      location: 'Online',
      imageUrl: AssetImage('assets/images/img.png'),
    ),
    Event(
      category: 'Sports',
      title: 'NBA Finals',
      location: 'Phoenix',
      imageUrl: AssetImage('assets/images/img.png'),
    ),
    Event(
      category: 'Comedy',
      title: 'Dave Chappelle Live',
      location: 'Las Vegas',
      imageUrl: AssetImage('assets/images/img.png'),
    ),
    Event(
      category: 'Upskill & Training',
      title: 'Google Cloud Certification',
      location: 'Online',
      imageUrl: AssetImage('assets/images/img.png'),
    ),
    Event(
      category: 'Upskill & Training',
      title: 'AWS Bootcamp',
      location: 'Seattle',
      imageUrl: AssetImage('assets/images/img.png'),
    ),
    Event(
      category: 'E-events',
      title: 'React Conference',
      location: 'Online',
      imageUrl: AssetImage('assets/images/img.png'),
    ),
    Event(
      category: 'E-events',
      title: 'Web Summit',
      location: 'Lisbon',
      imageUrl: AssetImage('assets/images/img.png'),
    ),
  ];

  List<Event> _filteredEvents = [];

  TextEditingController _searchController = TextEditingController();

  String _selectedCategory = 'All';

  @override
  void initState() {
    super.initState();
    _filteredEvents = _events;
  }

  void _filterEvents() {
    List<Event> filtered = [];
    if (_selectedCategory == 'All') {
      filtered = _events;
    } else {
      filtered =
          _events.where((event) => event.category == _selectedCategory).toList();
    }
    setState(() {
      _filteredEvents = filtered
          .where((event) =>
          event.title.toLowerCase().contains(_searchController.text))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Events'),
    actions: [
    IconButton(
    icon: Icon(Icons.search),
    onPressed: () {
    showSearch(
    context: context,


    delegate: EventSearchDelegate(_events),
    );
    },
    ),
    ],
    ),
    body: Column(
    children: [
    Container(
    height: 150,
    child: ListView(
    scrollDirection: Axis.horizontal,
    children: [
    _buildCategoryFilter('All'),
    _buildCategoryFilter('Movies'),
    _buildCategoryFilter('Conferences'),
      _buildCategoryFilter('Comedy'),
      _buildCategoryFilter('Sports'),
      _buildCategoryFilter('Upskill & Training'),
    ],
    ),
    ),
      Expanded(
        child: ListView.builder(
          itemCount: _filteredEvents.length,
          itemBuilder: (BuildContext context, int index) {
            return _buildEventCard(_filteredEvents[index]);
          },
        ),
      ),

    ],
    ),
    );
  }

  Widget _buildCategoryFilter(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        children: [
          Container(
            height: 80.0,
            width: 80.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40.0),
              color: Colors.grey[300],
            ),
            child: Icon(
              Icons.filter_list,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            title,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventCard(Event event) {
    return GestureDetector(
      onTap: () {
// Navigate to event details page
      },
      child: Container(
        height: 120.0,
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                'assets/images/img.png',
                height: 100.0,
                width: 100.0,
                fit: BoxFit.cover,
              ),
            ),

            SizedBox(width: 10.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    event.title,
                    style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Text(
                    event.category,
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 5.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        event.location,
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}










//
//
//
//
//
//
//
//
// class Event {
//   final String title;
//   final String category;
//   final String date;
//   final String location;
//   final String image;
//
//   Event({
//     required this.title,
//     required this.category,
//     required this.date,
//     required this.location,
//     required this.image,
//   });
// }
//
// List<Event> events = [
// Event(
// title: 'Avengers: Endgame',
// category: 'Movies',
// date: 'May 3, 2019',
// location: 'New York, USA',
// image: 'assets/images/avengers.jpg',
// ),
// Event(
// title: 'FIFA World Cup Final',
// category: 'Sports',
// date: 'July 15, 2018',
// location: 'Moscow, Russia',
// image: 'assets/images/world_cup.jpg',
// ),
// Event(
// title: 'Comedy Night with John Oliver',
// category: 'Comedy',
// date: DateTime.now().add(Duration(days: 7)),
//   location: 'The Comedy Store, Los Angeles',
//   image: 'https://www.example.com/images/comedy.jpg',
// ),
//   Event(
//     title: 'NBA Finals Game 1',
//     category: 'Sports',
//     date: DateTime.now().add(Duration(days: 14)),
//     location: 'Staples Center, Los Angeles',
//     image: 'https://www.example.com/images/sports.jpg',
//   ),
//   Event(
//     title: 'Masterclass on Digital Marketing',
//     category: 'Upskill & Training',
//     date: DateTime.now().add(Duration(days: 21)),
//     location: 'Online',
//     image: 'https://www.example.com/images/training.jpg',
//   ),
// ];
//
// class SearchPage extends StatefulWidget {
//   @override
//   _SearchPageState createState() => _SearchPageState();
// }
//
// class _SearchPageState extends State<SearchPage> {
//   String _selectedCategory = 'All';
//   TextEditingController _searchController = TextEditingController();
//
//   List<Event> _searchedEvents = _eventsList;
//
//   void _filterEventsByCategory(String category) {
//     setState(() {
//       _selectedCategory = category;
//       if (_selectedCategory == 'All') {
//         _searchedEvents = _eventsList;
//       } else {
//         _searchedEvents = _eventsList
//             .where((event) => event.category == _selectedCategory)
//             .toList();
//       }
//     });
//   }
//
//   void _searchEvents(String searchQuery) {
//     setState(() {
//       _searchedEvents = _eventsList
//           .where((event) =>
//           event.title.toLowerCase().contains(searchQuery.toLowerCase()))
//           .toList();
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//         title: Text('Search Events'),
//     actions: [
//     IconButton(
//     icon: Icon(Icons.filter_alt),
//     onPressed: () {
//     showModalBottomSheet(
//     context: context,
//     builder: (context) {
//     return Container(
//     height: 200,
//     child: Column(
//     children: [
//     Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: Text(
//     'Filter by Category',
//     style: TextStyle(
//     fontSize: 20,
//     fontWeight: FontWeight.bold,
//     ),
//     ),
//     ),
//     _buildCategoryFilter('All'),
//     _buildCategoryFilter('Movies'),
//     _buildCategoryFilter('Conferences'),
//     _buildCategoryFilter('Comedy'),
//     _buildCategoryFilter('Sports'),
//     _buildCategoryFilter('Upskill & Training'),
//     ],
//     ),
//     );
//     });
//     },
//     ),
//     IconButton(
//     icon: Icon(Icons.search),
//     onPressed: () {
//     showSearch(
//     context: context,
//     delegate: CustomSearchDelegate(_searchController.text,
//     _searchEvents, _searchedEvents.length));
//     },
//     ),
//     ],
//     ),
//     body: Column(
//     children: [
//     Container(
//     height: 150,
//     child: ListView(
//     scrollDirection: Axis.horizontal,
//     children: [
//     _buildCategoryFilter('All'),
//     _buildCategoryFilter('Movies'),
//     _buildCategoryFilter('Conferences'),
//     _buildCategoryFilter('Comedy'),
//     _buildCategoryFilter('Sports'),
//     _buildCategoryFilter('Upskill & Training'),
//     ],
//     ),
//     ),
//     Expanded(
//     child: ListView.builder(
//     itemCount: _searchedEvents.length,
//     itemBuilder: (BuildContext context, int index) {
//     return Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: ListTile(
//     leading: CircleAvatar(
//     backgroundImage: NetworkImage(
//     _searchedEvents[index].image,
//     ),
//     ),
//     title: Text(_searchedEvents[index].title),
//     subtitle: Text(_searchedEvents[index].category),
//     trailing: Text(_searchedEvents[index].date),
//     ),
//     );
//     },
//     ),
//     );
//   },
//   );
// }
//
// Widget _buildCategoryFilter(String category) {
//   return GestureDetector(
//     onTap: () {
//       setState(() {
//         _selectedCategory = category;
//       });
//     },
//     child: Container(
//       margin: EdgeInsets.symmetric(horizontal: 10),
//       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       decoration: BoxDecoration(
//         border: Border.all(
//           color: _selectedCategory == category ? Colors.blue : Colors.grey,
//         ),
//         color: _selectedCategory == category ? Colors.blue : Colors.white,
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Text(
//         category,
//         style: TextStyle(
//           color: _selectedCategory == category ? Colors.white : Colors.black,
//           fontWeight: _selectedCategory == category ? FontWeight.bold : FontWeight.normal,
//         ),
//       ),
//     ),
//   );
// }
// }
