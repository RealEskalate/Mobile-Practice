
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:shimmer/shimmer.dart';

import 'components/article_card_loading.dart';

class ArticlesLoadingPage extends StatelessWidget {
  const ArticlesLoadingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        children: [
          
          ListView.builder(
            shrinkWrap: true,
            itemCount: 6,
            itemBuilder: (context, index) {
              return ArticleCardLoading();
            },
          ),
        ],
      ),
    );
  }
}
