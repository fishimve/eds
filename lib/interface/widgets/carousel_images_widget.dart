import 'package:carousel_slider/carousel_slider.dart';
import 'package:eds_test/interface/shared/ui_helpers.dart';
import 'package:eds_test/interface/widgets/text_widget.dart';
import 'package:eds_test/models/photo.dart';
import 'package:flutter/material.dart';

import 'image_widget.dart';

class CarouselImagesWidget extends StatefulWidget {
  final List<Photo> photos;
  const CarouselImagesWidget({Key? key, required this.photos})
      : super(key: key);

  @override
  _CarouselImagesWidgetState createState() => _CarouselImagesWidgetState();
}

class _CarouselImagesWidgetState extends State<CarouselImagesWidget> {
  var _current = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: widget.photos.length,
          options: CarouselOptions(
            viewportFraction: 1,
            initialPage: 0,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            autoPlayAnimationDuration: const Duration(milliseconds: 100),
            autoPlayCurve: Curves.easeIn,
            enlargeCenterPage: false,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
            scrollDirection: Axis.horizontal,
          ),
          itemBuilder: (ctx, index, readlIndex) => ImageWidget(
            imageUrl: widget.photos[index].url,
          ),
        ),
        verticalSpaceSmall,
        TextWiget.body(widget.photos[_current].title),
        verticalSpaceSmall,
        Center(
          child: TextWiget.body('${_current + 1}/${widget.photos.length}'),
        )
      ],
    );
  }
}
