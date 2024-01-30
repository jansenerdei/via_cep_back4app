class BackCepListModel {
  List<BackCepModel> cepList = [];

  BackCepListModel(this.cepList);

  BackCepListModel.fromJson(Map<String?, dynamic> json) {
    if (json['results'] != null) {
      cepList = <BackCepModel>[];
      json['results'].forEach((v) {
        cepList.add(BackCepModel.fromJson(v));
      });
    }
  }

// class BackCepModel {
//   List<cepList>? cepList;

//   BackCepModel({this.cepList});

//   BackCepModel.fromJson(Map<String, dynamic> json) {
//     if (json['cepList'] != null) {
//       cepList = <cepList>[];
//       json['cepList'].forEach((v) {
//         cepList!.add(cepList.fromJson(v));
//       });
//     }
//   }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = <String?, dynamic>{};
    data['results'] = cepList.map((v) => v.toJson()).toList();
    return data;
  }
}

class BackCepModel {
  String? objectId;
  String? cep;
  String? logradouro;
  String? bairro;
  String? localidade;
  String? uf;
  String? ibge;
  String? gia;
  String? ddd;
  String? siafi;

  BackCepModel(this.objectId, this.cep, this.logradouro, this.bairro,
      this.localidade, this.uf, this.ibge, this.gia, this.ddd, this.siafi);

  BackCepModel.fromJson(Map<String?, dynamic> json) {
    objectId = json['objectId'];
    cep = json['cep'];
    logradouro = json['logradouro'];
    bairro = json['bairro'];
    localidade = json['localidade'];
    uf = json['uf'];
    ibge = json['ibge'];
    gia = json['gia'];
    ddd = json['ddd'];
    siafi = json['siafi'];
  }

  Map<String?, dynamic> toJson() {
    final Map<String?, dynamic> data = <String?, dynamic>{};
    data['objectId'] = objectId;
    data['cep'] = cep;
    data['logradouro'] = logradouro;
    data['bairro'] = bairro;
    data['localidade'] = localidade;
    data['uf'] = uf;
    data['ibge'] = ibge;
    data['gia'] = gia;
    data['ddd'] = ddd;
    data['siafi'] = siafi;
    return data;
  }
}
