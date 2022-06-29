import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:lorakahnmovietips_app/models/comment.dart';
import 'package:lorakahnmovietips_app/pages/details/widgets/comment_card.dart';
import 'package:flutter/material.dart';
import 'package:lorakahnmovietips_app/constants.dart';
import 'package:lorakahnmovietips_app/repository/comments_repository.dart';

class Comments extends StatefulWidget {
  const Comments({Key? key}) : super(key: key);

  @override
  State<Comments> createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  @override
  Widget build(BuildContext context) {
    var commentController = TextEditingController();
    var commentSending = false;
    return Padding(
        padding: const EdgeInsets.only(top: kDefaultPadding * 2),
        child: Column(
          children: [
            FutureBuilder<QuerySnapshot<Map<String, dynamic>>>(
                future: _getComments(),
                builder: (context, snapshot) {
                  List<Comment> list = <Comment>[];
                  if (snapshot.hasData) {
                    snapshot.data!.docs.forEach((element) {
                      list.add(Comment.fromJson(map: element.data()));
                    });
                    return SizedBox(
                      height: 400,
                      child: ListView.builder(
                        itemCount: snapshot.data!.docs.length,
                        itemBuilder: (context, index) => CommentsCard(
                          avatar: list[index].picture,
                          name: list[index].name,
                          review: list[index].review,
                          date: DateTime.fromMillisecondsSinceEpoch(
                                  list[index].date)
                              .toString(),
                          rating: list[index].rating,
                        ),
                      ),
                    );
                  } else {
                    log('no data');
                    return Text('');
                  }
                }),
            SizedBox(
              height: 200,
              child: commentSending
                  ? Center(child: CircularProgressIndicator())
                  : Row(
                      children: [
                        Expanded(
                            flex: 8,
                            child: TextField(
                              controller: commentController,
                              decoration:
                                  InputDecoration(border: OutlineInputBorder()),
                            )),
                        Expanded(
                          flex: 2,
                          child: TextButton(
                              onPressed: () async {
                                setState(() {
                                  commentSending = true;
                                });
                                await _sendComment(
                                    commentController.text, 4.4, 'turan aktas');
                                setState(() {
                                  commentSending = false;
                                });
                              },
                              child: Text('Send')),
                        ),
                      ],
                    ),
            ),
          ],
        ));
  }

  Future _sendComment(String text, double rating, String name) async {
    FirebaseFirestore.instance.collection('comments').add(Comment(
            picture:
                'https://gravatar.com/avatar/b1901ccf69bebe0c9b49351eb5e6f3c4?s=400&d=robohash&r=x',
            name: name,
            date: DateTime.now().millisecondsSinceEpoch,
            rating: rating,
            review: text)
        .toJson());
  }

  Future<QuerySnapshot<Map<String, dynamic>>> _getComments() async {
    var response =
        await FirebaseFirestore.instance.collection('comments').get();

    return response;
  }
}

/*
commentSending
                ? Center(child: CircularProgressIndicator())
                : Row(
                    children: [
                      Expanded(
                          flex: 8,
                          child: TextField(controller: commentController)),
                      Expanded(
                        flex: 2,
                        child: TextButton(
                            onPressed: () async {
                              setState(() {
                                commentSending = true;
                              });
                              await _sendComment(
                                  commentController.text, 4.4, 'turan aktas');
                              setState(() {
                                commentSending = false;
                              });
                            },
                            child: Text('Send')),
                      ),
                    ],
                  ),
 */