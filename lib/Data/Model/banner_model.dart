class Banner {
  String image;
  String title;
  double price;
  Banner({
    required this.image,
    required this.title,
    required this.price,
  });
}

List<Banner> banner = [
  Banner(
      image: 'images/shoes/JordanN.png',
      title: 'Jordan Air 1 Retro High OG',
      price: 225.99),
  Banner(
      image: 'images/shoes/NikeN.png',
      title: 'Adidas Yeezy Boost 350 V2',
      price: 450.99),
  Banner(
      image: 'images/shoes/IIAdidasS.png',
      title: 'Nike Air MAX 270 React',
      price: 200.99),
];
