import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

/// Este é o widget principal do aplicativo.
class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  static const String _title = 'APP';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatefulWidget(),
    );
  }
}

/// Este é o widget com monitoração de estado que o aplicativo principal instancia.
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

/// Esta é a classe privada State que acompanha MyStatefulWidget.
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'PAGINA HOME',
      style: optionStyle,
    ),
    Text(
      'Index 1: Vez',
      style: optionStyle,
    ),
    Text(
      'Index 2: Viagens',
      style: optionStyle,
    ),
    Text(
      'Index 3: Minhas Viagens',
      style: optionStyle,
    ),
    Text(
      'Index 4: Rastreamento',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ESQUECE'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.blue,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.feedback),
            label: 'Avisos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: 'Vez',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.departure_board),
            label: 'Viagens',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_travel),
            label: 'Minhas Viagens',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.my_location),
            label: 'Rastreamento',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
}
