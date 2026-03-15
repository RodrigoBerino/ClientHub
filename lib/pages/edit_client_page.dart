import 'package:clientserver/adapters/client_adapter.dart';
import 'package:clientserver/atoms/client_atoms.dart';
import 'package:clientserver/dtos/client_dto.dart';
import 'package:clientserver/entities/client_entity.dart';
import 'package:clientserver/states/edit_state.dart';
import 'package:clientserver/widgets/text_input.dart';
import 'package:flutter/material.dart';

class EditClient extends StatefulWidget {
  final ClientEntity? entity;
  const EditClient({super.key, this.entity});

  @override
  State<EditClient> createState() => _EditClientState();
}

class _EditClientState extends State<EditClient> {
  late ClientDto dto;

  bool get editable => widget.entity != null;

  @override
  void initState() {
    super.initState();
    if (widget.entity != null) {
      dto = ClientAdapter.entityToDTO(widget.entity!);
    } else {
      dto = ClientDto();
    }
    editClientState.value = const StartEditClientState();
    editClientState.addListener(_listener);
  }

  _listener() {
    setState(() {});
    return switch (editClientState.value) {
      StartEditClientState state => state,
      SavedClientState _ => Navigator.of(context).pop(),
      LoadingEditClientState state => state,
      FailureEditClientState state => _showSnackError(state),
    };
  }

  @override
  void dispose() {
    editClientState.removeListener(_listener);
    super.dispose();
  }

  void _showSnackError(FailureEditClientState state) {
    final snackBar = SnackBar(
      content: Text(state.message, style: const TextStyle(color: Colors.white)),
      backgroundColor: Colors.red,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _save() {
    if (!dto.isValid()) {
      _showSnackError(const FailureEditClientState('Campos inválidos'));
      return;
    }
    if (editable) {
      updateClientAction.value = dto.copy();
    } else {
      createClientAction.value = dto.copy();
    }
  }

  void _clear() {
    setState(() => dto = ClientDto(id: dto.id));
  }

  @override
  Widget build(BuildContext context) {
    final state = editClientState.value;
    final enabled = state is! LoadingEditClientState;

    return Scaffold(
      backgroundColor: Colors.blue[800],
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          editable ? 'Edit Client' : 'New Client',
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 18,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(0),
                  topRight: Radius.circular(0),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextInput(
                    key: Key('name:$enabled${dto.hashCode}'),
                    enabled: enabled,
                    initialValue: dto.name,
                    hint: 'Nome',
                    validator: dto.nameValidate,
                    onChanged: (value) => dto.name = value,
                  ),
                  const SizedBox(height: 12),
                  TextInput(
                    key: Key('email:$enabled${dto.hashCode}'),
                    enabled: enabled,
                    initialValue: dto.email,
                    hint: 'Email',
                    validator: dto.emailValidate,
                    onChanged: (value) => dto.email = value,
                  ),
                  const SizedBox(height: 12),
                  TextInput(
                    key: Key('details:$enabled${dto.hashCode}'),
                    enabled: enabled,
                    initialValue: dto.details,
                    hint: 'Detalhes',
                    onChanged: (value) => dto.details = value,
                  ),
                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue[800],
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: !enabled ? null : _save,
                          child: const Text(
                            'Salvar',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            foregroundColor: Colors.blue[800],
                            side: BorderSide(color: Colors.blue[800]!),
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: !enabled ? null : _clear,
                          child: const Text(
                            'Limpar',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
