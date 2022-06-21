import 'package:flutter/material.dart';
import 'package:imc_mobile_app/blocs/imc.bloc.dart';
import 'package:imc_mobile_app/ui/screens/info_screen.dart';
import 'package:imc_mobile_app/ui/widgets/text_input.widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ImcBloc bloc = ImcBloc();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appHeader(),
      body: _appBody(),
    );
  }

  AppBar _appHeader() {
    return AppBar(
      title: Center(
        child: Text(
          widget.title,
          style: const TextStyle(color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
    );
  }

  Padding _appBody() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14.0, 22.0, 14.0, 14.0),
      child: Column(
        children: <Widget>[
          Row(
            children: [
              const Expanded(
                  child: Text(
                '''
Preencha os campos abaixo''',
                style: TextStyle(fontSize: 20),
              )),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => InfoScreen()));
                },
                child: const Icon(Icons.help),
              )
            ],
          ),
          const SizedBox(height: 20),
          TextInput('Peso em Kilogramas', bloc.pesoController),
          const SizedBox(height: 40),
          TextInput('Altura em centímetros', bloc.alturaController),
          const SizedBox(height: 30),
          Text(bloc.resultado,
              textAlign: TextAlign.center,
              style: (bloc.invalido)
                  ? const TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    )
                  : const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    )),
          const SizedBox(height: 30),
          SizedBox(
            width: 225,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  bloc.calcula();
                });
              },
              child: const Text('Calcular IMC'),
            ),
          )
        ],
      ),
    );
  }
}
