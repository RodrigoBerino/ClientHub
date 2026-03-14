import 'package:clientserver/exceptions/validate_exception.dart';

abstract class Dto {
  void validate();

  bool isValid() {
    try {
      validate();
      return true;
    } on ValidateException {
      return false;
    }
  }
}
