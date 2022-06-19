import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class ImcBloc {
  final MaskedTextController pesoController = MaskedTextController(mask: '000');
  final MaskedTextController alturaController =
      MaskedTextController(mask: '000');
  String resultado = '';

  calcula() {
    double? peso = double.tryParse(pesoController.text);
    double? altura = double.tryParse(alturaController.text);

    if (peso == null || altura == null) {
      resultado = 'Preencha todos os dados para calcular seu IMC';
    } else {
      altura /= 100;
      double imc = peso / (altura * altura);
      String imcFormatado = imc.toStringAsPrecision(2);

      if (imc > 40) {
        resultado = 'Obesidade Grau III (imc: $imcFormatado)';
      } else if (imc > 34.9) {
        resultado = 'Obesidade grau II (imc: $imcFormatado)';
      } else if (imc > 29.9) {
        resultado = 'Obesidade grau I (imc: $imcFormatado)';
      } else if (imc > 24.9) {
        resultado = 'Pré-obesidade (imc: $imcFormatado)';
      } else if (imc > 18.6) {
        resultado = 'Peso ideal (imc: $imcFormatado)';
      } else {
        resultado = 'Abaixo do peso (imc: $imcFormatado)';
      }
    }
  }
}
