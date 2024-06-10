import 'package:flutter/material.dart';
import 'package:range_slider_flutter/range_slider_flutter.dart';
import 'package:shoesly/Constants/theme.dart';
import 'package:shoesly/Data/Model/brand_model.dart';
import 'package:shoesly/Widgets/brand_widget.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  double _lowerValue = 0;
  double _upperValue = 1750;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Filter',
            style: Apptheme.titlebar,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text("Brands", style: Producttheme.filter),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
                height: 120,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: brands.length,
                  itemBuilder: (context, index) => brandlist(
                    brands[index],
                  ),
                )),
            const SizedBox(
              height: 20,
            ),
            const Text("Price Range (\$)", style: Producttheme.filter),
            Container(
                padding: const EdgeInsets.only(right: 20),
                height: 80,
                child: RangeSliderFlutter(
                  values: [_lowerValue, _upperValue],
                  rangeSlider: true,
                  tooltip: RangeSliderFlutterTooltip(
                    alwaysShowTooltip: true,
                  ),
                  max: 1750,
                  textPositionTop: -60,
                  handlerHeight: 30,
                  trackBar: RangeSliderFlutterTrackBar(
                    activeTrackBarHeight: 10,
                    inactiveTrackBarHeight: 3,
                    activeTrackBar: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black,
                    ),
                    inactiveTrackBar: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.grey,
                    ),
                  ),
                  min: 0,
                  fontSize: 10,
                  textBackgroundColor: Colors.black,
                  onDragging: (handlerIndex, lowerValue, upperValue) {
                    _lowerValue = lowerValue;
                    _upperValue = upperValue;
                    setState(() {});
                  },
                )),
            const Text("Sort By", style: Producttheme.filter),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  choicecard("Most recent"),
                  const SizedBox(
                    width: 10,
                  ),
                  choicecard("Lowest price"),
                  const SizedBox(
                    width: 10,
                  ),
                  choicecard("Highest price"),
                  const SizedBox(
                    width: 10,
                  ),
                  choicecard("Low to High"),
                  const SizedBox(
                    width: 10,
                  ),
                  choicecard(" High to Low"),
                  const SizedBox(
                    width: 10,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text("Gender", style: Producttheme.filter),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  choicecard("Man"),
                  const SizedBox(
                    width: 10,
                  ),
                  choicecard("Woman"),
                  const SizedBox(
                    width: 10,
                  ),
                  choicecard("Unisex"),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text("Color", style: Producttheme.filter),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 50,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  choiceColor("Black", color: black),
                  const SizedBox(
                    width: 10,
                  ),
                  choiceColor("White", color: white),
                  const SizedBox(
                    width: 10,
                  ),
                  choiceColor("Red", color: red),
                  const SizedBox(
                    width: 10,
                  ),
                  choiceColor("Blue", color: blue),
                  const SizedBox(
                    width: 10,
                  ),
                  choiceColor("Grey", color: grey),
                  const SizedBox(
                    width: 10,
                  ),
                  choiceColor("Yellow", color: yellow),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Center(
              child: Row(children: [
                const SizedBox(
                  width: 50,
                ),
                choicecard("RESET"),
                const SizedBox(
                  width: 10,
                ),
                choicecard("APPLY"),
              ]),
            )
          ]),
        ));
  }

  Container choicecard(String text) {
    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width / 3.2,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: white,
        border: Border.all(color: grey),
      ),
      child: Center(
        child: Text(
          text,
          style: Producttheme.topic,
        ),
      ),
    );
  }

  Container choiceColor(String text, {required Color color}) {
    return Container(
      height: 40,
      width: MediaQuery.of(context).size.width / 3.2,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: white,
        border: Border.all(color: grey),
      ),
      child: Center(
        child: Row(
          children: [
            const SizedBox(
              width: 10,
            ),
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: color,
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: Producttheme.topic,
            ),
          ],
        ),
      ),
    );
  }
}
