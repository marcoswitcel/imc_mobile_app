import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class ImcBloc {
  final MaskedTextController pesoController = MaskedTextController(mask: '000');
  final MaskedTextController alturaController =
      MaskedTextController(mask: '000');
  String resultado = '';
  bool invalido = false;

  calcula() {
    double? peso = double.tryParse(pesoController.text);
    double? altura = double.tryParse(alturaController.text);

    if (peso == null || altura == null) {
      resultado = 'Preencha todos os dados para calcular seu IMC';
      invalido = true;
    } else {
      invalido = false;
      altura /= 100;
      double imc = peso / (altura * altura);
      String imcFormatado = imc.toStringAsPrecision(2);

      if (imc > 40) {
        resultado = 'Seu IMC: $imcFormatado\nObesidade Grau III';
      } else if (imc > 34.9) {
        resultado = 'Seu IMC: $imcFormatado\nObesidade grau II';
      } else if (imc > 29.9) {
        resultado = 'Seu IMC: $imcFormatado\nObesidade grau I';
      } else if (imc > 24.9) {
        resultado = 'Seu IMC: $imcFormatado\nPré-obesidade';
      } else if (imc > 18.6) {
        resultado = 'Seu IMC: $imcFormatado\nPeso ideal';
      } else {
        resultado = 'Seu IMC: $imcFormatado\nAbaixo do peso';
      }
    }
  }
}
