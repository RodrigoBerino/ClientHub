import 'package:clientserver/dtos/client_dto.dart';
import 'package:clientserver/states/edit_state.dart';
import 'package:flutter/material.dart';

import '../states/client_state.dart';

// Atom
final clientState = ValueNotifier<ClientState>(const StartClientState());
final editClientState = ValueNotifier<ClientEditState>(
  const StartEditClientState(),
);

// Actions
final fetchClientsAction = ValueNotifier(Object());
final createClientAction = ValueNotifier<ClientDto>(ClientDto());
final updateClientAction = ValueNotifier<ClientDto>(ClientDto());
final deleteClientAction = ValueNotifier<String>('');
