import '../models/product.dart';
import '../models/offer.dart';

/// Centralized repository of mock data for the shopping app.
class MockData {
  /// Featured carousel images for horizontal PageView
  static const List<Map<String, String>> featuredBanners = [
    {
      'imageUrl': 'https://images.unsplash.com/photo-1441986300917-64674bd600d8?w=800&auto=format&fit=crop&q=80',
      'titleEn': 'Summer Super Sale',
      'titleAr': 'تخفيضات الصيف الكبرى',
      'subtitleEn': 'Up to 60% off on premium collection',
      'subtitleAr': 'خصم يصل إلى 60% على التشكيلة المميزة',
    },
    {
      'imageUrl': 'https://images.unsplash.com/photo-1511556532299-8f662fc26c06?w=800&auto=format&fit=crop&q=80',
      'titleEn': 'Latest Tech Gadgets',
      'titleAr': 'أحدث الإلكترونيات الذكية',
      'subtitleEn': 'Experience next-generation devices',
      'subtitleAr': 'عش تجربة أحدث الأجهزة العصرية',
    },
    {
      'imageUrl': 'https://images.unsplash.com/photo-1490481651871-ab68de25d43d?w=800&auto=format&fit=crop&q=80',
      'titleEn': 'Fashion & Accessories',
      'titleAr': 'أزياء وإكسسوارات عصرية',
      'subtitleEn': 'Exclusive styles just for you',
      'subtitleAr': 'إطلالات حصرية صممت لأجلك',
    },
  ];

  /// Product list for the 2-column GridView
  static const List<Product> products = [
    Product(
      id: 'p1',
      title: 'Premium Wireless Headphones',
      titleAr: 'سماعات لاسلكية فاخرة',
      price: 129.99,
      imageUrl: 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=500&auto=format&fit=crop&q=80',
      category: 'Electronics',
      rating: 4.9,
    ),
    Product(
      id: 'p2',
      title: 'Minimalist Modern Watch',
      titleAr: 'ساعة يد عصرية أنيقة',
      price: 189.50,
      imageUrl: 'https://images.unsplash.com/photo-1523275335684-37898b6baf30?w=500&auto=format&fit=crop&q=80',
      category: 'Accessories',
      rating: 4.8,
    ),
    Product(
      id: 'p3',
      title: 'Classic Leather Backpack',
      titleAr: 'حقيبة ظهر جلدية كلاسيكية',
      price: 79.00,
      imageUrl: 'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=500&auto=format&fit=crop&q=80',
      category: 'Fashion',
      rating: 4.7,
    ),
    Product(
      id: 'p4',
      title: 'Pro Running Sneakers',
      titleAr: 'حذاء رياضي احترافي للجري',
      price: 110.00,
      imageUrl: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff?w=500&auto=format&fit=crop&q=80',
      category: 'Footwear',
      rating: 4.9,
    ),
    Product(
      id: 'p5',
      title: 'Smart Fitness Tracker',
      titleAr: 'سوار ذكي لتتبع اللياقة',
      price: 59.99,
      imageUrl: 'https://images.unsplash.com/photo-1575311373937-040b8e1fd5b6?w=500&auto=format&fit=crop&q=80',
      category: 'Electronics',
      rating: 4.6,
    ),
    Product(
      id: 'p6',
      title: 'Polarized Sunglasses',
      titleAr: 'نظارات شمسية مستقطبة',
      price: 45.00,
      imageUrl: 'https://images.unsplash.com/photo-1511499767150-a48a237f0083?w=500&auto=format&fit=crop&q=80',
      category: 'Accessories',
      rating: 4.7,
    ),
  ];

  /// Exactly 5 Hot Offers for ListView.builder requirement
  static const List<Offer> hotOffers = [
    Offer(
      id: 'o1',
      title: 'Flash Weekend Deal',
      titleAr: 'عرض نهاية الأسبوع الخاطف',
      description: 'Get an extra 50% discount on all trending electronics and audio equipment.',
      descriptionAr: 'احصل على خصم إضافي 50% على جميع الإلكترونيات وسماعات الصوت الرائجة.',
      discountPercentage: '50%',
      imageUrl: 'https://images.unsplash.com/photo-1608231387042-66d1773070a5?w=500&auto=format&fit=crop&q=80',
      code: 'FLASH50',
    ),
    Offer(
      id: 'o2',
      title: 'Buy 1 Get 1 Free on Footwear',
      titleAr: 'اشتري قطعة واحصل على الثانية مجاناً',
      description: 'Special seasonal promotion on all athletic footwear and sportswear.',
      descriptionAr: 'عرض موسمي مميز على جميع الأحذية الرياضية والملابس الحركية.',
      discountPercentage: 'BOGO',
      imageUrl: 'https://images.unsplash.com/photo-1595950653106-6c9ebd614d3a?w=500&auto=format&fit=crop&q=80',
      code: 'BOGO2026',
    ),
    Offer(
      id: 'o3',
      title: 'Luxury Watches Clearance',
      titleAr: 'تصفية الساعات الفاخرة',
      description: 'Exclusive 40% voucher on Swiss movements and luxury chronograph models.',
      descriptionAr: 'قسيمة حصرية 40% على الساعات السويسرية والكرونوغراف الفاخرة.',
      discountPercentage: '40%',
      imageUrl: 'https://images.unsplash.com/photo-1522335789203-aabd1fc54bc9?w=500&auto=format&fit=crop&q=80',
      code: 'LUXURY40',
    ),
    Offer(
      id: 'o4',
      title: 'Free Express Shipping',
      titleAr: 'شحن سريع مجاني لكافة الطلبات',
      description: 'Zero delivery fees on all orders exceeding \$50 within 24 hours.',
      descriptionAr: 'شحن مجاني بالكامل لجميع الطلبات التي تتجاوز قيمتها 50 دولاراً.',
      discountPercentage: 'FREE',
      imageUrl: 'https://images.unsplash.com/photo-1586880244406-556ebe35f282?w=500&auto=format&fit=crop&q=80',
      code: 'FREESHIP',
    ),
    Offer(
      id: 'o5',
      title: 'New Member Welcome Bonus',
      titleAr: 'مكافأة ترحيبية للأعضاء الجدد',
      description: 'Instant 25% off coupon automatically applied to your very first checkout.',
      descriptionAr: 'خصم فوري 25% يطبق تلقائياً على أول عملية شراء لك في التطبيق.',
      discountPercentage: '25%',
      imageUrl: 'https://images.unsplash.com/photo-1607083206869-4c7672e72a8a?w=500&auto=format&fit=crop&q=80',
      code: 'WELCOME25',
    ),
  ];
}
