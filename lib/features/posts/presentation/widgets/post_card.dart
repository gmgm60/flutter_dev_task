import 'package:flutter/material.dart';
import 'package:flutter_dev_task/core/constants/colors.dart';
import 'package:flutter_dev_task/generated/assets.dart';

import '../../domain/entities/post/post.dart';

class PostCard extends StatelessWidget {
  final Post post;
  const PostCard({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: CircleAvatar(
                      backgroundColor: mainBackground,
                      // child: Icon(Icons.person, size: 30, color: Colors.grey),
                  foregroundImage: AssetImage(Assets.imagesUser),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.share,
                          color: iconsColor,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.bookmark,
                          color: iconsColor,
                        )),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Image.asset(
                              Assets.iconsLike,
                              color: iconsColor,
                            )),
                        Container(
                          decoration: const BoxDecoration(
                              color: mainBackground,
                              borderRadius: BorderRadius.all(Radius.circular(5))),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text('3'),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Image.network(post.imageUrl),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(post.text),
            ),
          ],
        ),
      ),
    );
  }
}
