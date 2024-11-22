// ignore_for_file: prefer_const_constructors

import 'package:conversor/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:custom_radio_grouped_button/custom_radio_grouped_button.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeController controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conversor'),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Image.asset('assets/images/dinheiro.webp'),
            ),
            Text(
              'Covertendo moedas',
              style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(label: Text("Valor: R\$")),
                  onChanged: (value) async {
                    
                      controller.valorEntrada = double.tryParse(value) ?? 0.0;
                      controller.calcular();
                      setState(() {
                      
          
                      }
                    );
                  }),
            ),
            CustomRadioButton(
              enableShape: true,
              elevation: 0,
              unSelectedBorderColor: const Color.fromARGB(0, 0, 0, 0),
              selectedBorderColor: const Color.fromARGB(0, 0, 0, 0),
              absoluteZeroSpacing: false,
              unSelectedColor: Theme.of(context).canvasColor,
              buttonLables: controller.nomeMoedasValidas,
              buttonValues: controller.siglasMoedasValidas,
              buttonTextStyle: const ButtonTextStyle(
                  selectedColor: Colors.white,
                  unSelectedColor: Colors.black,
                  textStyle: TextStyle(fontSize: 16)),
              radioButtonValue: (value) async {
               
                  controller.moedaSelecionada = value.toString();
                 await controller.calcular();
                
             setState(() {    });
              },
              selectedColor: Colors.black,
              defaultSelected: controller.moedaSelecionada,
            ),
            Text(
              'Resultado: ${controller.resultado}',
              style: const TextStyle(fontSize: 25),
            )
          ],
        ),
      ),
    );
  }
}
