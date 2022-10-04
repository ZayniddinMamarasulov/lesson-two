import 'package:lesson_two/models/user_model.dart';

class PostCommentModel {
  UserModel author;
  String comment;

  PostCommentModel({
    required this.author,
    required this.comment,
  });
}
