import 'package:flutter/material.dart';
import 'package:passwordmeter_dart/password_meter.dart';

class PasswordInput extends StatefulWidget {
  PasswordInput({Key? key}) : super(key: key);

  @override
  _PasswordInputState createState() => _PasswordInputState();
}

class _PasswordInputState extends State<PasswordInput> {
  static const color1 = 0xFF212121;
  static const color2 = 0xFFFFB74D;
  static const color3 = 0xFF827717;
  static const color4 = 0xFFFFFFFF;
  static const color5 = 0xFFF5ECDF;
  final _myController = TextEditingController();

  PassWordMeter pw = PassWordMeter();
  String _helperText = 'Introduce tu password';
  double percent = 0.0;

  @override
  void dispose() {
    // Limpia el controlador cuando el widget se elimine del árbol de widgets
    _myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color.lerp(Colors.red, Colors.green, percent/100),
      appBar: AppBar(
        backgroundColor: Color(color1),
        title: Text(
          'Herramienta para password',
          style: TextStyle(
            fontSize: 16,
            color: Color(color4),
          ),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            
            child: TextField(
              controller: _myController,
              onChanged: (text) {
                setState(() {
                  pw.password = text;
                  _helperText = 'Score = ${pw.score}';
                  percent = pw.score.toDouble();
                });
              },
              //  autofocus: true,
              keyboardType: TextInputType.text,
              autocorrect: false,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Color(color1),
              ),
              decoration: InputDecoration(
                prefix: IconButton(
                  icon: new Icon(Icons.clear),
                  onPressed: () {
                    setState(() {
                      pw.password = '';
                      pw.comprobarCommonPassword();
                    });

                    _myController.clear();
                  },
                ),
                hintText: 'Password',
                helperText: _helperText,
               
                helperStyle: TextStyle(color: Color.lerp(Colors.red, Colors.green, percent/100)),//Colors.red),
               border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.red, width: 3),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
