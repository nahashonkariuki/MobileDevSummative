import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import './splash.dart';
import './login_screen.dart';
import 'search_page.dart';
import 'book_event.dart';
import 'settings.dart';
import 'event_history.dart';
import 'notifications.dart';
import 'package:url_launcher/url_launcher.dart';
import 'payment_history.dart';
import 'help.dart';

    

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // test();
  runApp(const MyApp());
}

Future<void> _launchCalendarApp(BuildContext context) async {
  const String calendarUrl = 'content://com.android.calendar/time';
  if (await canLaunch(calendarUrl)) {
    await launch(calendarUrl);
  } else {
    // Calendar app is not available or cannot be launched
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Unable to open Calendar app")),
    );
  }
}

void test() async {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: "test@test.com",
    password: "Password123456789",
  );
  print(credential);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event Management system',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const Splash(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Events"),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            const UserAccountsDrawerHeader(
              accountName: Text('name'),
              accountEmail: Text('email'),
              currentAccountPicture: CircleAvatar(
                backgroundImage:
                    NetworkImage('https://i.pravatar.cc/150?img=3'),
              ),
            ),
            ListTile(
              title: const Text('Event History'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => EventHistory()),
                );
              },
            ),
            ListTile(
              title: const Text('Notifications'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Notifications()),
                );
              },
            ),
            ListTile(
              title: const Text('Calendar'),
              onTap: () {
                Navigator.of(context).pop();
                _launchCalendarApp(context);
              },
            ),
            ListTile(
              title: const Text('Settings'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => Settings()),
                );
              },
            ),
            ListTile(
              title: const Text('Payment History'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => PaymentHistory()),
                );
              },
            ),
            ListTile(
              title: const Text('Help'),
              onTap: () {
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) => Help()),
                );
              },
            ),
            ListTile(
              title: const Text('Logout'),
              onTap: () async {
                // Sign out the user from Firebase
                await FirebaseAuth.instance.signOut();
                // Pop the Drawer and navigate to the login screen
                Navigator.of(context).pop();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => LoginPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          // Search bar
          Container(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search events',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
              ),
            ),
          ),
          // Featured events section

          Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Featured events',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Featured events list
                SizedBox(
                  height: 330.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      // Featured event cards
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BookTicketPage(),
                            ),
                          );
                        },
                        child: Container(
                          width: 220.0,
                          margin: const EdgeInsets.only(right: 8.0),
                          child: Card(
                            child: Column(
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
                              ],
                            ),
                          ),
                        ),
                      ),

                      Container(
                        width: 220.0,
                        margin: const EdgeInsets.only(right: 8.0),
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset('assets/images/img_1.png'),
                              const Text(
                                'Lavana',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                              const Text(
                                'Friday Night Live',
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              const Text(
                                'Fri, Feb 10, 8:00 PM CAT',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 220.0,
                        margin: const EdgeInsets.only(right: 8.0),
                        child: Card(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset('assets/images/img_2.png'),
                              const Text(
                                'Sofar Kigali',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                              const Text(
                                'Secret Location',
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                              const Text(
                                'Sat, Feb 11, 3:30 PM  CAT',
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 220.0,
                        margin: const EdgeInsets.only(right: 8.0),
                        child: Card(
                          child: Card(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Image.asset('assets/images/img_3.png'),
                                const Text(
                                  'Plant & Seed Swap',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                  ),
                                ),
                                const Text(
                                  'Casa Keza',
                                  style: TextStyle(
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                const Text(
                                  'Sat, Feb 11, 2:00 PM CAT',
                                  style: TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Event categories section
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Categories',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Category list
                SizedBox(
                  height: 165.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      // Category cards
                      Container(
                        width: 80.0,
                        margin: const EdgeInsets.only(right: 8.0),
                        child: Card(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/img_4.png'),
                            const Text(
                              'Music',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                          ],
                        )),
                      ),
                      Container(
                        width: 80.0,
                        margin: const EdgeInsets.only(right: 8.0),
                        child: Card(
                          child: Column(children: [
                            Image.asset(
                              "assets/images/img_5.png",
                              fit: BoxFit.cover,
                              height: 120,
                              width: double.infinity,
                            ),
                            const Text(
                              'Sports',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                          ]),
                        ),
                      ),
                      Container(
                        width: 120.0,
                        margin: const EdgeInsets.only(right: 8.0),
                        child: Card(
                          child: Column(children: [
                            Image.asset(
                              "assets/images/img_6.png",
                              fit: BoxFit.cover,
                              height: 110,
                              width: double.infinity,
                            ),
                            const Text(
                              'Food and drinks',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                          ]),
                        ),
                      ),
                      Container(
                        width: 120.0,
                        margin: const EdgeInsets.only(right: 8.0),
                        child: Card(
                          child: Column(children: [
                            Image.asset(
                              "assets/images/img_7.png",
                              fit: BoxFit.cover,
                              height: 130,
                              width: double.infinity,
                            ),
                            const Text(
                              'Outdoor',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Upcoming events section
          Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'This Weekend',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                // Upcoming events list
                ListView(
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  children: [
                    // Event cards
                    Card(
                      child: Column(
                        children: [
                          Image.asset('assets/images/img_8.png'),
                          const Text('Ladies'),
                          const Text('13/3/2023'),
                          const Text('Kigali'),
                        ],
                      ),
                    ),
                    Card(
                      child: Column(
                        children: [
                          Image.asset('assets/images/img_9.png'),
                          const Text('The Obsession'),
                          const Text('03/03/2023'),
                          const Text('Kigali'),
                        ],
                      ),
                    ),
                    // Add more events here
                  ],
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
              child: const Text("Login"),
            ),
          )
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey[400],
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: GestureDetector(
              child: Icon(Icons.search),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EventPage()),
                );
              },
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
