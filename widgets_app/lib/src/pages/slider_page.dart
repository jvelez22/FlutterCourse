import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _sliderValue = 100.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
          padding: EdgeInsets.only(top: 50.0),
          child: Column(
            children: <Widget>[_crearSlider(), Expanded(child: _crearImagen())],
          )),
    );
  }

  Widget _crearSlider() {
    return Slider(
        value: _sliderValue,
        min: 10.0,
        max: 250.0,
        label: '$_sliderValue',
        onChanged: (value) {
          setState(() {
            _sliderValue = value;
          });
        });
  }

  Widget _crearImagen() {
    return Image(
        image: NetworkImage(
            'https://vignette.wikia.nocookie.net/marvelcinematicuniverse/images/a/ab/Iron_Man_Mark_LXXXV.png/revision/latest?cb=20190405192851&path-prefix=es'),
        width: _sliderValue,
        fit: BoxFit.contain);
  }
}
