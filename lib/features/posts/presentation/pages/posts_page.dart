import 'package:flutter/material.dart';
import 'package:flutter_dev_task/features/posts/domain/entities/post/post.dart';
import 'package:flutter_dev_task/features/posts/presentation/widgets/post_card.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var post = Post(imageUrl: "https://media.istockphoto.com/photos/taj-mahal-mausoleum-in-agra-picture-id1146517111",
        text: "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص");
    return Scaffold(

      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(onPressed: () {  },child: const Icon(Icons.add)),
      body: ListView.builder(
          itemCount: 5, itemBuilder: (context, index) => PostCard(post: post,)),
    );
  }
}
