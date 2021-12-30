import 'package:eds_test/interface/shared/ui_helpers.dart';
import 'package:eds_test/interface/widgets/button_widget.dart';
import 'package:eds_test/interface/widgets/text_input_field_widget.dart';
import 'package:eds_test/interface/widgets/text_widget.dart';
import 'package:eds_test/models/comment.dart';

import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

import 'create_comment_view_model.dart';

class CreateCommentView extends StatelessWidget {
  final int postId;
  CreateCommentView({Key? key, required this.postId}) : super(key: key);

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _focusNode = FocusNode();
    return ViewModelBuilder<CreateCommentViewModel>.reactive(
      viewModelBuilder: () => CreateCommentViewModel(),
      builder: (context, viewModel, child) => Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const TextWiget.headline2('Create a comment'),
          centerTitle: true,
        ),
        body: viewModel.isBusy
            ? const Center(child: CircularProgressIndicator())
            : GestureDetector(
                onTap: () => _focusNode.unfocus(),
                child: Padding(
                  padding: basePadding,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      verticalSpaceLarge,
                      TextInputFieldWidget(
                        placeHolder: 'Name',
                        controller: _nameController,
                        isBusy: viewModel.isBusy,
                      ),
                      verticalSpaceMedium,
                      TextInputFieldWidget(
                        placeHolder: 'Email',
                        controller: _emailController,
                        isBusy: viewModel.isBusy,
                      ),
                      verticalSpaceMedium,
                      TextInputFieldWidget(
                        placeHolder: 'Comment text',
                        controller: _commentController,
                        isContent: true,
                        isBusy: viewModel.isBusy,
                      ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () async {
                          if (_nameController.text.isNotEmpty &&
                              _emailController.text.isNotEmpty &&
                              _commentController.text.isNotEmpty) {
                            var tempComment = Comment(
                              id: 0,
                              postId: 0,
                              name: _nameController.text,
                              email: _emailController.text,
                              body: _commentController.text,
                            );
                            await viewModel.postComment(tempComment);
                            _nameController.clear();
                            _emailController.clear();
                            _commentController.clear();
                          }
                        },
                        child:
                            const ButtonWidget(label: 'Publish this comment'),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
