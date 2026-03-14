part 'cliente_validate_mixin.dart';
import 'package:clientserver/dtos/dto.dart';
import 'package:clientserver/exceptions/validate_exception.dart';
import 'package:clientserver/services/string_generator.dart';

class ClientDto extends Dto with ClienteValidate {
  late String id;
  String name;
  String email;
  String? details;

  ClientDto({String? id, this.name = '', this.email = '', this.details}) {
    this.id = id ?? stringGenerator();
  }

  ClientDto copy() {
    return ClientDto(id: id, name: name, email: email, details: details);
  }

  @override
  void validate() {
    nameValidate(name);
    emailValidate(email);
  }
}
