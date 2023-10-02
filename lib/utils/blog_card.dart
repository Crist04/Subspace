import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:subspace/models/blog_model.dart';
import 'package:subspace/features/blog_detail.dart';

class BlogCard extends StatelessWidget {
  BlogCard({super.key, required this.blogs});
  Blogs blogs;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BlogDetails(blog:blogs)),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 50,
            ),
            Material(
              elevation: 20.0,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10.0),
                      topRight: Radius.circular(10.0)),
                ),
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                            height: 200.0,
                            width: double.infinity,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.0),
                                  topRight: Radius.circular(10.0)),
                              child: Image.network(
                                blogs.imageUrl.toString(),
                                fit: BoxFit.fill,
                              ),
                            )),
                      ],
                    ),
                    Container(
                      height: 60,
                      width: double.infinity,
                      padding: EdgeInsets.only(left: 12),
                      decoration:
                          BoxDecoration(color: Color.fromARGB(255, 27, 27, 27)),
                      child: Text(
                        blogs.title.toString(),
                        style: GoogleFonts.lato(
                            fontSize: 15,
                            color: const Color.fromARGB(255, 226, 225, 225)),
                        textAlign: TextAlign.left,
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
