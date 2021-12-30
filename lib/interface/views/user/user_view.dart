import 'package:eds_test/interface/shared/ui_helpers.dart';
import 'package:eds_test/interface/widgets/text_widget.dart';
import 'package:eds_test/interface/widgets/user_albums_widget.dart';
import 'package:eds_test/interface/widgets/user_info_widget.dart';
import 'package:eds_test/interface/widgets/user_posts_widget.dart';
import 'package:eds_test/models/user.dart';
import 'package:stacked/stacked.dart';
import 'package:flutter/material.dart';

import 'user_view_model.dart';

class UserView extends StatelessWidget {
  final User user;
  const UserView({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<UserViewModel>.reactive(
      viewModelBuilder: () => UserViewModel(),
      onModelReady: (viewModel) => viewModel.getPostsAndAlbums(user.id),
      builder: (context, viewModel, child) => Scaffold(
        appBar: AppBar(
          title: TextWiget.headline2(user.username),
          centerTitle: true,
        ),
        body: viewModel.isBusy
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Column(
                  children: [
                    UserInfoWidget(user: user),
                    verticalSpaceSmall,
                    GestureDetector(
                      onTap: () => viewModel.navigateToPostsView(user.username),
                      child: UserPostsWidget(posts: viewModel.userPosts),
                    ),
                    verticalSpaceSmall,
                    GestureDetector(
                      onTap: () =>
                          viewModel.navigateToAlbumsView(user.username),
                      child: UserAlbumsWidget(albums: viewModel.userAlbums),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
