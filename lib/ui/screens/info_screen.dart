import 'package:flutter/material.dart';
import 'package:imc_mobile_app/blocs/imc.bloc.dart';

class InfoScreen extends StatelessWidget {
  InfoScreen({Key? key}) : super(key: key);

  final String title = 'Informações sobre o IMC';
  final ImcBloc bloc = ImcBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appHeader(),
      body: _appBody(context),
    );
  }

  AppBar _appHeader() {
    return AppBar(
      title: Center(
        child: Text(title),
      ),
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
    );
  }

  Padding _appBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14.0, 32.0, 14.0, 14.0),
      child: Column(
        children: <Widget>[
          const _StyledText(
              title: 'Menor que 18.5', subtitle: 'Abaixo do peso'),
          const _StyledText(
              title: 'Entre 18.5 e 24.9', subtitle: 'Peso normal'),
          const _StyledText(
              title: 'Entre 25.0 e 29.9', subtitle: 'Pré-obesidade'),
          const _StyledText(
              title: 'Entre 30.0 e 34.9', subtitle: 'Obesidade Grau 1'),
          const _StyledText(
              title: 'Entre 35.0 e 39.9', subtitle: 'Obesidade Grau 2'),
          const _StyledText(title: 'Acima de 40', subtitle: 'Obesidade Grau 3'),
          const SizedBox(height: 20),
          Center(
            child: SizedBox(
              width: 225,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Voltar'),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _StyledText extends StatelessWidget {
  const _StyledText({Key? key, required this.title, required this.subtitle})
      : super(key: key);

  final String title;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: Column(children: <Widget>[
        Text(
          title,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Text(
          subtitle,
          style: const TextStyle(fontSize: 18),
        ),
      ]),
    );
  }
}
