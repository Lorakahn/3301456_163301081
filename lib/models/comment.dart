class Comment {
  late String picture;
  late String name;
  late int date;
  late double rating;
  late String review;

  Comment({
    required this.picture,
    required this.name,
    required this.date,
    required this.rating,
    required this.review,
  });

  Map<String, dynamic> toJson() {
    return {
      'picture':
          'https://gravatar.com/avatar/b1901ccf69bebe0c9b49351eb5e6f3c4?s=400&d=robohash&r=x',
      'name': name,
      'date': DateTime.now().millisecondsSinceEpoch,
      'rating': rating,
      'review': review,
    };
  }

  Comment.fromJson({required Map<String, dynamic> map}) {
    date = map['date'];
    picture = map['picture'];
    rating = map['rating'];
    review = map['review'];
    name = map['name'];
  }
}
