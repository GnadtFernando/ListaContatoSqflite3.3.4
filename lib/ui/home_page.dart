import 'package:flutter/material.dart';
import 'package:lista_contatos/helpers/contact_helper.dart';
import 'package:lista_contatos/ui/contact_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ContactHelper helper = ContactHelper();
  List<Contact> contacts = [];

  @override
  void initState() {
    super.initState();

    // Contact c = Contact();
    // c.img =
    //     'data:image/jpeg;base64,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';
    // c.email = 'teste@gnadt.com';
    // c.phone = '31 98333123';
    // c.name = 'Gninas';

    // helper.saveContact(c);

    _getAllContacts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contatos'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showContactPage();
        },
        backgroundColor: Colors.red,
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(10.0),
          itemCount: contacts.length,
          itemBuilder: (context, index) {
            return _contactCard(context, index);
          }),
    );
  }

  Widget _contactCard(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        _showContactPage(contact: contacts[index]);
      },
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                child: contacts[index].img != null
                    ? Image.asset('images/person.png')
                    : Image.asset('images/person.png'),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      contacts[index].name ?? "",
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      contacts[index].email ?? "",
                      style: const TextStyle(fontSize: 18),
                    ),
                    Text(
                      contacts[index].phone ?? "",
                      style: const TextStyle(fontSize: 18),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showContactPage({Contact? contact}) async {
    final recContact = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ContactPage(
          contact: contact,
        ),
      ),
    );
    if (recContact != null) {
      if (contact != null) {
        await helper.updateContact(recContact);
        _getAllContacts();
      } else {
        await helper.saveContact(recContact);
      }
      _getAllContacts();
    }
  }

  void _getAllContacts() {
    helper.getAllContacts().then((list) {
      setState(() {
        contacts = list.toList().cast();
      });
    });
  }
}
