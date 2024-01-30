import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:viacepapp/model/viacep_model.dart';

class ViaCepRepsitory {
  Future<ViaCepModel> buscarCep(String cep) async {
    var response =
        await http.get(Uri.parse("https://viacep.com.br/ws/$cep/json/"));
    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);
      return ViaCepModel.fromJson(json);
    }
    return ViaCepModel();
  }
}
