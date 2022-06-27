import 'package:freezed_annotation/freezed_annotation.dart';
part 'post_model.freezed.dart';
@freezed
class PostModel with _$PostModel{
  factory PostModel({
    required String imageUrl,
    required String text,
  }) = _PostModel;
}