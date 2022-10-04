import 'package:flutter/material.dart';
import 'package:lesson_two/models/post_model.dart';
import 'package:lesson_two/screens/flutter_ten.dart';
import 'package:lesson_two/screens/payment_method_page.dart';
import 'package:lesson_two/screens/test_page.dart';
import 'package:lesson_two/utils/styles.dart';

import '../models/post_comments.dart';
import '../models/user_model.dart';
import 'home_page.dart';

class MyPageViewPage extends StatefulWidget {
  UserModel currentUser;

  MyPageViewPage({Key? key, required this.currentUser}) : super(key: key);

  @override
  State<MyPageViewPage> createState() => _MyPageViewPageState();
}

class _MyPageViewPageState extends State<MyPageViewPage> {
  var pageController = PageController(initialPage: 0);
  var textFieldController = TextEditingController();

  Widget buildPostImage(String image, int currentPage) {
    return Container(
      width: double.infinity,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            child: Image.network(
              image,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            right: 16,
            top: 16,
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black.withOpacity(0.3)),
              child: Text(
                "${currentPage + 1}/4",
                style: MyStyles.robotoRegular400.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    startPageView();
  }

  void startPageView() {
    Future.delayed(Duration(seconds: 1), () {
      callNext();
    });
  }

  void callNext() {
    if (pageController.page != 2)
      pageController.nextPage(
        duration: Duration(milliseconds: 1000),
        curve: Curves.easeInOutSine,
      );
    else {
      pageController.animateToPage(
        0,
        duration: Duration(milliseconds: 1000),
        curve: Curves.easeInOutSine,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 60),
            Container(
              height: MediaQuery.of(context).size.height * 0.9,
              child: ListView.builder(
                  itemCount: PostModel.posts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return buildPostItem(PostModel.posts[index]);
                  }),
            )
          ],
        ),
      ),
    );
  }

  Widget buildPostItem(PostModel post) {
    return Column(
      children: [
        InkWell(
          onDoubleTap: () {
            setState(() {
              post.isLiked = true;
            });
          },
          child: Container(
            height: 300,
            child: PageView.builder(
              onPageChanged: (index) {
                setState(() {
                  post.currentPage = index % 4;
                });
              },
              controller: pageController,
              itemBuilder: (BuildContext context, int index) {
                return buildPostImage(post.images[index], post.currentPage);
              },
              itemCount: post.images.length,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
                onPressed: () {
                  setState(() {
                    post.isLiked = !post.isLiked;
                  });
                },
                icon: post.isLiked
                    ? Icon(
                        Icons.favorite,
                        color: Colors.red,
                      )
                    : Icon(Icons.favorite_border_outlined)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: indicators(4, post.currentPage),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.bookmark_border_outlined),
            ),
          ],
        ),
        Container(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              buildComments(post.comments),
              TextField(
                onSubmitted: (value) {
                  setState(() {
                    post.comments.add(
                      PostCommentModel(
                          author: UserModel(firstName: "Bu biz"),
                          comment: value),
                    );
                    textFieldController.text = "";
                  });
                },
                controller: textFieldController,
                decoration: InputDecoration(hintText: "Comments"),
              ),
              SizedBox(height: 12)
            ],
          ),
        )
      ],
    );
  }

  Widget buildComments(List<PostCommentModel> comments) {
    return Container(
      height: 60,
      child: ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return buildCommentItem(comments[index]);
        },
        itemCount: comments.length,
      ),
    );
  }

  Widget buildCommentItem(PostCommentModel comment) {
    return Row(
      children: [
        Text(
          comment.author.firstName ?? "Null",
          style: MyStyles.robotoBold700,
        ),
        SizedBox(width: 18),
        Text(comment.comment)
      ],
    );
  }

  List<Widget> indicators(imagesLength, currentIndex) {
    return List<Widget>.generate(imagesLength, (index) {
      return Container(
        margin: EdgeInsets.all(3),
        width: 15,
        height: 15,
        decoration: BoxDecoration(
            color: currentIndex == index ? Colors.black : Colors.black26,
            shape: BoxShape.circle),
      );
    });
  }

  AnimatedContainer slider(images, pagePosition, active) {
    double margin = active ? 10 : 20;
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOutCubic,
      margin: EdgeInsets.all(margin),
      decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage(images[pagePosition]))),
    );
  }
}
