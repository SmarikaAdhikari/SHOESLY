import 'package:flutter/material.dart';
import 'package:shoesly/Constants/theme.dart';
import 'package:shoesly/Data/Model/product_model.dart';
import 'package:shoesly/Widgets/reviews_widget.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key, required this.product});
  final Product product;

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Reviews',
            style: Apptheme.titlebar,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                const Icon(Icons.star, color: yellow, size: 20),
                Text(
                  widget.product.rating.toString(),
                  style: Ordertheme.title,
                ),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15),
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  ReviewCard(
                    title: 'All',
                  ),
                  ReviewCard(
                    title: '5 Stars',
                  ),
                  ReviewCard(
                    title: '4 Stars',
                  ),
                  ReviewCard(
                    title: '3 Stars',
                  ),
                  ReviewCard(
                    title: '2 Stars',
                  ),
                  ReviewCard(
                    title: '1 Star',
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: widget.product.reviews.length,
                  itemBuilder: (context, index) {
                    return reviewList(
                      widget.product.reviews[index],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  const ReviewCard({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(title, style: Reviewtheme.brand),
    );
  }
}
