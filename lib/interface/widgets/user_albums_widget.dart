import 'package:eds_test/interface/shared/ui_helpers.dart';
import 'package:eds_test/interface/widgets/text_widget.dart';
import 'package:eds_test/models/album.dart';
import 'package:flutter/material.dart';

class UserAlbumsWidget extends StatelessWidget {
  final List<Album> albums;
  const UserAlbumsWidget({
    Key? key,
    required this.albums,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: basePadding,
      child: Container(
        padding: kcontentPadding,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const TextWiget.headline3('Albums'),
            verticalSpaceSmall,
            ...<Widget>[
              ...albums.take(3).map(
                    (a) => TextWiget.body('- ${a.title}'),
                  ),
            ],
          ],
        ),
      ),
    );
  }
}
