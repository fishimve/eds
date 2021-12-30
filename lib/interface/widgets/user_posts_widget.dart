import 'package:eds_test/interface/shared/ui_helpers.dart';
import 'package:eds_test/interface/widgets/text_widget.dart';
import 'package:eds_test/models/post.dart';
import 'package:flutter/material.dart';

class UserPostsWidget extends StatelessWidget {
  final List<Post> posts;
  const UserPostsWidget({
    Key? key,
    required this.posts,
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
            const TextWiget.headline3('Posts'),
            verticalSpaceSmall,
            ...<Widget>[
              ...posts.take(3).map(
                    (p) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWiget.body(p.title),
                        verticalSpaceTiny,
                        TextWiget.oneline(p.body),
                        verticalSpaceSmall
                      ],
                    ),
                  )
            ]
          ],
        ),
      ),
    );
  }
}
