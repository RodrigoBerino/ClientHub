import 'package:clientserver/adapters/client_adapter.dart';
import 'package:clientserver/dtos/client_dto.dart';
import 'package:clientserver/entities/client_entity.dart';
import 'package:clientserver/services/http_client_service.dart';

class ClientService {
  final HttpClientService client;

  ClientService(this.client);

  Future<List<ClientEntity>> fetchClients() async {
    final response = await client.get('http://127.0.0.1:3031/clients');
    return (response as List).map(ClientAdapter.fromMap).toList();
  }

  Future<void> createClient(ClientDto dto) async {
    final data = ClientAdapter.dtoToMap(dto);
    await client.post('http://localhost:3031/clients', data);
  }

  Future<void> updateClient(ClientDto dto) async {
    final data = ClientAdapter.dtoToMap(dto);
    await client.put('http://127.0.0.1:3031/clients/${dto.id}', data);
  }

  Future<void> deleteClient(String id) async {
    await client.delete('http://127.0.0.1:3031/clients/$id');
  }
}
