import 'package:flutter/material.dart';
import 'package:contacts_service/contacts_service.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../presentation/components/exportcomponent.dart';

class ContactService {
  var _contacts = [];
  Future<void> _getContacts() async {
    if (await Permission.contacts.request().isGranted) {
      Iterable<Contact> contacts = await ContactsService.getContacts();

      _contacts = contacts.toList();
    } else {
      await Permission.contacts.request();
      _getContacts();
    }
  }

  openContactSelectionModal(
      {required BuildContext context, required Function onTap}) {
    print('ddddd');

    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return Container(
            decoration: BoxDecoration(
                color: ColorsApp.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15))),
            height: getHeight(context) * .8,
            child: SingleChildScrollView(
                child: Column(children: [
              Container(
                  decoration: BoxDecoration(
                      color: ColorsApp.white,
                      border: Border(
                          bottom: BorderSide(
                        color: ColorsApp.greyNew,
                      ))),
                  margin: EdgeInsets.symmetric(vertical: kMarginY / 2),
                  padding: EdgeInsets.symmetric(
                      vertical: kMarginY / 2, horizontal: kMarginX),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(child: Text('Select Contacts'.tr())),
                        InkWell(
                            child: Container(child: Icon(Icons.close)),
                            onTap: () => AutoRouter.of(context).pop())
                      ])),
              Container(
                  margin: EdgeInsets.only(top: kMarginY),
                  height: getHeight(context) * .73,
                  child: FutureBuilder(
                    future: _getContacts(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      } else if (_contacts.isEmpty) {
                        return Center(child: Text('No contacts found.'));
                      } else {
                        return StatefulBuilder(
                          builder: (context, setState) {
                            return Padding(
                              padding: EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Expanded(
                                    child: ListView.builder(
                                      itemCount: _contacts.length,
                                      itemBuilder: (context, index) {
                                        Contact contact = _contacts[index];

                                        return ListTile(
                                          onTap: () => onTap(contact),
                                          title:
                                              Text(contact.displayName ?? ''),
                                          subtitle: Text(
                                            contact.phones!.isNotEmpty
                                                ? contact.phones!.first.value ??
                                                    ''
                                                : '',
                                          ),
                                          leading: (contact.avatar != null &&
                                                  contact.avatar!.isNotEmpty)
                                              ? CircleAvatar(
                                                  backgroundImage: MemoryImage(
                                                      contact.avatar!),
                                                )
                                              : CircleAvatar(
                                                  child:
                                                      Text(contact.initials()),
                                                ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }
                    },
                  ))
            ])));
      },
    );
  }
}