import 'package:flutter/material.dart';
import 'package:viacepapp/model/cep_back_model.dart';
import 'package:viacepapp/model/viacep_model.dart';
import 'package:viacepapp/repository/cep_back_repository.dart';
import 'package:viacepapp/repository/viacep_repository.dart';

class CepPage extends StatefulWidget {
  const CepPage({super.key});

  @override
  State<CepPage> createState() => _CepPageState();
}

class _CepPageState extends State<CepPage> {
  BackCepRepository backCepRepository = BackCepRepository();
  ViaCepRepsitory viaCepRepository = ViaCepRepsitory();
  var backCepListModel = BackCepListModel([]);
  BackCepModel backCepModel =
      BackCepModel("", "", "", "", "", "", "", "", "", "");
  var viaCepModel = ViaCepModel();
  var cepController = TextEditingController();
  var carregando = false;

  @override
  initState() {
    super.initState();
    obterDados();
  }

  obterDados() async {
    setState(() {
      carregando = true;
    });
    backCepListModel = await backCepRepository.obterListaDeCep();
    setState(() {
      carregando = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(2, 2, 70, 1),
        title: const Center(
            child: Text(
          "Via CEP App",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        )),
      ),
      body: Center(
        child: carregando
            ? const CircularProgressIndicator()
            : Expanded(
                child: ListView.builder(
                  itemCount: backCepListModel.cepList.length,
                  itemBuilder: (BuildContext bc, int index) {
                    var cep = backCepListModel.cepList[index];
                    return Dismissible(
                      onDismissed: (direction) async {
                        await backCepRepository.remover(cep.objectId);
                        obterDados();
                      },
                      key: Key(cep.objectId.toString()),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(2, 2, 70, 1),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${cep.cep.toString()} - ${cep.logradouro.toString()}",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "${cep.bairro.toString()} - ${cep.localidade.toString()}",
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext bc) {
              return AlertDialog(
                title: const Text("Digite o CEP"),
                content: TextField(controller: cepController),
                actions: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                        cepController.text = "";
                      },
                      child: const Text("Cancelar")),
                  TextButton(
                      onPressed: () async {
                        viaCepModel = await viaCepRepository
                            .buscarCep(cepController.text);
                        backCepModel.bairro = viaCepModel.bairro;
                        backCepModel.cep = viaCepModel.cep;
                        backCepModel.ddd = viaCepModel.ddd;
                        backCepModel.gia = viaCepModel.gia;
                        backCepModel.ibge = viaCepModel.ibge;
                        backCepModel.localidade = viaCepModel.localidade;
                        backCepModel.logradouro = viaCepModel.logradouro;
                        backCepModel.objectId = "";
                        backCepModel.siafi = viaCepModel.siafi;
                        backCepModel.uf = viaCepModel.uf;
                        backCepRepository.criar(backCepModel);
                        Navigator.pop(context);
                        cepController.text = "";
                        obterDados();
                      },
                      child: const Text("Buscar"))
                ],
              );
            },
          );
        },
        tooltip: 'Nova busca de CEP',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
