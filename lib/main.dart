//Código feito pro arthur L. kroenke, Sesi senai Itajai SC, 18/10/2022
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Álcool e Gasolina',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      home: const MyHomePage(title: 'Álcool e Gasolina'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController gasolinaControle = TextEditingController();
  TextEditingController alcoolControle = TextEditingController();

  String _textResultado = "Informe os campos para reber o resultado";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Gasolina ou Álcool?",
          style: TextStyle(fontFamily: "Poppins-Light"),
        ),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 70, vertical: 10),
                child: Column(
                  children: [
                    Icon(
                      Icons.directions_car,
                      size: 70,
                      color: Color.fromARGB(255, 249, 178, 76),
                    ),
                    Text(
                      "Álcool e Gasolina",
                      style: TextStyle(
                          fontSize: 20,
                          fontFamily: "Poppins-Light",
                          color: Color.fromARGB(255, 249, 178, 76)),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    width: 20,
                    color: Color.fromARGB(255, 249, 178, 76).withOpacity(0.2),
                  ),
                ),
              ),
              contruirFormsAlcool(),
              contruirFormsGasolina(),
              Container(
                margin: EdgeInsets.all(30),
                height: 60,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.8),
                    borderRadius: BorderRadius.circular(60)),
                child: OutlinedButton.icon(
                  icon: Icon(
                    Icons.ads_click,
                    size: 38,
                    color: Color.fromARGB(255, 249, 178, 76),
                  ),
                  label: Text(
                    "Calcular",
                    style: TextStyle(
                        color: Color.fromARGB(255, 249, 178, 76), fontSize: 20),
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      calcula();
                      FocusScope.of(context).requestFocus(new FocusNode());
                    }
                  },
                ),
              ),
              OutlinedButton.icon(
                icon: Icon(
                  Icons.cleaning_services,
                  size: 28,
                  color: Color.fromARGB(255, 249, 178, 76),
                ),
                label: Text(
                  "Limpar",
                  style: TextStyle(
                      color: Color.fromARGB(255, 249, 178, 76), fontSize: 15),
                ),
                onPressed: () {
                  setState(() {
                    _textResultado = "Resultado limpo";
                    gasolinaControle.text = "";
                    alcoolControle.text = "";
                  });
                },
              ),
              Text(
                "Resultado:",
                style: TextStyle(
                    fontSize: 20, color: Color.fromARGB(255, 115, 115, 180)),
              ),
              Text(
                _textResultado,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: "Oswald",
                    fontSize: 25,
                    color: Color.fromARGB(255, 115, 115, 180)),
              ),
              Padding(padding: EdgeInsets.all(20)),
              Image.asset(
                "assets/images/LogoEscolaSColorido.png",
                width: 200,
                height: 100,
              ),
            ],
          ),
        ),
      ),
    );
  }

  contruirFormsAlcool() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: "Alcool RS",
          labelStyle: TextStyle(
              color: Color.fromARGB(255, 60, 183, 168), fontSize: 20)),
      controller: alcoolControle,
      validator: (value) {
        if (value!.isEmpty) {
          return 'informe valor do alcool!!';
        }
        return null;
      },
    );
  }

  contruirFormsGasolina() {
    return TextFormField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          labelText: "Gasolina RS",
          labelStyle: TextStyle(
              color: Color.fromARGB(255, 60, 183, 168), fontSize: 20)),
      controller: gasolinaControle,
      validator: (value) {
        if (value!.isEmpty) {
          return 'informe valor da gasolina!!';
        }
        return null;
      },
    );
  }

  void calcula() {
    setState(() {
      double gasolina = double.parse(gasolinaControle.text);
      double alcool = double.parse(alcoolControle.text);

      double resultado = (alcool / gasolina);

      if (resultado > 0.70) {
        _textResultado =
            "Percentual : (${resultado.toStringAsPrecision(3)})\nVale a pena abastecer com Gasolina";
      } else {
        _textResultado =
            "Percentual : (${resultado.toStringAsPrecision(3)})\nVale a pena abastecer com Álcool";
      }
      gasolinaControle.text = "";
      alcoolControle.text = "";
    });
  }
}
