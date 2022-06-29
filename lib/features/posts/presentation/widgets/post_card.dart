import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dev_task/core/constants/colors.dart';
import 'package:flutter_dev_task/features/auth/presentation/cubit/auth_cubit/auth_cubit.dart';
import 'package:flutter_dev_task/features/posts/presentation/cubit/posts_cubit.dart';
import 'package:flutter_dev_task/generated/assets.dart';

import '../../domain/entities/post/post.dart';

class PostCard extends StatelessWidget {
  final Post post;

  const PostCard({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String userId = context.read<AuthCubit>().user!.id;
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
                        onPressed: () {
                          context
                              .read<PostsCubit>()
                              .addToFav(post: post, userId: userId);
                        },
                        icon: Icon(
                          Icons.bookmark,
                          color:  post.savedUsers.contains(userId)
                              ? Colors.blue
                              : iconsColor,
                        )),
                    Column(
                      children: [
                        IconButton(
                            onPressed: () {
                              context
                                  .read<PostsCubit>()
                                  .likePost(post: post, userId: userId);
                            },
                            icon: Image.asset(
                              Assets.iconsLike,
                              color:  post.likes.contains(userId)
                                  ? Colors.blue
                                  : iconsColor,
                            )),
                        Container(
                          decoration: const BoxDecoration(
                              color: mainBackground,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(post.likes.length.toString()),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: CachedNetworkImage(
                imageUrl: post.imageUrl,
                imageBuilder: (context, imageProvider) => Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: imageProvider,fit: BoxFit.fill),
                   borderRadius: const BorderRadius.all(Radius.circular(8))
                  ),

                ),
                placeholder: (context, url) => const CircularProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 20),
              child: Text(post.text,style: Theme.of(context).textTheme.bodyText1),
            ),
          ],
        ),
      ),
    );
  }
}
