import 'dart:convert';



import 'package:http/http.dart' as http;


class MoedaModel {
  String? moeda;
  double? uSD;
  double? eUR;
  double? bTC;

  MoedaModel({this.moeda, this.uSD, this.eUR, this.bTC});

  MoedaModel.fromJson(Map<String, dynamic> json) {
    moeda = json['moeda'];
    uSD = json['USD'];
    eUR = json['EUR'];
    bTC = json['BTC'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['moeda'] = this.moeda;
    data['USD'] = this.uSD;
    data['EUR'] = this.eUR;
    data['BTC'] = this.bTC;
    return data;
  }

List<String> siglasMoedasValidas = ["USD", "BTC", "EUR"];
  List<String> nomeMoedasValidas = ["Dolar", "Bitcoin", "Euro"];

  // Map<String, double> valores = {
  //                       "USD" : 5.00,
  //                       "BTC" : 0.0000000007,
  //                       "EUR" : 6.50
  //                     };
  
  Future <double> calcular(moedaSelecionada, valor)async{
    Map<String, dynamic> valores = await _buscarMoedas();
    return valor * valores[moedaSelecionada];
  }
  
    
 

   Future<Map<String, dynamic>> _buscarMoedas() async {
  final response = await http.get(Uri.parse('https://estevaorada.com/aulas/api/moedas/?id=BRL'));
  if (response.statusCode == 200) {
    return jsonDecode(response.body) as Map<String, dynamic>;
  } else {
    throw Exception('Falha ao obter as moedas');
  }
}}