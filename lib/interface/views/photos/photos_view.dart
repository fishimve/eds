import 'package:eds_test/interface/shared/ui_helpers.dart';
import 'package:eds_test/interface/widgets/carousel_images_widget.dart';
import 'package:eds_test/interface/widgets/image_widget.dart';
import 'package:eds_test/interface/widgets/text_widget.dart';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'photos_view_model.dart';

class PhotosView extends StatelessWidget {
  final int albumId;
  final bool slideshow;
  const PhotosView({
    Key? key,
    required this.albumId,
    required this.slideshow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PhotosViewModel>.reactive(
      viewModelBuilder: () => PhotosViewModel(),
      onModelReady: (viewModel) {
        viewModel.getAlbumPhotos(albumId);
        viewModel.initSlideshow(slideshow);
      },
      builder: (context, viewModel, child) => Scaffold(
        appBar: AppBar(
          title: const TextWiget.headline2('All photos'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () => viewModel.toogleViews(),
              icon: viewModel.showSlideShow!
                  ? const Icon(Icons.grid_view)
                  : const Icon(Icons.view_carousel),
            ),
          ],
        ),
        body: viewModel.showSlideShow!
            ? Padding(
                padding: basePadding,
                child: CarouselImagesWidget(
                  photos: viewModel.albumPhotos,
                ),
              )
            : GridView.builder(
                padding: const EdgeInsets.all(10.0),
                itemCount: viewModel.albumPhotos.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (context, index) => GridTile(
                  child: ImageWidget(
                    imageUrl: viewModel.albumPhotos[index].thumbnailUrl,
                  ),
                  footer: GridTileBar(
                    subtitle:
                        TextWiget.body(viewModel.albumPhotos[index].title),
                  ),
                ),
              ),
      ),
    );
  }
}
