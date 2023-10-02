import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:subspace/data/blog_notifier.dart';
import 'package:subspace/features/bookmarked_blogs.dart';
import 'package:subspace/utils/blog_card.dart';
import 'package:subspace/utils/enums.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    context.read<BlogsNotifier>().fetchBlogs(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.network(
          'https://i.ibb.co/LNFyqYT/1.png',
          width: 160,
        ),
        backgroundColor: Color.fromARGB(255, 27, 27, 27),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Bookmarks()),
          );
              },
              icon: Icon(Icons.bookmark,
                  color: const Color.fromARGB(255, 226, 225, 225))),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Consumer<BlogsNotifier>(
        builder: (context, notifier, _) {
          if (notifier.apiStatus == ApiStatus.loading) {
            return Center(
                child: LoadingAnimationWidget.dotsTriangle(
                    color: Colors.purple, size: 50));
          }
          if (notifier.apiStatus == ApiStatus.error) {
            return const Center(child: Text("Something went wrong"));
          }
          return ListView.builder(
              itemCount: notifier.blog.blogs!.length,
              itemBuilder: (context, index) {
                return BlogCard(
                  blogs: notifier.blog.blogs![index],
                );
              });
        },
      ),
    );
  }
}
