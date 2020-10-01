import 'package:flutter/material.dart';

import 'package:chalk_out/presentation/blocs/ship_it/ship_it_bloc.dart';
import 'package:chalk_out/presentation/screens/ship_it/components/select_contact_card.dart';

class ContactBottomSheet extends StatelessWidget {
  const ContactBottomSheet({
    Key key,
    @required this.contactList,
    @required this.shipItBloc,
  }) : super(key: key);
  final List<String> contactList;
  final ShipItBloc shipItBloc;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              color: Colors.blueGrey,
            ),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .95,
            child: ListView.builder(
              itemCount: contactList.length,
              itemBuilder: (context, index) {
                return SelectContactCard(
                  contactName: contactList[index],
                  shipItBloc: shipItBloc,
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
