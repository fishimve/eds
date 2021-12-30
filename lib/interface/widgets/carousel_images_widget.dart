import 'package:carousel_slider/carousel_slider.dart';
import 'package:eds_test/interface/shared/ui_helpers.dart';
import 'package:flutter/material.dart';

class CarouselImagesWidget extends StatefulWidget {
  final List<String> imageUrls;
  const CarouselImagesWidget({Key? key, required this.imageUrls})
      : super(key: key);

  @override
  _CarouselImagesWidgetState createState() => _CarouselImagesWidgetState();
}

class _CarouselImagesWidgetState extends State<CarouselImagesWidget> {
  final _controller = CarouselController();
  var _current = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: basePadding,
      child: Column(
        children: [
          CarouselSlider.builder(
            carouselController: _controller,
            itemCount: widget.imageUrls.length,
            options: CarouselOptions(
              aspectRatio: 16 / 9,
              enableInfiniteScroll: true,
              viewportFraction: 1,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 10),
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
              autoPlayCurve: Curves.easeIn,
              enlargeCenterPage: false,
              onPageChanged: (index, reason) {
                setState(() {
                  _current = index;
                });
              },
              scrollDirection: Axis.horizontal,
            ),
            itemBuilder: (ctx, index, readlIndex) => ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(
                widget.imageUrls[index],
                fit: BoxFit.cover,
                width: 1000.0,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: widget.imageUrls.asMap().entries.map((entry) {
              return GestureDetector(
                onTap: () => _controller.animateToPage(entry.key),
                child: Container(
                  width: 12.0,
                  height: 12.0,
                  margin: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 4.0,
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context)
                        .primaryColor
                        .withOpacity(_current == entry.key ? 0.9 : 0.4),
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
