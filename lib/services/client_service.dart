import 'package:clientserver/adapters/client_adapter.dart';
import 'package:clientserver/dtos/client_dto.dart';
import 'package:clientserver/entities/client_entity.dart';
import 'package:clientserver/services/http_client_service.dart';

class ClientService {
  final HttpClientService client;

  static const _baseUrl = 'http://localhost:3031';

  ClientService(this.client);

  Future<List<ClientEntity>> fetchClients() async {
    final response = await client.get('$_baseUrl/clients');
    return (response as List).map(ClientAdapter.fromMap).toList();
  }

  Future<void> createClient(ClientDto dto) async {
    final data = ClientAdapter.dtoToMap(dto);
    await client.post('$_baseUrl/clients', data);
  }

  Future<void> updateClient(ClientDto dto) async {
    final data = ClientAdapter.dtoToMap(dto);
    await client.put('$_baseUrl/clients/${dto.id}', data);
  }

  Future<void> deleteClient(String id) async {
    await client.delete('$_baseUrl/clients/$id');
  }
}
