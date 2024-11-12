

import 'package:flutter/material.dart';
class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key,  required this.movie});
  final  Map movie;
  @override
  Widget build(BuildContext context) {
    return 
    Scaffold(appBar:  AppBar(
      title: Text(movie['name']?? "No title"),
    ),
    
    body: Padding(padding: EdgeInsets.all(8.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if(movie['image'] !=null)
        Image.network(movie['image']['original']),
        SizedBox(height: 10,),
        Text(movie['name'] ?? 'No Title',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        SizedBox(height: 10,),
        Text(movie['summary'] ?? 'No summary')
      ],
    ),),
    );
   
    
    
  }
}