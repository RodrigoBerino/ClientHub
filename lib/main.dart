import 'package:clientserver/entities/client_entity.dart';
import 'package:clientserver/pages/client_page.dart';
import 'package:clientserver/pages/edit_client_page.dart';
import 'package:clientserver/reducers/client_reducer.dart';
import 'package:clientserver/services/http_client_service.dart';
import 'package:clientserver/services/client_service.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

void main() {
  runApp(const RootWidget());
}

class RootWidget extends StatefulWidget {
  const RootWidget({super.key});

  @override
  State<RootWidget> createState() => _RootWidgetState();
}

class _RootWidgetState extends State<RootWidget> {
  final http.Client httpClient = http.Client();
  late final HttpClientService httpClientService = HttpClientService(httpClient);
  late final ClientService clientService = ClientService(httpClientService);
  late final ClientReducer reducer;

  @override
  void initState() {
    super.initState();
    reducer = ClientReducer(clientService);
  }

  @override
  void dispose() {
    reducer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const MainApp();
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (_) => const ClientPage(),
        '/create': (_) => const EditClient(),
        '/edit': (context) {
          final entity =
              ModalRoute.of(context)?.settings.arguments as ClientEntity?;
          return EditClient(entity: entity);
        },
      },
    );
  }
}
