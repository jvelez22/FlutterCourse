import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  InputPage({Key key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String _name = '';
  String _email = '';
  String _password = '';
  String _date = '';
  String _optionSelected = 'Volar';
  List<String> _powers = ['Volar', 'Rayos X', 'Fuerza'];
  TextEditingController _inputFieldDateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        children: <Widget>[
          _crearInput(),
          Divider(),
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropDown(),
          Divider(),
          _crearPersona()
        ],
      ),
    );
  }

  Widget _crearInput() {
    return TextField(
        decoration: InputDecoration(
            counter: Text('Caracteres: ${_name.length}'),
            hintText: 'Ingrese el Nombre',
            labelText: 'Nombre',
            helperText: 'Solo el nombre',
            suffixIcon: Icon(Icons.accessibility),
            icon: Icon(Icons.account_circle),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
        onChanged: (value) => setState(() {
              _name = value;
            }));
  }

  Widget _crearPersona() {
    return ListTile(
      title: Text('El nombre es: $_name'),
      subtitle: Text('El email es: $_email'),
      trailing: Text(_optionSelected),
    );
  }

  Widget _crearEmail() {
    return TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
            counter: Text('Caracteres: ${_name.length}'),
            hintText: 'Ingrese el Email',
            labelText: 'Email',
            suffixIcon: Icon(Icons.email),
            icon: Icon(Icons.account_circle),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
        onChanged: (value) => setState(() {
              _email = value;
            }));
  }

  Widget _crearPassword() {
    return TextField(
        obscureText: true,
        decoration: InputDecoration(
            counter: Text('Caracteres: ${_name.length}'),
            hintText: 'Ingrese el Password',
            labelText: 'Password',
            suffixIcon: Icon(Icons.lock),
            icon: Icon(Icons.account_circle),
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
        onChanged: (value) => setState(() {
              _password = value;
            }));
  }

  Widget _crearFecha(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputFieldDateController,
      decoration: InputDecoration(
          counter: Text('Caracteres: ${_name.length}'),
          hintText: 'Ingrese la fecha de nacimiento',
          labelText: 'Fecha de Nacimiento',
          suffixIcon: Icon(Icons.perm_contact_calendar),
          icon: Icon(Icons.calendar_today),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(20.0))),
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
        _sleccionarFecha(context);
      },
    );
  }

  void _sleccionarFecha(BuildContext context) async {
    DateTime datePicked = await showDatePicker(
        locale: Locale('es', 'ES'),
        context: context,
        initialDate: new DateTime.now(),
        firstDate: new DateTime(2018),
        lastDate: new DateTime(2025));

    if (datePicked != null) {
      setState(() {
        _date = datePicked.toString();
        _inputFieldDateController.text = datePicked.toString();
      });
    }
  }

  Widget _crearDropDown() {
    return Row(
      children: <Widget>[
        Icon(Icons.select_all),
        SizedBox(width: 20.0),
        DropdownButton(
            value: _optionSelected,
            items: getOptions(),
            onChanged: (opt) {
              setState(() {
                _optionSelected = opt;
              });
            })
      ],
    );
  }

  List<DropdownMenuItem<String>> getOptions() {
    List<DropdownMenuItem<String>> list = new List();

    _powers.forEach((power) {
      list.add(DropdownMenuItem(
        child: Text(power),
        value: power,
      ));
    });

    return list;
  }
}
