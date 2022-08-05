import 'package:blog_app/features/articles/presentation/articles_detail/articles_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:readmore/readmore.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../../models/article.dart';
import '../../../utils/assets.dart';
import '../../../utils/colors.dart';
import '../../../utils/date_formatter.dart';
import '../../../utils/styles.dart';
import 'circular_avatar.dart';

class ArticleCard extends StatelessWidget {
  final Article article;
  const ArticleCard({
    Key? key,
    required this.article,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ArticleDetail.routeName,
            arguments: article);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Card(
          elevation: 2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(children: [
                Header(
                  profileUrl: article.authorProfileUrl,
                  title: article.authorName,
                  subtitle: DateFormatter.dateFormatter(article.createdAt),
                ),
                const SizedBox(
                  height: 8,
                ),
                Body(
                  imageUrl: article.imageUrl,
                  content: article.title,
                  numberOfComments: article.numberOfComments,
                ),
                const Divider(
                  thickness: 2,
                ),
                Footer(
                  ratingValue: article.ratingValue,
                )
              ])),
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  final String imageUrl;
  final String content;
  final int numberOfComments;

  const Body(
      {Key? key,
      required this.imageUrl,
      required this.content,
      required this.numberOfComments})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ReadMoreText(
          content,
          trimLines: 2,
          trimMode: TrimMode.Line,
          trimCollapsedText: 'see more',
          trimExpandedText: 'see less',
          lessStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: CustomColors.buttonBoarder),
          moreStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: CustomColors.buttonBoarder),
        ),
        const SizedBox(
          height: 24,
        ),
        Image.network(
          imageUrl,
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        loadingProgress.expectedTotalBytes!
                    : null,
              ),
            );
          },
          //height: 300,
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              numberOfComments.toString(),
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 4,
            ),
            const Text("Comments")
          ],
        )
      ],
    );
  }
}

class Header extends StatelessWidget {
  final String profileUrl;
  final String title;
  final String subtitle;
  const Header(
      {Key? key,
      required this.profileUrl,
      required this.title,
      required this.subtitle})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircularAvator(imageUrl: profileUrl),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Styles.articleCardTitleStyle,
                ),
                Text(subtitle, style: Theme.of(context).textTheme.caption)
              ],
            )
          ],
        ),
        InkWell(
          child: GestureDetector(
            onTap: () {
              debugPrint("more");
            },
            child: SvgPicture.asset(Assets.more, semanticsLabel: 'More icon'),
          ),
        )
      ],
    );
  }
}

class Footer extends StatelessWidget {
  final double ratingValue;
  const Footer({Key? key, required this.ratingValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Row(
        children: [
          TextButton(
            style: TextButton.styleFrom(),
            onPressed: () {
              debugPrint('Button Pressed');
            },
            child: Column(
              children: [
                SvgPicture.asset(Assets.comment,
                    semanticsLabel: 'Comment icon'),
                Text('Comment',
                    style: Theme.of(context)
                        .textTheme
                        .button!
                        .copyWith(fontWeight: FontWeight.normal)),
              ],
            ),
          ),
          RatingValue(
            value: ratingValue,
          ),
        ],
      ),
      RatingBar.builder(
        itemSize: 28,
        initialRating: 3,
        minRating: 1,
        direction: Axis.horizontal,
        allowHalfRating: true,
        itemCount: 5,
        itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
        itemBuilder: (context, _) => const Icon(
          Icons.star,
          color: CustomColors.ratingColor,
        ),
        onRatingUpdate: (rating) {
          debugPrint(rating.toString());
        },
      )
    ]);
  }
}

class RatingValue extends StatelessWidget {
  final double value;
  final int totalRating;
  const RatingValue({Key? key, this.totalRating = 5, this.value = 0.0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(Assets.star, semanticsLabel: 'Star icon'),
        const SizedBox(width: 0.0),
        Text(
          value.toStringAsFixed(1),
          style: Styles.ratingValue,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            "/$totalRating",
            style: Styles.ratingTotal,
          ),
        )
      ],
    );
  }
}
