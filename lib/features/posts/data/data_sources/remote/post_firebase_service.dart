import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_dev_task/features/posts/data/models/post/post_model.dart';
import 'package:injectable/injectable.dart';

@injectable
class PostFirebaseService {
  Future<Unit> addPost(PostModel postModel) async {
    final imageUrl = await uploadImage(postModel.imageUrl);
    await FirebaseFirestore.instance
        .collection('posts')
        .add(postModel.copyWith(imageUrl: imageUrl).toJson());
    return unit;
  }

  Future<Unit> updatePost(PostModel postModel) async {
    await FirebaseFirestore.instance
        .collection('posts').doc(postModel.id)
        .update(postModel.toJson());
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
        data.docs.map((e) => PostModel.fromJson(e.data()..['id']= e.id)).toList();
    return postModels;
  }
}

Future<String> uploadImage(String imagePath) async {
  File image = File(imagePath);
  UploadTask uploadTask =
      FirebaseStorage.instance.ref().child('images/${image.path.split("/").last}').putFile(image);
  String imageUrl =
      await (await uploadTask.whenComplete(() => null)).ref.getDownloadURL();
  return imageUrl;
}
