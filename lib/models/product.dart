/// Model representing a shopping product.
class Product {
  final String id;
  final String title;
  final String titleAr;
  final double price;
  final String imageUrl;
  final String category;
  final double rating;

  const Product({
    required this.id,
    required this.title,
    required this.titleAr,
    required this.price,
    required this.imageUrl,
    required this.category,
    this.rating = 4.8,
  });

  /// Returns localized title based on language code
  String getLocalizedTitle(String languageCode) {
    return languageCode == 'ar' ? titleAr : title;
  }
}
