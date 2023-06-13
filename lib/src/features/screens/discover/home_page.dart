import 'package:Quatr/src/features/screens/messaging/chat_list_page.dart';
import 'package:flutter/material.dart';
import '../accounts/account_page.dart';
import '../q_mate/room_mates_page.dart';
import 'discover_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int _currentIndex = 0;

  List pages=[
    DiscoverPage(),
    RoomMatePage(),
    ChatListPage(),
    AccountPage()
  ];

  void _onTap(int index){
    setState(() {
      _currentIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,

      body: pages[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: _onTap,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Discover',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: 'Q-Mate',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.mail_outlined),
          label: 'Messages',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.person),
           label: 'Profile',
         ),
      ],
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
      //  unselectedLabelStyle: TextStyle(fontWeight: FontWeight.w200),
       // selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        selectedItemColor: Colors.white,
        selectedIconTheme: IconThemeData(color: Colors.green),
        unselectedIconTheme: IconThemeData(color: Colors.white),
        unselectedItemColor: Colors.white,
        showUnselectedLabels: false,
        showSelectedLabels: false,

    ),
    );


  }
}
