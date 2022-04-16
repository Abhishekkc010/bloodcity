import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
class Rating extends StatefulWidget {
  const Rating({Key? key}) : super(key: key);
  static String id = "Rating_page";

  @override
  State<Rating> createState() => _RatingState();
}

class _RatingState extends State<Rating> {
  double? _ratingValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Rating'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: Center(
            child: Column(
              children: [
                // const Text(
                //   'How was your Experience? \n Rate Us ?',
                //   style: TextStyle(fontSize: 24),
                // ),
                Text('How was your Experience?',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                    )),

                SizedBox(height: 25),

                Text('Rate Us ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 23,
                      color: Colors.deepOrange
                    )),

                const SizedBox(height: 45),
                // implement the rating bar
                RatingBar(
                    initialRating: 0,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    ratingWidget: RatingWidget(
                        full: const Icon(Icons.star, color: Colors.orange),
                        half: const Icon(
                          Icons.star_half,
                          color: Colors.orange,
                        ),
                        empty: const Icon(
                          Icons.star_outline,
                          color: Colors.orange,
                        )),
                    onRatingUpdate: (value) {
                      setState(() {
                        _ratingValue = value;
                      });
                    }),
                const SizedBox(height: 25),
                // Display the rate in number
                Container(
                  width: 200,
                  height: 200,
                  decoration: const BoxDecoration(
                      color: Colors.red, shape: BoxShape.circle),
                  alignment: Alignment.center,
                  child: Text(
                    _ratingValue != null ? _ratingValue.toString() : '0',
                    style: const TextStyle(color: Colors.white, fontSize: 30),
                  ),
                )
            // RatingBar.builder(
            //   initialRating: 3,
            //   itemCount: 5,
            //   itemBuilder: (context, index) {
            //     switch (index) {
            //       case 0:
            //         return Icon(
            //           Icons.sentiment_very_dissatisfied,
            //           color: Colors.red,
            //         );
            //       case 1:
            //         return Icon(
            //           Icons.sentiment_dissatisfied,
            //           color: Colors.redAccent,
            //         );
            //       case 2:
            //         return Icon(
            //           Icons.sentiment_neutral,
            //           color: Colors.amber,
            //         );
            //       case 3:
            //         return Icon(
            //           Icons.sentiment_satisfied,
            //           color: Colors.lightGreen,
            //         );
            //       case 4:
            //         return Icon(
            //           Icons.sentiment_very_satisfied,
            //           color: Colors.green,
            //         );
            //     }
            //   },
            //   onRatingUpdate: (rating) {
            //     print(rating);
            //   }
            // )
              ,
            ])
          ),
        ));
  }
}