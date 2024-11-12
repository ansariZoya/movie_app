import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List searchResults = [];
  TextEditingController searchController = TextEditingController();

  Future<void> searchMovies(String query) async {
    final response = await http.get(Uri.parse('https://api.tvmaze.com/search/shows?q=$query'));
    if(response.statusCode==200){
      setState(() {
        searchResults = jsonDecode(response.body);
      });
    }else{
      throw Exception('Failed to load error');
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: searchController,
          decoration: InputDecoration(hintText: 'Search Movies'),
          onSubmitted: searchMovies,
        ),
      ),
      body: searchResults.isEmpty
      ?Center(child: Text("Search for movies"),)
      : ListView.builder(itemBuilder: (context,index){
        var movie = searchResults[index]['show'];
        return ListTile(
          leading: movie['image'] != null
          ?Image.network(movie['image']['medium'])
          :SizedBox(),
          title: Text(movie['name']?? 'No Title'),
          subtitle: Text(movie['summary'] ?? 'No summary'),
        );
      })
    );
  }
}