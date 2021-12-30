import 'package:eds_test/interface/shared/ui_helpers.dart';
import 'package:eds_test/interface/widgets/button_widget.dart';
import 'package:eds_test/interface/widgets/text_widget.dart';
import 'package:eds_test/models/post.dart';

import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

import 'comments_view_model.dart';

class CommentsView extends StatelessWidget {
  final Post post;
  const CommentsView({Key? key, required this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CommentsViewModel>.reactive(
      viewModelBuilder: () => CommentsViewModel(),
      onModelReady: (viewModel) => viewModel.getPostComments(post.id),
      builder: (context, viewModel, child) => Scaffold(
        appBar: AppBar(
          title: const TextWiget.headline2('Comments'),
          centerTitle: true,
        ),
        body: viewModel.isBusy
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Padding(
                    padding: basePadding,
                    child: ExpansionTile(
                      iconColor: Theme.of(context).primaryColor,
                      tilePadding: const EdgeInsets.symmetric(
                        horizontal: 8.0,
                      ),
                      childrenPadding: const EdgeInsets.fromLTRB(12, 0, 12, 12),
                      title: TextWiget.headline3(post.title),
                      children: [TextWiget.body(post.body)],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: viewModel.postComments.length,
                      itemBuilder: (context, index) => Card(
                        margin: basePadding,
                        child: Padding(
                          padding: kcontentPadding,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextWiget.headline3(
                                viewModel.postComments[index].name,
                              ),
                              verticalSpaceTiny,
                              TextWiget.caption(
                                'Email: ${viewModel.postComments[index].email}',
                              ),
                              verticalSpaceTiny,
                              TextWiget.body(
                                viewModel.postComments[index].body,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () => viewModel.navigateToCreateCommentView(post.id),
                    child: const ButtonWidget(label: 'Create a comment'),
                  ),
                ],
              ),
      ),
    );
  }
}
