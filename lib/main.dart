import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: IMCCalculator()));

class IMCCalculator extends StatefulWidget {
  @override
  _IMCCalculatorState createState() => _IMCCalculatorState();
}

class _IMCCalculatorState extends State<IMCCalculator> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();

  double _imc = 0;
  String _classifica = "";

  void _calculateIMC() {
    double weight = double.parse(_weightController.text);
    double height = double.parse(_heightController.text);

    if (weight > 0 && height > 0) {
      setState(() {
        _imc = weight / (height * height);
        if(_imc<16) {
          _classifica="Magreza grave";
        }
        else if(_imc>=16 && _imc<17) {
          _classifica="Magreza moderada";
        }
        else if(_imc>=17 && _imc<18.5) {
          _classifica="Magreza leve";
        }
        else if(_imc>=18.5 && _imc<25) {
          _classifica="Saudável";
        }
        else if(_imc>=25 && _imc<30) {
          _classifica="Sobrepeso";
        }
        else if(_imc>=30 && _imc<35) {
          _classifica="Obsidade Grau I";
        }
        else if(_imc>=35 && _imc<40) {
          _classifica="Obsidade Grau II (severa)";
        }
        else if(_imc>=40) {
          _classifica="Obsidade Grau III (mórbida)";
        }

      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculadora de IMC'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Nome'),
            ),
            TextField(
              controller: _weightController,
              decoration: InputDecoration(labelText: 'Peso (kg)'),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _heightController,
              decoration: InputDecoration(labelText: 'Altura (m)'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _calculateIMC();
              },
              child: Text('Calcular IMC'),
            ),
            SizedBox(height: 20),
            Text('IMC: $_imc', style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Text('Classificação: $_classifica', style: TextStyle(fontSize: 20)),

          ],
        ),
      ),
    );
  }
}

