import 'package:flutter/material.dart';
import '../data/mock_data.dart';
import '../l10n/app_localizations.dart';
import '../state/locale_notifier.dart';
import '../widgets/featured_carousel.dart';
import '../widgets/product_card.dart';
import '../widgets/hot_offer_card.dart';
import '../widgets/section_header.dart';
import 'welcome_screen.dart';

/// Feature 4: Interactive Shopping Page displaying Featured Carousel, 2-Column GridView, and 5 Hot Offers.
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final isAr = localeNotifier.isArabic;

    final ourProductsTitle = l10n?.ourProducts ?? 'Our Products';
    final featuredTitle = l10n?.featuredProducts ?? 'Featured Collections';
    final hotOffersTitle = l10n?.hotOffers ?? 'Hot Offers';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          ourProductsTitle,
          style: const TextStyle(
            fontFamily: 'Suwannaphum',
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        actions: [
          // Language switcher button
          IconButton(
            tooltip: isAr ? 'Switch to English' : 'التحويل للعربية',
            icon: const Icon(Icons.language_rounded),
            onPressed: () {
              localeNotifier.toggleLocale();
            },
          ),
          // Logout / Return to Welcome button
          IconButton(
            tooltip: 'Logout',
            icon: const Icon(Icons.logout_rounded),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (_) => const WelcomeScreen()),
                (route) => false,
              );
            },
          ),
          const SizedBox(width: 6),
        ],
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(
            child: SizedBox(height: 12),
          ),

          // Section 1: Featured Carousel Header & Horizontal PageView
          SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SectionHeader(
                  title: featuredTitle,
                  subtitle: isAr
                      ? 'أحدث العروض الحصرية لهذا الموسم'
                      : 'Exclusive handpicked deals for you',
                ),
                const SizedBox(height: 6),
                const FeaturedCarousel(),
                const SizedBox(height: 16),
              ],
            ),
          ),

          // Section 2: Products Grid Header
          SliverToBoxAdapter(
            child: SectionHeader(
              title: ourProductsTitle,
              subtitle: isAr
                  ? 'تسوق أفضل المنتجات عالية الجودة'
                  : 'Explore top rated & trending products',
            ),
          ),

          // Section 2: Responsive 2-Column GridView of Products (Requirement)
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: 0.72,
              ),
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final product = MockData.products[index];
                  return ProductCard(product: product);
                },
                childCount: MockData.products.length,
              ),
            ),
          ),

          // Section 3: Hot Offers Header
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(top: 24.0, bottom: 4.0),
              child: SectionHeader(
                title: hotOffersTitle,
                subtitle: isAr
                    ? 'عروض وتخفيضات محدودة الوقت'
                    : 'Unmissable limited time seasonal savings',
              ),
            ),
          ),

          // Section 3: Hot Offers Section built using ListView.builder with 5 items (Requirement)
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final offer = MockData.hotOffers[index];
                return HotOfferCard(offer: offer);
              },
              childCount: MockData.hotOffers.length, // Exactly 5 offers
            ),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(height: 32),
          ),
        ],
      ),
    );
  }
}
