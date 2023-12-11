import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:mocktest/pessoa_repositorio.dart';
import 'package:test/test.dart';

class ClientMock extends Mock implements http.Client {}

class UriFake extends Fake implements Uri {}

void main() {
  final client = ClientMock();
  final repositorio = PessoaRepositorio(client: client);

  setUpAll(() {
    registerFallbackValue(UriFake());
  });

  test('deve retornar uma lista de pessoas', () async {
    when(() => client.get(any()))
        .thenAnswer((_) async => http.Response(jsonRetorno, 200));

    final lista = await repositorio.pegaPessoa();
    expect(lista.isNotEmpty, equals(true));
    expect(lista.first.name, equals('Andre Rogahn'));
  });

  test('deve retornar um erro', () async {
    when(() => client.get(any()))
        .thenAnswer((_) async => http.Response('', 400));

    expect(() async => await repositorio.pegaPessoa(), throwsException);
  });
}

const jsonRetorno =
    '[{"createdAt":"2023-12-11T09:19:48.172Z","name":"Andre Rogahn","avatar":"https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/71.jpg","id":"1"},{"createdAt":"2023-12-11T07:15:34.420Z","name":"Colin Botsford DDS","avatar":"https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1187.jpg","id":"2"},{"createdAt":"2023-12-11T20:12:56.336Z","name":"Mrs. Jason Zboncak IV","avatar":"https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1030.jpg","id":"3"},{"createdAt":"2023-12-11T01:10:26.734Z","name":"Olga Murray","avatar":"https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/647.jpg","id":"4"},{"createdAt":"2023-12-11T02:07:59.567Z","name":"Byron Brekke II","avatar":"https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/962.jpg","id":"5"},{"createdAt":"2023-12-11T20:31:52.920Z","name":"Tyler Ziemann","avatar":"https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/1066.jpg","id":"6"},{"createdAt":"2023-12-11T04:46:01.165Z","name":"Dwayne Doyle","avatar":"https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/259.jpg","id":"7"},{"createdAt":"2023-12-11T04:18:57.989Z","name":"Alfredo Kuhn","avatar":"https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/317.jpg","id":"8"},{"createdAt":"2023-12-11T19:24:44.467Z","name":"Al Barton","avatar":"https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/549.jpg","id":"9"},{"createdAt":"2023-12-11T09:34:41.716Z","name":"Kristy Smith","avatar":"https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/480.jpg","id":"10"},{"createdAt":"2023-12-11T15:50:44.444Z","name":"Jessie Waters","avatar":"https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/184.jpg","id":"11"},{"createdAt":"2023-12-11T19:50:11.079Z","name":"Mrs. Vivian Flatley","avatar":"https://cloudflare-ipfs.com/ipfs/Qmd3W5DuhgHirLHGVixi6V76LhCkZUz6pnFt5AJBiyvHye/avatar/648.jpg","id":"12"}]';
