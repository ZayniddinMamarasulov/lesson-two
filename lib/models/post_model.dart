import 'package:lesson_two/models/post_comments.dart';
import 'package:lesson_two/models/user_model.dart';

class PostModel {
  List<String> images;
  bool isLiked;
  bool isSaved;
  int currentPage = 0;
  List<PostCommentModel> comments;

  PostModel({
    required this.images,
    required this.isLiked,
    required this.isSaved,
    required this.comments,
  });

  static List<PostModel> posts = [
    PostModel(
      images: [
        "https://i.pravatar.cc/300?img=50",
        "https://i.pravatar.cc/300?img=31",
        "https://i.pravatar.cc/300?img=20",
        "https://i.pravatar.cc/300?img=11",
      ],
      isLiked: true,
      isSaved: false,
      comments: <PostCommentModel>[],
    ),
    PostModel(
      images: [
        "https://i.pravatar.cc/300?img=51",
        "https://i.pravatar.cc/300?img=12",
        "https://i.pravatar.cc/300?img=19",
        "https://i.pravatar.cc/300?img=13",
      ],
      isLiked: false,
      isSaved: false,
      comments: <PostCommentModel>[
        PostCommentModel(
          author: UserModel(firstName: "Abbos"),
          comment: "Gap yo'q, zo'r",
        ),
        PostCommentModel(
          author: UserModel(firstName: "Baxti"),
          comment: "Bo'ladi OK OK OK OK ",
        ),
        PostCommentModel(
          author: UserModel(firstName: "Kamol"),
          comment: "Nimadirlar yozamiz",
        ),
      ],
    ),
    PostModel(
      images: [
        "https://i.pravatar.cc/300?img=9",
        "https://i.pravatar.cc/300?img=12",
        "https://i.pravatar.cc/300?img=34",
        "https://i.pravatar.cc/300?img=54",
      ],
      isLiked: false,
      isSaved: false,
      comments: <PostCommentModel>[],
    ),
    PostModel(
      images: [
        "https://i.pravatar.cc/300?img=9",
        "https://i.pravatar.cc/300?img=34",
        "https://i.pravatar.cc/300?img=56",
        "https://i.pravatar.cc/300?img=22",
      ],
      isLiked: false,
      isSaved: false,
      comments: <PostCommentModel>[],
    ),
  ];
}
