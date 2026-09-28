/// Model representing a hot promotional offer.
class Offer {
  final String id;
  final String title;
  final String titleAr;
  final String description;
  final String descriptionAr;
  final String discountPercentage;
  final String imageUrl;
  final String code;

  const Offer({
    required this.id,
    required this.title,
    required this.titleAr,
    required this.description,
    required this.descriptionAr,
    required this.discountPercentage,
    required this.imageUrl,
    required this.code,
  });

  /// Returns localized title
  String getLocalizedTitle(String languageCode) {
    return languageCode == 'ar' ? titleAr : title;
  }

  /// Returns localized description
  String getLocalizedDescription(String languageCode) {
    return languageCode == 'ar' ? descriptionAr : description;
  }
}
