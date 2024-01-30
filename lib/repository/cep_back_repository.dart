import 'package:viacepapp/model/cep_back_model.dart';
import 'package:viacepapp/repository/cep_back_custom_dio.dart';

class BackCepRepository {
  final _customDio = BackCustomDio();

  BackCepRepository();

  Future<BackCepListModel> obterListaDeCep() async {
    var url = "/cep";
    var result = await _customDio.dio.get(url);
    return BackCepListModel.fromJson(result.data);
  }

  Future<void> criar(BackCepModel cepModel) async {
    try {
      await _customDio.dio.post("/cep", data: cepModel.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<void> remover(String? objectId) async {
    try {
      await _customDio.dio.delete("/cep/$objectId");
    } catch (e) {
      rethrow;
    }
  }
}
