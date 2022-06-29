import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dev_task/features/posts/presentation/cubit/posts_cubit.dart';
import 'package:flutter_dev_task/features/posts/presentation/widgets/add_post.dart';
import 'package:flutter_dev_task/features/posts/presentation/widgets/post_card.dart';
import 'package:loading_indicator/loading_indicator.dart';

import '../cubit/posts_state.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  @override
  void initState() {
    context.read<PostsCubit>().getPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final postsCubit = context.read<PostsCubit>();
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return const AddPost();
                });
          },
          child: const Icon(Icons.add)),
      body: BlocBuilder<PostsCubit, PostsState>(
        builder: (context, state) {
          if(state is Loading && postsCubit.posts.isEmpty){
            return const Center(
              child: SizedBox(width: 100,
                child: LoadingIndicator(
                    indicatorType: Indicator.ballPulseSync,
                    colors: [Colors.blue,Colors.deepOrange,Colors.grey,Colors.white],
                    strokeWidth: 1,
                ),
              ),
            );
          }
          return ListView.builder(
              itemCount: postsCubit.posts.length,
              itemBuilder: (context, index) =>
                  PostCard(post: postsCubit.posts[index]));
        },
      ),
    );
  }
}
