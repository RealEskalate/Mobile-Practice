class Article {
  final String title;
  final String content;
  final String authorName;
  final String authorProfileUrl;
  final String imageUrl;
  final double ratingValue;
  final int numberOfComments;
  final DateTime createdAt;

  Article(
      {required this.title,
      required this.content,
      required this.authorName,
      required this.authorProfileUrl,
      required this.imageUrl,
      required this.ratingValue,
      required this.numberOfComments,
      required this.createdAt});

// factory Article.fromJson(Map<String,dynamic> json){
//   return Article(title: json[''], content: content, authorName: authorName,
//    ratingValue: ratingValue, numberOfComments: numberOfComments, createdAt: createdAt)
// }
  factory Article.sample(
      {String title = "Text1",
      String authorName = "Adrian Smith",
      String content =
          'Daily Facebook users up again after decline But Facebook owner Meta is struggling with Daily Facebook users up again after decline But Facebook owner Meta is struggling with',
      double ratingValue = 4.5,
      int numberOfComments = 16,
      String authorProfileUrl =
          "https://previews.123rf.com/images/rido/rido2002/rido200200099/141040315-happy-smiling-african-doctor-looking-at-camera-in-medical-office-portrait-of-black-man-doctor-workin.jpg?fj=1",
      String imageUrl =
          "https://ichef.bbci.co.uk/news/976/cpsprodpb/4A61/production/_124314091_hi065097776.jpg",
      DateTime? createdAt}) {
    return Article(
        title: title,
        content: content,
        authorName: authorName,
        imageUrl: imageUrl,
        authorProfileUrl: authorProfileUrl,
        ratingValue: ratingValue,
        numberOfComments: numberOfComments,
        createdAt: createdAt ?? DateTime.now());
  }
}
