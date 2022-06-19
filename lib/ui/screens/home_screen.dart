import 'package:flutter/material.dart';
import 'package:imc_mobile_app/blocs/imc.bloc.dart';
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
      padding: const EdgeInsets.fromLTRB(22.0, 14.0, 14.0, 14.0),
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            child: const Icon(Icons.help),
          ),
          const SizedBox(height: 14),
          TextInput('Peso (Kg)', bloc.pesoController),
          const SizedBox(height: 14),
          TextInput('Altura (cm)', bloc.alturaController),
          const SizedBox(height: 14),
          Text(bloc.resultado),
          const SizedBox(height: 14),
          SizedBox(
            width: 225,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  bloc.calcula();
                });
              },
              child: const Text('Calcular'),
            ),
          )
        ],
      ),
    );
  }
}
