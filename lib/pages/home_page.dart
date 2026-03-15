import 'package:clientserver/util/emoticon_face.dart';
import 'package:clientserver/util/exercise_tile.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blue[800],
        unselectedItemColor: Colors.blue[300],
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.store), label: 'Store'),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_add_alt_1),
            label: 'Add',
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Seção azul do topo
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Hi, Rod!",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            '23 Jan, 2026',
                            style: TextStyle(color: Colors.blue[200]),
                          ),
                        ],
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue[600],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: EdgeInsets.all(8),
                        child: Icon(Icons.notifications, color: Colors.white),
                      ),
                    ],
                  ),

                  SizedBox(height: 24),

                  // searchbar
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    decoration: BoxDecoration(
                      color: Colors.blue[600],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.search, color: Colors.white),
                        SizedBox(width: 8),
                        Text('Search', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                  ),

                  SizedBox(height: 24),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Roles for today:',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                      Icon(Icons.more_horiz, color: Colors.white),
                    ],
                  ),

                  SizedBox(height: 16),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          EmoticonFace(icon: Icons.people),
                          SizedBox(height: 8),
                          Text('Team', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      Column(
                        children: [
                          EmoticonFace(icon: Icons.car_crash),
                          SizedBox(height: 8),
                          Text('Frota', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      Column(
                        children: [
                          EmoticonFace(icon: Icons.document_scanner_sharp),
                          SizedBox(height: 8),
                          Text('Docs', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      Column(
                        children: [
                          EmoticonFace(icon: Icons.ac_unit_outlined),
                          SizedBox(height: 8),
                          Text('Snow', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 24),
                ],
              ),
            ),

            // Seção branca de exercícios
            Expanded(
              child: Container(
                padding: EdgeInsets.all(24),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Exercises',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 24),

                    Expanded(
                      child: ListView(
                        children: [
                          ExerciseTile(
                            icon: Icons.people,
                            name: 'Clients',
                            sub: '12 registered',
                            color: Colors.orange,
                            onTap: () =>
                                Navigator.of(context).pushNamed('/clients'),
                          ),
                          ExerciseTile(
                            icon: Icons.directions_car,
                            name: 'Fleet',
                            sub: '5 vehicles',
                            color: Colors.pink[400],
                          ),
                          ExerciseTile(
                            icon: Icons.description,
                            name: 'Documents',
                            sub: '8 pending',
                            color: Colors.blue[400],
                          ),
                          ExerciseTile(
                            icon: Icons.bar_chart,
                            name: 'Reports',
                            sub: 'Last 30 days',
                            color: Colors.green[400],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
