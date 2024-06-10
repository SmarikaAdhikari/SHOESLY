class BrandModel {
  final String brandName;
  final String brandImage;
  final String totalProducts;

  BrandModel({
    required this.brandName,
    required this.brandImage,
    required this.totalProducts,
  });
}

List<BrandModel> brands = [
  BrandModel(
    brandName: "Nike",
    brandImage: "images/brands/BrandNike.png",
    totalProducts: "5",
  ),
  BrandModel(
    brandName: "Adidas",
    brandImage: "images/brands/BrandAdidas.png",
    totalProducts: "3",
  ),
    BrandModel(
    brandName: "Jordan",
    brandImage: "images/brands/BrandJordan.png",
    totalProducts: "2",
  ),
  BrandModel(
    brandName: "Puma",
    brandImage: "images/brands/BrandPuma.png",
    totalProducts: "0",
  ),
  BrandModel(
    brandName: "Reebok",
    brandImage: "images/brands/BrandReebok.png",
    totalProducts: "0",
  ),
  BrandModel(
    brandName: "Vans",
    brandImage: "images/brands/BrandVans.png",
    totalProducts: "0",
  ),

];
