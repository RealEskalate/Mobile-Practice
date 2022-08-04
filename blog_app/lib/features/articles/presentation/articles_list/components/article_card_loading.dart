import 'package:flutter/material.dart';

class ArticleCardLoading extends StatelessWidget {
  const ArticleCardLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 48.0,
              height: 48.0,
              decoration: const BoxDecoration(
                  color: Colors.white, shape: BoxShape.circle),
            ),
            const Padding(
                padding: EdgeInsets.symmetric(
              horizontal: 4,
            )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  width: 96,
                  height: 16,
                  color: Colors.white,
                ),
                const Padding(padding: EdgeInsets.symmetric(vertical: 4)),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  width: 32,
                  height: 12,
                  color: Colors.white,
                ),
              ],
            )
          ],
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
        ),
        Container(
          width: double.infinity,
          height: 200,
          color: Colors.white,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0),
        ),
      ],
    );
  }
}
