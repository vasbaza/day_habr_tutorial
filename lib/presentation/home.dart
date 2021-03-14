import 'package:day_habr_tutorial/domain/state/home/home_state.dart';
import 'package:day_habr_tutorial/internal/dependencies/home_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _latController = TextEditingController();
  final _lngController = TextEditingController();

  HomeState _homeState;

  @override
  void initState() {
    super.initState();
    _homeState = HomeModule.homeState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(body: _getBody()),
    );
  }

  Widget _getBody() {
    return SafeArea(
        child: Padding(
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _getRowInput(),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            child: Text('Получить'),
            onPressed: _getDay,
          ),
          SizedBox(
            height: 20,
          ),
          _getDayInfo()
        ],
      ),
    ));
  }

  Widget _getRowInput() {
    return Row(
      children: [
        Expanded(
            child: TextField(
          controller: _lngController,
          keyboardType:
              TextInputType.numberWithOptions(decimal: true, signed: true),
          decoration: InputDecoration(hintText: 'Долгота'),
        )),
        SizedBox(
          height: 20,
        ),
        Expanded(
          child: TextField(
            controller: _latController,
            keyboardType:
                TextInputType.numberWithOptions(decimal: true, signed: true),
            decoration: InputDecoration(hintText: 'Широта'),
          ),
        ),
      ],
    );
  }

  Widget _getDayInfo() {
    return Observer(builder: (_) {
      if (_homeState.isLoading) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      if (_homeState.day == null) {
        return Container(
          width: 0,
          height: 0,
        );
      }
      // print(_homeState);
      return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('Восход: ${_homeState.day.sunrise.toLocal()}'),
          Text('Закат: ${_homeState.day.sunset.toLocal()}'),
          Text('Полдень: ${_homeState.day.solarNoon.toLocal()}'),
          Text(
              'Продолжительность ${Duration(seconds: _homeState.day.dayLength)}')
        ],
      );
    });
  }

  void _getDay() {
    // получаем данные
    final lat = double.tryParse(_latController.text);
    final lng = double.tryParse(_lngController.text);
    _homeState.getDay(latitude: lat, longitude: lng);
  }
}
