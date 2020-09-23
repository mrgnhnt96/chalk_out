import 'package:chalk_out/presentation/screens/ship_it/components/select_contact_card.dart';
import 'package:flutter/material.dart';

class ContactBottomSheet extends StatelessWidget {
  const ContactBottomSheet({
    Key key,
    @required this.contactList,
  }) : super(key: key);
  final List<String> contactList;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        child: ListView.builder(
          itemCount: contactList.length,
          itemBuilder: (context, index) {
            return SelectContactCard(contactName: contactList[index]);
          },
        ),
      ),
    );
  }
}
