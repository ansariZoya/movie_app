
import 'package:flutter/material.dart';
import 'package:quad/detail_screen.dart';

import 'package:quad/home_screen.dart';
import 'package:quad/search_screen.dart';
class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
    List movies = [];

  int currentindex = 0;
  Map<String,dynamic>? selectedMovie;
       
   List<Widget> get _pages => <Widget>[
   HomeScreen(
    onMovieSelect: (movie){
      setState(() {
        selectedMovie= movie;
        currentindex = 2;
      });
    },
   ),
   const SearchScreen(),
   DetailScreen(movie: selectedMovie??
   { 'name': 'Default Movie',
    'summary' : 'Default summary'
    
   })
   
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentindex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
       currentIndex: currentindex,
       
        items:const [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'HOME'),
          BottomNavigationBarItem(icon: Icon(Icons.search),label: 'SEARCH'),
          BottomNavigationBarItem(icon: Icon(Icons.details),label: 'DETAILS')
        ],
        onTap: (int index){
          setState(() {
            currentindex = index;
          });
        },
      ),
    );
  }
}