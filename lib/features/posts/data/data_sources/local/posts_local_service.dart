import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_dev_task/features/posts/data/models/post/post_model.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart';

@injectable
class PostsLocalService {
  final String tablePosts = 'posts';
  final String columnId = 'id';
  final String columnUserId = 'userId';
  final String columnImageUrl = 'imageUrl';
  final String columnText = 'text';
  Database? db;

  Future open() async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = '$databasesPath/flutter_dev_task.db';
    db = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
create table $tablePosts ( 
  $columnId text, 
  $columnUserId text, 
  $columnImageUrl text,
  $columnText text
  )
''');
    });
  }

  Future<Unit> savePosts(List<PostModel> posts) async {
    if(db == null){
      await open();
    }
    await deleteOldPosts();
    for (PostModel postModel in posts) {
      final map = postModel.toJson();
      map.remove('savedUsers');
      map.remove('likes');
      await db!.insert(tablePosts, map);
    }
    return unit;
  }

  Future<List<PostModel>> getLocalPosts() async {
    if(db == null){
      await open();
    }
    List<Map> maps = await db!.query(tablePosts);
    final List<PostModel> posts = maps.map((map) {
      final Map<String, dynamic> postMap = {};
      postMap.addAll( map as Map<String, dynamic>) ;
      postMap['savedUsers'] = [];
      postMap['likes'] = [];
      return PostModel.fromJson(postMap);
    }).toList();
    debugPrint('cached posts count = ${posts.length}');
    return posts;
  }

  Future<void> deleteOldPosts() async {
    await db!.delete(tablePosts);
  }

  Future close() async => db!.close();
}
