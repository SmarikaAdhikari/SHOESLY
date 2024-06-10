import 'package:shoesly/Data/Model/brand_model.dart';

class Review {
  final String reviewerName;
  final String comment;
  final double rating;

  Review(
      {required this.reviewerName,
      required this.comment,
      required this.rating});
}

class Product {
  final int pid;
  final List<String> images;
  final List<String> colors;
  final String name;
  final List<String> sizes;
  final String shortdescription;
  final String description;
  final List<Review> reviews;
  final int totalReviewCount;
  final List<BrandModel> brands;
  final String brandimage;
  final double price;
  final double rating;
  int qty;
  bool isSelected = false;

  Product({
    required this.pid,
    required this.images,
    required this.colors,
    required this.name,
    required this.sizes,
    required this.shortdescription,
    required this.description,
    required this.reviews,
    required this.totalReviewCount,
    required this.brands,
    required this.brandimage,
    required this.price,
    this.rating = 4.5,
    this.qty = 1,
    this.isSelected = false,
  });

  Product copyWith({
    int? pid,
    List<String>? images,
    List<String>? colors,
    String? name,
    List<String>? sizes,
    String? shortdescription,
    String? description,
    List<Review>? reviews,
    int? totalReviewCount,
    List<BrandModel>? brands,
    String? brandimage,
    double? price,
    double? rating,
    int? qty,
    bool? isSelected,
  }) {
    return Product(
      pid: pid ?? this.pid,
      images: images ?? this.images,
      colors: colors ?? this.colors,
      name: name ?? this.name,
      sizes: sizes ?? this.sizes,
      shortdescription: shortdescription ?? this.shortdescription,
      description: description ?? this.description,
      reviews: reviews ?? this.reviews,
      totalReviewCount: totalReviewCount ?? this.totalReviewCount,
      brands: brands ?? this.brands,
      brandimage: brandimage ?? this.brandimage,
      price: price ?? this.price,
      rating: rating ?? this.rating,
      qty: qty ?? this.qty,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  List<Review> get top3Reviews => reviews.take(3).toList();
}

List<Product> product = [
  Product(
    pid: 1,
    images: [
      'images/shoes/NikeS.png',
      'images/shoes/NikeN.png',
    ],
    colors: ['Red', 'Blue', 'Green'],
    name: 'Nike 1 Retro High OG',
    sizes: [
      'S',
      'N',
    ],
    shortdescription: 'Nike. Blue. 40 ',
    description:
        "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a pair. ",
    reviews: [
      Review(
          reviewerName: 'Jack Ma',
          comment: 'The quality is top notch',
          rating: 4.8),
      Review(reviewerName: 'John Doe', comment: 'Great product!', rating: 4.5),
      Review(
          reviewerName: 'Jane Smith',
          comment: 'Very comfortable.',
          rating: 4.0),
      Review(
          reviewerName: 'Emily John',
          comment: 'Good value for money.',
          rating: 4.8),
    ],
    totalReviewCount: 4,
    brands: brands,
    brandimage: 'images/brands/NikeGrey.png',
    price: 450.99,
    rating: 4,
  ),
  Product(
    pid: 2,
    images: [
      'images/shoes/JordanS.png',
      'images/shoes/JordanN.png',
    ],
    colors: ['Red', 'Blue', 'Green'],
    name: 'Jordan 1 Retro High OG',
    sizes: [
      'S',
      'N',
    ],
    shortdescription: 'Jordan. Red. 40 ',
    description:
        "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a pair. ",
    reviews: [
      Review(reviewerName: 'John Doe', comment: 'Great product!', rating: 4.5),
      Review(
          reviewerName: 'Jane Smith',
          comment: 'Very comfortable.',
          rating: 4.0),
      Review(
          reviewerName: 'Emily John',
          comment: 'Good value for money.',
          rating: 4.8),
      Review(
          reviewerName: 'Jack Ma',
          comment: 'The quality is top notch',
          rating: 4.8),
    ],
    totalReviewCount: 4,
    brands: brands,
    brandimage: 'images/brands/JordanGrey.png',
    price: 225.99,
    rating: 4.5,
  ),
  Product(
    pid: 3,
    images: [
      'images/shoes/IIAdidasS.png',
      'images/shoes/IIAdidasN.png',
    ],
    colors: ['Red', 'Blue', 'Green'],
    name: 'Adidas 1 Retro High OG',
    sizes: [
      'S',
      'N',
    ],
    shortdescription: 'Adidas. White. 40 ',
    description:
        "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a pair. ",
    reviews: [
      Review(
          reviewerName: 'Jack Ma',
          comment: 'The quality is top notch',
          rating: 4.8),
      Review(reviewerName: 'John Doe', comment: 'Great product!', rating: 4.5),
      Review(
          reviewerName: 'Jane Smith',
          comment: 'Very comfortable.',
          rating: 4.0),
      Review(
          reviewerName: 'Emily John',
          comment: 'Good value for money.',
          rating: 4.8),
    ],
    totalReviewCount: 150,
    brands: brands,
    brandimage: 'images/brands/AdidasGrey.png',
    price: 200.99,
    rating: 5,
  ),
  Product(
    pid: 4,
    images: [
      'images/shoes/IVNikeS.png',
      'images/shoes/IVNikeN.png',
    ],
    colors: ['Red', 'Blue', 'Green'],
    name: 'Nike 1 Retro High OG',
    sizes: [
      'S',
      'N',
    ],
    shortdescription: 'Nike. Greywhite. 40 ',
    description:
        "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a pair. ",
    reviews: [
      Review(reviewerName: 'John Doe', comment: 'Great product!', rating: 4.5),
      Review(
          reviewerName: 'Jane Smith',
          comment: 'Very comfortable.',
          rating: 4.0),
      Review(
          reviewerName: 'Emily John',
          comment: 'Good value for money.',
          rating: 4.8),
    ],
    totalReviewCount: 3,
    brands: brands,
    brandimage: 'images/brands/NikeGrey.png',
    price: 450.99,
    rating: 4,
  ),
  Product(
    pid: 5,
    images: [
      'images/shoes/IIJordanS.png',
      'images/shoes/IIJordanN.png',
    ],
    colors: ['Red', 'Blue', 'Green'],
    name: 'Jordan 1 Retro High OG',
    sizes: [
      'S',
      'N',
    ],
    shortdescription: 'Jordan. WhiteBlack. 40 ',
    description:
        "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a pair. ",
    reviews: [
      Review(reviewerName: 'John Doe', comment: 'Great product!', rating: 4.5),
      Review(
          reviewerName: 'Jane Smith',
          comment: 'Very comfortable.',
          rating: 4.0),
      Review(
          reviewerName: 'Emily John',
          comment: 'Good value for money.',
          rating: 4.8),
    ],
    totalReviewCount: 3,
    brands: brands,
    brandimage: 'images/brands/JordanGrey.png',
    price: 600.99,
    rating: 4,
  ),
  Product(
    pid: 6,
    images: [
      'images/shoes/IINikeS.png',
      'images/shoes/IINikeN.png',
    ],
    colors: ['Red', 'Blue', 'Green'],
    name: 'Jordan 1 Retro High OG',
    sizes: [
      'S',
      'N',
    ],
    shortdescription: 'Nike. Grey. 40 ',
    description:
        "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a pair. ",
    reviews: [
      Review(reviewerName: 'John Doe', comment: 'Great product!', rating: 4.5),
      Review(
          reviewerName: 'Jane Smith',
          comment: 'Very comfortable.',
          rating: 4.0),
      Review(
          reviewerName: 'Emily John',
          comment: 'Good value for money.',
          rating: 4.8),
    ],
    totalReviewCount: 3,
    brands: brands,
    brandimage: 'images/brands/NikeGrey.png',
    price: 300.99,
    rating: 3.5,
  ),
  Product(
    pid: 7,
    images: [
      'images/shoes/AdidasS.png',
      'images/shoes/AdidasN.png',
    ],
    colors: ['Red', 'Blue', 'Green'],
    name: 'Adidas Yeezy Boost 350 V2',
    sizes: [
      'S',
      'N',
    ],
    description:
        "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a pair. ",
    shortdescription: 'Adidas. Grey. 40 ',
    reviews: [
      Review(reviewerName: 'John Doe', comment: 'Great product!', rating: 4.5),
      Review(
          reviewerName: 'Jane Smith',
          comment: 'Very comfortable.',
          rating: 4.0),
      Review(
          reviewerName: 'Emily John',
          comment: 'Good value for money.',
          rating: 4.8),
    ],
    totalReviewCount: 3,
    brands: brands,
    brandimage: 'images/brands/AdidasGrey.png',
    price: 567.99,
    rating: 4,
  ),
  Product(
    pid: 8,
    images: [
      'images/shoes/VNikeS.png',
      'images/shoes/VNikeN.png',
    ],
    colors: ['Red', 'Blue', 'Green'],
    name: 'Nike 1 Retro High OG',
    sizes: [
      'S',
      'N',
    ],
    shortdescription: 'Nike. Green. 40 ',
    description:
        "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a pair. ",
    reviews: [
      Review(reviewerName: 'John Doe', comment: 'Great product!', rating: 4.5),
      Review(
          reviewerName: 'Jane Smith',
          comment: 'Very comfortable.',
          rating: 4.0),
      Review(
          reviewerName: 'Emily John',
          comment: 'Good value for money.',
          rating: 4.8),
    ],
    totalReviewCount: 3,
    brands: brands,
    brandimage: 'images/brands/NikeGrey.png',
    price: 450.99,
    rating: 4,
  ),
  Product(
    pid: 9,
    images: [
      'images/shoes/IIIAdidasN.png',
      'images/shoes/IIIAdidasS.png',
    ],
    colors: ['Red', 'Blue', 'Green'],
    name: 'Adidas 1 Retro High OG',
    sizes: [
      'S',
      'N',
    ],
    shortdescription: 'Adidas. Grey. 40 ',
    description:
        "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a pair. ",
    reviews: [
      Review(reviewerName: 'John Doe', comment: 'Great product!', rating: 4.5),
      Review(
          reviewerName: 'Jane Smith',
          comment: 'Very comfortable.',
          rating: 4.0),
      Review(
          reviewerName: 'Emily John',
          comment: 'Good value for money.',
          rating: 4.8),
    ],
    totalReviewCount: 3,
    brands: brands,
    brandimage: 'images/brands/AdidasGrey.png',
    price: 300.99,
    rating: 5,
  ),
  Product(
    pid: 10,
    images: [
      'images/shoes/IIINikeS.png',
      'images/shoes/IIINikeN.png',
    ],
    colors: ['Red', 'Blue', 'Green'],
    name: 'Nike 1 Retro High OG',
    sizes: [
      'S',
      'N',
    ],
    shortdescription: 'Nike. BlueBlack. 40 ',
    description:
        "Engineered to crush any movement-based workout, these On sneakers enhance the label's original Cloud sneaker with cutting edge technologies for a pair. ",
    reviews: [
      Review(reviewerName: 'John Doe', comment: 'Great product!', rating: 4.5),
      Review(
          reviewerName: 'Jane Smith',
          comment: 'Very comfortable.',
          rating: 4.0),
      Review(
          reviewerName: 'Emily John',
          comment: 'Good value for money.',
          rating: 4.8),
    ],
    totalReviewCount: 3,
    brands: brands,
    brandimage: 'images/brands/NikeGrey.png',
    price: 450.99,
    rating: 4,
  ),
];
