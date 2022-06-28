import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_dev_task/features/posts/data/models/post/post_model.dart';

class PostFirebaseService {
  Future<Unit> addPost(PostModel postModel) async {
    await FirebaseFirestore.instance
        .collection('posts')
        .add(postModel.toJson());
    return unit;
  }

  Future<List<PostModel>> getFavPosts() async {
    final data = await FirebaseFirestore.instance.collection('posts').get();

    final List<PostModel> postModels =
        data.docs.map((e) => PostModel.fromJson(e.data())).toList();
    return postModels;
  }

  Future<List<PostModel>> getPosts() async {
    final data = await FirebaseFirestore.instance.collection('posts').get();
    final List<PostModel> postModels =
        data.docs.map((e) => PostModel.fromJson(e.data())).toList();
    return postModels;
  }
}
