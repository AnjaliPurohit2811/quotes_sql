class quoteModel {
  final String quote;
  final String author;
  final String category;

  quoteModel({required this.quote, required this.author , required this.category});

  factory quoteModel.fromJson(Map<String, dynamic> json) {
    return quoteModel(
      quote: json['quote'],
      author: json['author'],
      category: json['category'],
    );
  }
}