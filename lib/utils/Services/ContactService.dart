import 'package:BabanaExpress/presentation/components/Widget/global_bottom_sheet.dart';

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
          {required BuildContext context, required Function onTap}) =>
      GlobalBottomSheet.show(
          maxHeight: getHeight(context) * .8,
          context: context,
          title: 'Selectionner un Contact'.tr(),
          widget: Container(
            margin: EdgeInsets.only(top: kMarginY),
            height: getHeight(context) * .70,
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
                      return ListView.builder(
                        itemCount: _contacts.length,
                        itemBuilder: (context, index) {
                          Contact contact = _contacts[index];

                          return ListTile(
                            onTap: () => onTap(contact),
                            title: Text(contact.displayName ?? ''),
                            subtitle: Text(
                              contact.phones!.isNotEmpty
                                  ? contact.phones!.first.value ?? ''
                                  : '',
                            ),
                            leading: (contact.avatar != null &&
                                    contact.avatar!.isNotEmpty)
                                ? CircleAvatar(
                                    backgroundImage:
                                        MemoryImage(contact.avatar!),
                                  )
                                : CircleAvatar(
                                    child: Text(contact.initials()),
                                  ),
                          );
                        },
                      );
                    },
                  );
                }
              },
            ),
          ));
}
