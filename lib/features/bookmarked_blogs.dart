import 'package:flutter/material.dart';
import 'package:subspace/data/bookmark_blogs.dart';
import 'package:subspace/utils/blog_card.dart';

class Bookmarks extends StatelessWidget {
  const Bookmarks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Image.network('https://i.ibb.co/LNFyqYT/1.png',width: 160,),
        backgroundColor: Color.fromARGB(255, 27, 27, 27),
        actions: [
          IconButton(
              onPressed: () {
                
              },
              icon: Icon(Icons.bookmark,
                  color: const Color.fromARGB(255, 226, 225, 225))),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body:ListView.builder(
              itemCount: bookmarked.length,
              itemBuilder: (context, index) {
                return BlogCard(
                  blogs:bookmarked[index],
                );
              }),
        
      
    );
  }
}