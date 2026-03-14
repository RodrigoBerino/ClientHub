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

  static Map<String, dynamic> entityToMap(ClientEntity model) {
    return {
      'id': model.id,
      'name': model.name,
      'email': model.email,
      'details': model.details,
    };
  }

  static Map<String, dynamic> dtoToMap(ClientDto model) {
    return {
      'id': model.id,
      'name': model.name,
      'email': model.email,
      'details': model.details,
    };
  }
}
