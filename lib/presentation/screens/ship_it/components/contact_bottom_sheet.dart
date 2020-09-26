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
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            color: Colors.blueGrey,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .5,
            child: ListView.builder(
              itemCount: contactList.length,
              itemBuilder: (context, index) {
                return SelectContactCard(contactName: contactList[index]);
              },
            ),
          ),
        ),
      ),
    );
  }
}
