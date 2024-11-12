import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quad/search_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.onMovieSelect});
 final Function(Map<String,dynamic>) onMovieSelect;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

   List movies = [];
  @override
  void initState() {
    
    super.initState();
    fetchMovies();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('movies'),
        actions: [
          IconButton(onPressed: (){
          Navigator.push(context,
          MaterialPageRoute(builder: (context)=> SearchScreen()));
          }, icon: Icon(Icons.search))
        ],
      ),
      body: 
      movies.isEmpty
      ? Center(child: CircularProgressIndicator(),)
      :ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context,index){
        var movie = movies[index]['show'];
        return ListTile(
          leading: movie['image'] !=null ? Image.network(movie['image']['medium']):SizedBox(),
          title: Text(movie['name'] ?? 'NO Title')  ,
          subtitle: Text(movie['summary'] ?? "No summary"),
          onTap: (){
          widget.onMovieSelect;
          },
        );
      }),
    );
  }
  
  Future<void> fetchMovies() async{
    final response = await http.get(Uri.parse('https://api.tvmaze.com/search/shows?q=all')) ;
    if(response.statusCode== 200) {
      setState(() {
        movies = jsonDecode(response.body);
      });
    }
    else{
      throw Exception("Failed to load movies");
    }                  
  }
}