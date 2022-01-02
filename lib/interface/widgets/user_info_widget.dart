import 'package:eds_test/interface/shared/ui_helpers.dart';
import 'package:eds_test/interface/widgets/text_widget.dart';
import 'package:eds_test/models/user.dart';
import 'package:flutter/material.dart';

class UserInfoWidget extends StatelessWidget {
  final User user;
  const UserInfoWidget({
    Key? key,
    required this.user,
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
            TextWiget.body('Name: ${user.name}'),
            verticalSpaceTiny,
            TextWiget.body('Email: ${user.email}'),
            verticalSpaceTiny,
            TextWiget.body('Phone: ${user.phone}'),
            verticalSpaceTiny,
            TextWiget.body('Website: ${user.website}'),
            verticalSpaceTiny,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWiget.body(
                  'Company: ',
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWiget.body(user.company.name),
                      TextWiget.body(user.company.bs),
                      TextWiget.caption('"${user.company.catchPhrase}"'),
                    ],
                  ),
                ),
              ],
            ),
            verticalSpaceTiny,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWiget.body(
                  'Address: ',
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextWiget.body(
                          '${user.address.street}, ${user.address.suite}, ${user.address.city}'),
                      TextWiget.caption('Zipcode: ${user.address.zipcode}'),
                      TextWiget.caption(
                        'Longitude: ${user.address.geo['lng']}, Latitude: ${user.address.geo['lat']}',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
