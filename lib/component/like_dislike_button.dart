import 'package:flutter/material.dart';

class LikeDislikeButton extends StatefulWidget {
  const LikeDislikeButton({Key? key}) : super(key: key);

  @override
  _LikeDislikeButtonState createState() => _LikeDislikeButtonState();
}

class _LikeDislikeButtonState extends State<LikeDislikeButton> {
  bool isLike = false;
  bool isDislike = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            setState(() {
              isLike = !isLike;
              isDislike = !isLike;
            });
          },
          icon: Icon(
            isLike ? Icons.thumb_up : Icons.thumb_up_outlined,
            color: Colors.black,
          ),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              isDislike = !isDislike;
              isLike = !isDislike;
            });
          },
          icon: Icon(
            isDislike ? Icons.thumb_down : Icons.thumb_down_outlined,
            color: Colors.black,
          ),
        ),
      ],
    );
  }
}
