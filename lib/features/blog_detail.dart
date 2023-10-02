import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:subspace/data/bookmark_blogs.dart';
import 'package:subspace/models/blog_model.dart';

class BlogDetails extends StatelessWidget {
  Blogs blog;

  BlogDetails({super.key, required this.blog});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                bookmarked.add(blog);
              },
              icon: Icon(Icons.bookmark,
                  color: const Color.fromARGB(255, 226, 225, 225))),
          SizedBox(
            width: 20,
          )
        ],
        automaticallyImplyLeading: false,
        title: Image.network(
          'https://i.ibb.co/LNFyqYT/1.png',
          width: 160,
        ),
        backgroundColor: Color.fromARGB(255, 27, 27, 27),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            SizedBox(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  blog.imageUrl.toString(),
                  fit: BoxFit.cover,
                )),
            Container(
              margin: const EdgeInsets.fromLTRB(16.0, 250.0, 16.0, 16.0),
              decoration: BoxDecoration(
                  color: Colors.black26,
                  borderRadius: BorderRadius.circular(5.0)),
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    blog.title.toString(),
                    style: GoogleFonts.lato(fontSize: 25),
                  ),
                  const SizedBox(height: 10.0),
                  const Divider(),
                  const SizedBox(
                    height: 10.0,
                  ),
                  const SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    "Lorem ipsum dolor,sit amet consecteturadipisicing elit.Aperiam,ullam Fuga doloremque repellendus aut sequi officiis dignissimos,enim assumenda tenetur reprehenderit quam error,accusamus ipsa? Officiis voluptatum sequi voluptas omnis.Lorem ipsum dolor,sit amet consectetur adipisicing elit. Aperiam, ullam? Fuga doloremque repellendus aut sequi officiis dignissimos, enim assumenda tenetur reprehenderit quam error, accusamus ipsa? Officiis voluptatum sequi voluptas omnis.",
                    textAlign: TextAlign.justify,
                    style: GoogleFonts.lato(
                        fontSize: 20,
                        color: const Color.fromARGB(255, 226, 225, 225)),
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
