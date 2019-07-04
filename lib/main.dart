
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _info = 'INFORME SEUS DADOS';
  TextEditingController peso = TextEditingController(); 
  TextEditingController altura = TextEditingController(); 

  void _resetFields(){
    setState(() {
      peso.text = "";
      altura.text ="";
      _info = 'INFORME SEUS DADOS';
    });
  }

  void imc(){
    setState(() {

      double pesoC  = double.parse(peso.text);
      double alturaC  = double.parse(altura.text) / 100;
      double imc = pesoC / (alturaC * alturaC) ;
      print(pesoC);
      print(alturaC);
      print(imc);
      if(imc < 18.6){
        _info = 'ABAIXO DO PESO (${imc.toStringAsPrecision(4)})';
      }else if(imc >= 18.6  && imc < 24.9){
        _info = 'PESO IDEAL (${imc.toStringAsPrecision(4)})';
      }else if(imc >= 24.9  && imc < 29.9){
        _info = 'LEVEMENTE ACIMA DO PESO (${imc.toStringAsPrecision(4)})';
      }else if(imc >= 29.9  && imc < 34.9){
        _info = 'OBESIDADE GRAU I (${imc.toStringAsPrecision(4)})';
      }else if(imc >= 34.9  && imc < 39.9){
        _info = 'OBESIDADE GRAU II (${imc.toStringAsPrecision(4)})';
      }else{
        _info = 'OESIDADE GRAU III (${imc.toStringAsPrecision(4)})';
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return    
      Scaffold(
        appBar: AppBar(
          title: Text("Calculadora IMC"),
          centerTitle: true,
          backgroundColor: Colors.indigoAccent,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: _resetFields,
            ),
          ],
        ),

        backgroundColor: Colors.white,

        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(15.0, 0.0, 15.0, 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(Icons.person, size: 120.0, color: Colors.indigoAccent),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Peso (kg)",
                  labelStyle: TextStyle(color:  Colors.indigoAccent),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color:  Colors.indigoAccent, fontSize: 20.0),
                controller: peso,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Altura (cm)",
                  labelStyle: TextStyle(color:  Colors.indigoAccent),
                ),
                textAlign: TextAlign.center,
                style: TextStyle(color:  Colors.indigoAccent, fontSize: 20.0),
                controller: altura,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                height: 50.0,
                child: RaisedButton(
                  onPressed: imc,
                  child: Text("Calcular", 
                    style: TextStyle(color: Colors.white, fontSize: 25.0),                
                  ),
                  color: Colors.indigoAccent,
                ),
              ),
              Text(_info, 
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.indigo, fontSize: 20.0),
              ),           
            ],
          ),
        ),
        bottomNavigationBar: _itemIconOnly(),
      );
  }
}


Widget _itemIconOnly() => BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            backgroundColor: Colors.blueGrey,
            icon: Icon(
              Icons.home,
              size: 25,
              color: Colors.black38,
            ),
            title: Text(
              "IMC",
              style: TextStyle(fontSize: 20.0, color: Colors.indigoAccent),
            ),
            activeIcon: Icon(
              Icons.accessibility_new,
              size: 25,
              color: Colors.indigoAccent,
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blueGrey,
            icon: Icon(
              Icons.keyboard,
              size: 25,
              color: Colors.black38,
            ),
            title: Text(
              "Caculadora",
              style: TextStyle(fontSize: 20, color: Colors.black38),
            ),
          ),
          BottomNavigationBarItem(
            backgroundColor: Colors.blueGrey,
            icon: Icon(
              Icons.assignment_ind,
              size: 25,
              color: Colors.black38,
            ),
            title: Text(
              "Usuário",
              style: TextStyle(fontSize: 20, color: Colors.black38),
            ),
          ),
        ],
      );