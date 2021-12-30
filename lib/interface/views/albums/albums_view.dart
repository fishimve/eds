import 'package:eds_test/interface/shared/ui_helpers.dart';
import 'package:eds_test/interface/widgets/text_widget.dart';
import 'package:eds_test/models/album.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'albums_view_model.dart';

class AlbumsView extends StatelessWidget {
  final String username;
  final List<Album> albums;
  const AlbumsView({Key? key, required this.username, required this.albums})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AlbumsViewModel>.reactive(
      viewModelBuilder: () => AlbumsViewModel(),
      builder: (context, viewModel, child) => Scaffold(
        appBar: AppBar(
          title: TextWiget.headline2('$username\'s albums'),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: albums.length,
          itemBuilder: (context, index) => Card(
            margin: basePadding,
            child: Padding(
              padding: kcontentPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextWiget.body(albums[index].title),
                  verticalSpaceSmall,
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () =>
                            viewModel.navigateToPhotosView(albums[index].id),
                        child: TextWiget.headline3(
                          'Grid',
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      horizontalSpaceLarge,
                      GestureDetector(
                        onTap: () => viewModel.navigateToPhotosView(
                          albums[index].id,
                          slideshow: true,
                        ),
                        child: TextWiget.headline3(
                          'Slideshow',
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
