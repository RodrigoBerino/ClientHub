import 'package:clientserver/atoms/client_atoms.dart';
import 'package:clientserver/states/client_state.dart';
import 'package:flutter/material.dart';

class ClientPage extends StatefulWidget {
  const ClientPage({super.key});

  @override
  State<ClientPage> createState() => _ClientPageState();
}

class _ClientPageState extends State<ClientPage> {
  @override
  void initState() {
    super.initState();

    clientState.value = const StartClientState();

    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      fetchClientsAction.value = Object();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[800],
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Clients',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: 18,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue[800],
        foregroundColor: Colors.white,
        onPressed: _createNewClient,
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(color: Colors.grey[200]),
              child: ListenableBuilder(
                listenable: clientState,
                builder: (context, child) {
                  return switch (clientState.value) {
                    StartClientState _ => const SizedBox(),
                    LoadingClientState _ => Center(
                      child: CircularProgressIndicator(color: Colors.blue[800]),
                    ),
                    GettedClientState state => _gettedClients(state),
                    FailureClientState state => _failure(state),
                  };
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _gettedClients(GettedClientState state) {
    final clients = state.clients;

    return ListView.builder(
      itemCount: clients.length,
      itemBuilder: (_, index) {
        final client = clients[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed('/edit', arguments: client);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          color: Colors.blue[400],
                          child: const Icon(Icons.person, color: Colors.white),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            client.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            client.email,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {
                      deleteClientAction.value = client.id;
                    },
                    icon: Icon(Icons.remove_circle, color: Colors.red[300]),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _failure(FailureClientState state) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.people_outline, size: 64, color: Colors.blue[200]),
          const SizedBox(height: 16),
          const Text(
            'Nenhum cliente cadastrado ainda',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Toque no + para adicionar um novo cliente',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
        ],
      ),
    );
  }

  void _createNewClient() {
    Navigator.of(context).pushNamed('/create');
  }
}
