import 'package:flutter/material.dart';
import 'package:lista_contatos/helpers/contact_helper.dart';

class ContactPage extends StatefulWidget {
  final Contact? contact;
  const ContactPage({super.key, this.contact});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  Contact? _editedContact;
  bool _userEdited = false;
  final _nameFocus = FocusNode();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  @override
  void initState() {
    super.initState();

    if (widget.contact == null) {
      _editedContact = Contact();
    } else {
      _editedContact = Contact.fromMap(widget.contact!.toMap());
      _nameController.text = _editedContact!.name!;
      _emailController.text = _editedContact!.email!;
      _phoneController.text = _editedContact!.phone!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text(_editedContact!.name ?? "Novo Contato"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (_editedContact!.name != null &&
              _editedContact!.name!.isNotEmpty) {
            Navigator.pop(context, _editedContact);
          } else {
            FocusScope.of(context).requestFocus(_nameFocus);
          }
        },
        backgroundColor: Colors.red,
        child: const Icon(Icons.save),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            GestureDetector(
              child: SizedBox(
                width: 200,
                height: 200,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: _editedContact!.img != null
                      ? Image.asset('images/person.png')
                      : Image.asset('images/person.png'),
                ),
              ),
            ),
            TextField(
              controller: _nameController,
              focusNode: _nameFocus,
              decoration: const InputDecoration(labelText: 'Nome'),
              onChanged: (text) {
                _userEdited = true;
                setState(() {
                  _editedContact!.name = text;
                });
              },
            ),
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              onChanged: (text) {
                _userEdited = true;
                _editedContact!.email = text;
              },
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: _phoneController,
              decoration: const InputDecoration(labelText: 'Telefone'),
              onChanged: (text) {
                _userEdited = true;
                _editedContact!.phone = text;
              },
              keyboardType: TextInputType.phone,
            ),
          ],
        ),
      ),
    );
  }
}
