import 'package:eds_test/interface/shared/ui_helpers.dart';
import 'package:eds_test/interface/widgets/text_widget.dart';

import 'package:eds_test/models/post.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'posts_view_model.dart';

class PostsView extends StatelessWidget {
  final String username;
  final List<Post> posts;
  const PostsView({Key? key, required this.username, required this.posts})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<PostsViewModel>.reactive(
      viewModelBuilder: () => PostsViewModel(),
      builder: (context, viewModel, child) => Scaffold(
        appBar: AppBar(
          title: TextWiget.headline2('$username\'s posts'),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: posts.length,
          itemBuilder: (context, index) => GestureDetector(
            onTap: () => viewModel.navigateToCommentsView(posts[index]),
            child: Card(
              margin: basePadding,
              child: Padding(
                padding: kcontentPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWiget.headline3(posts[index].title),
                    verticalSpaceTiny,
                    TextWiget.body(posts[index].body),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
