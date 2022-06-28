import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dev_task/core/constants/colors.dart';
import 'package:flutter_dev_task/features/auth/presentation/cubit/auth_cubit/auth_cubit.dart';
import 'package:flutter_dev_task/features/posts/presentation/cubit/posts_cubit.dart';
import 'package:flutter_dev_task/features/posts/presentation/cubit/posts_state.dart';
import 'package:flutter_dev_task/generated/locale_keys.g.dart';
import 'package:image_picker/image_picker.dart';

import '../../domain/entities/post/post.dart';

class AddPost extends StatefulWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  String? imagePath;
  String text = LocaleKeys.postText.tr();

  Future<void> getImage() async {
    final images = await ImagePicker().pickMultiImage();
    if (images != null) {
      for (var image in images) {
        debugPrint(image.path);
        imagePath = image.path;
      }
    } else {
      debugPrint('no photo selected');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 100, horizontal: 20),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(
                  color: mainBackground,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: GestureDetector(
                  onTap: () async {
                    await getImage();
                    setState(() {});
                  },
                  child: imagePath == null
                      ? Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.camera_alt,
                              color: textFormBackground,
                              size: 80,
                            ),
                            Text(LocaleKeys.uploadImage.tr()),
                          ],
                        )
                      : Image.file(
                          File(imagePath!),
                          width: double.infinity,
                          fit: BoxFit.fitWidth,
                        ),
                ),
              ),
              const SizedBox(height: 30),
              Text(LocaleKeys.addComment.tr()),
              const SizedBox(height: 20),
              TextFormField(
                initialValue: text,
                textInputAction: TextInputAction.done,
                maxLines: 3,
                minLines: 3,
              ),
              const SizedBox(height: 20),
              BlocBuilder<PostsCubit, PostsState>(builder: (context, state) {
                return state.maybeMap(
                  orElse: () => const SizedBox.shrink(),
                  loading: (_) => const LinearProgressIndicator(),
                  postAdded: (_) {
                    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                      AutoRouter.of(context).pop();
                    });
                    return const SizedBox.shrink();
                  },
                  error: (error) => Text(error.message),
                );
              }),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        AutoRouter.of(context).pop();
                      },
                      child: Text(
                        LocaleKeys.cancel.tr(),
                        style: const TextStyle(color: buttonBackground),
                      )),
                  ElevatedButton(
                      style: ButtonStyle(
                          backgroundColor: MaterialStateColor.resolveWith(
                              (states) => buttonBackground)),
                      onPressed: () async {
                        if (imagePath != null) {
                          final userId = context.read<AuthCubit>().user!.id;
                          final Post post = Post(id: '',
                              userId: userId,
                              imageUrl: imagePath!,
                              text: text,
                              likes: [], savedUsers: []);
                          await context
                              .read<PostsCubit>()
                              .addNewPost(post: post);
                        }
                      },
                      child: Text(LocaleKeys.publish.tr())),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
