import 'dart:convert';

import 'package:http/http.dart';
import 'package:mocktest/pessoa.dart';

class PessoaRepositorio {
  PessoaRepositorio({required this.client});
  final Client client; // = Client();

  Future<List<Pessoa>> pegaPessoa() async {
    final response = await client.get(Uri.parse(
        'https://6577719d197926adf62e4fee.mockapi.io/mocktail/pessoa'));
    if (response.statusCode == 200) {
      final jsonLista = jsonDecode(response.body) as List;
      return jsonLista.map((e) => Pessoa.fromMap(e)).toList();
    } else {
      throw Exception('Erro ao resgatar dados da url');
    }
  }
}
