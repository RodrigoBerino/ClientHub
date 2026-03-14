import 'package:clientserver/dtos/client_dto.dart';
import 'package:clientserver/entities/client_entity.dart';

class ClientAdapter {
  ClientAdapter._();

  static ClientEntity fromMap(dynamic map) {
    return ClientEntity(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      details: map['details'],
    );
  }

  static ClientDto entityToDTO(ClientEntity model) {
    return ClientDto(
      id: model.id,
      name: model.name,
      email: model.email,
      details: model.details,
    );
  }
}
