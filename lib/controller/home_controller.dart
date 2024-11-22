import 'package:conversor/model/moeda_model.dart';

class HomeController {
  double valorEntrada = 0;
  double resultado = 0;
  String moedaSelecionada = "USD";

  //instancia moeda
  MoedaModel moeda = MoedaModel();
  List<String> nomeMoedasValidas = [];
  List<String> siglasMoedasValidas = [];
  Map<String, double> valores = {};

//Construtor: inicializar os valoresna sua construção
  HomeController() {
    //inicializar os valores obtendo do Model
    nomeMoedasValidas = moeda.nomeMoedasValidas;
    siglasMoedasValidas = moeda.siglasMoedasValidas;
// valores = moeda.valores;
  }
  Future calcular() async {
    resultado = await moeda.calcular(moedaSelecionada, valorEntrada);
  }
}
