import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dev_task/core/presentation/widgets/app_drawer.dart';
import 'package:flutter_dev_task/features/posts/presentation/cubit/posts_cubit.dart';
import 'package:flutter_dev_task/features/posts/presentation/widgets/post_card.dart';
import 'package:flutter_dev_task/generated/locale_keys.g.dart';

import '../cubit/posts_state.dart';

class FavPostsPage extends StatefulWidget {
  const FavPostsPage({Key? key}) : super(key: key);

  @override
  State<FavPostsPage> createState() => _FavPostsPageState();
}

class _FavPostsPageState extends State<FavPostsPage> {
  @override
  void initState() {
    context.read<PostsCubit>().getFavPosts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final postsCubit = context.read<PostsCubit>();
    return Scaffold(
      drawer: const AppDrawer(),
      appBar: AppBar(
        title: Text(LocaleKeys.saved.tr()),
      ),
      body: BlocBuilder<PostsCubit, PostsState>(
        builder: (context, state) {
          return ListView.builder(
              itemCount: postsCubit.favPosts.length,
              itemBuilder: (context, index) =>
                  PostCard(post: postsCubit.favPosts[index]));
        },
      ),
    );
  }
}
