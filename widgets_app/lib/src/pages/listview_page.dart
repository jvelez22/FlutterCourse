import 'dart:async';

import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  ListPage({Key key}) : super(key: key);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<int> _list = List();
  int _lastItem = 0;
  ScrollController _scrollController = ScrollController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _addImages();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _fetchData();
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Lists'),
        ),
        body: Stack(
          children: <Widget>[_crearLista(), _crearLoading()],
        ));
  }

  Widget _crearLista() {
    return RefreshIndicator(
      onRefresh: _loadMainPage,
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          final image = _list[index];
          return FadeInImage(
              placeholder: AssetImage('assets/original.gif'),
              image:
                  NetworkImage('https://picsum.photos/500/300/?image=$image'));
        },
        itemCount: _list.length,
        controller: _scrollController,
      ),
    );
  }

  void _addImages() {
    for (var i = 0; i < 10; i++) {
      _lastItem++;
      _list.add(_lastItem);
    }

    setState(() {});
  }

  Future<Null> _fetchData() async {
    _isLoading = true;
    setState(() {});
    return Timer(Duration(seconds: 2), _httpResponse);
  }

  void _httpResponse() {
    _isLoading = false;
    _scrollController.animateTo(_scrollController.position.pixels + 100,
        duration: Duration(milliseconds: 250), curve: Curves.fastOutSlowIn);
    _addImages();
  }

  Widget _crearLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[CircularProgressIndicator()],
          ),
          SizedBox(height: 15.0)
        ],
      );
    } else {
      return Container();
    }
  }

  Future<Null> _loadMainPage() async {
    Timer(Duration(seconds: 2), () {
      _list.clear();
      _lastItem++;
      _addImages();
    });

    return Future.delayed(Duration(seconds: 2));
  }
}
