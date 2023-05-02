import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mini_project_mobile_app_idea/signup_page.dart';
import './splash.dart';
import './login_screen.dart';
import 'signup_page.dart';
import 'login_screen.dart';
import 'search_page.dart';
import 'book_event.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // test();
  runApp(const MyApp());
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
