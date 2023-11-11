import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';

class FeedbackK extends StatefulWidget {
  @override
  _FeedbackKState createState() => _FeedbackKState();
}

class _FeedbackKState extends State<FeedbackK> {
  TextEditingController textarea = TextEditingController();
  late double _rating;
  int _ratingBarMode = 1;
  double _initialRating = 0.0;

  @override
  void initState() {
    super.initState();
    _rating = _initialRating;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF627192),
      appBar: AppBar(
        backgroundColor: Color(0xFF2F2E4D),
        title: Text('feed'.tr),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: textarea,
              keyboardType: TextInputType.multiline,
              maxLines: 5,
              decoration: InputDecoration(
                  hintText: "feed1".tr,
                  hintStyle: TextStyle(color: Colors.white),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(width: 1, color: Colors.white))),
            ),
          ),
          SizedBox(height: 40.0),
          Text('feed2'.tr,
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
          SizedBox(height: 20.0),
          _ratingBar(_ratingBarMode),
          SizedBox(height: 20.0),
          Text(
            'feed3 $_rating'.tr,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 40.0),
          ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Color(0xFF2F2E4D)),
              onPressed: () {
                print(textarea.text);
              },
              child: Text("feed4".tr)),
        ],
      ),
    );
  }

  Widget _ratingBar(int mode) {
    return RatingBar.builder(
      itemBuilder: (context, index) {
        switch (index) {
          case 0:
            return Icon(
              Icons.sentiment_very_dissatisfied,
              color: Colors.red,
            );
          case 1:
            return Icon(
              Icons.sentiment_dissatisfied,
              color: Colors.redAccent,
            );
          case 2:
            return Icon(
              Icons.sentiment_neutral,
              color: Colors.amber,
            );
          case 3:
            return Icon(
              Icons.sentiment_satisfied,
              color: Colors.lightGreen,
            );
          case 4:
            return Icon(
              Icons.sentiment_very_satisfied,
              color: Colors.green,
            );
          default:
            return Container();
        }
      },
      onRatingUpdate: (rating) {
        setState(() {
          _rating = rating;
        });
      },
      updateOnDrag: true,
    );
  }
}
