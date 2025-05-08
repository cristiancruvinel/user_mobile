import 'package:flutter/material.dart';
import '../models/user.dart';
import '../database/db_helper.dart';

class UserFormPage extends StatefulWidget {
  final VoidCallback onSave;
  final User? user;

  const UserFormPage({super.key, required this.onSave, this.user});

  @override
  State<UserFormPage> createState() => _UserFormPageState();
}

class _UserFormPageState extends State<UserFormPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _emailController;

  @override
  void initState() {
    super.initState();
    _nameController =
        TextEditingController(text: widget.user?.name ?? '');
    _emailController =
        TextEditingController(text: widget.user?.email ?? '');
  }

  Future<void> _saveUser() async {
    if (_formKey.currentState!.validate()) {
      final db = DBHelper();
      final name = _nameController.text.trim();
      final email = _emailController.text.trim();

      if (widget.user == null) {
        await db.insertUser(User(name: name, email: email));
      } else {
        await db.updateUser(User(
          id: widget.user!.id,
          name: name,
          email: email,
        ));
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(widget.user == null
              ? 'Usuário cadastrado com sucesso'
              : 'Usuário atualizado com sucesso'),
        ),
      );

      widget.onSave();
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isEditing = widget.user != null;

    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Editar Usuário' : 'Novo Usuário'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Informe o nome' : null,
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'E-mail',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) =>
                      value == null || value.isEmpty ? 'Informe o e-mail' : null,
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: _saveUser,
                    icon: const Icon(Icons.save),
                    label: Text(isEditing ? 'Salvar Alterações' : 'Salvar'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
