import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _value = 0;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: PreferredSize(
        
        preferredSize: Size.fromHeight(100.0),
        
        child: getTabBar(),
      ),
    );
  }

  getTabBar(){
    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 2.0,
      children: [
        ChoiceChip(
      pressElevation: 0.0,
      selectedColor: Colors.blue,
      backgroundColor: Colors.grey[100],
      label: Text("Story"),
      selected: _value == 0,
      onSelected: (bool selected) {
        setState(() {
          _value = selected ? 0 : null;
        });
      },
    ),
    ChoiceChip(
      pressElevation: 0.0,
      selectedColor: Colors.blue,
      backgroundColor: Colors.grey[100],
      label: Text("Chats"),
      selected: _value == 1,
      onSelected: (bool selected) {
        setState(() {
          _value = selected ? 1 : null;
        });
      },
    ),
   
    ChoiceChip(
      pressElevation: 0.0,
      selectedColor: Colors.blue,
      backgroundColor: Colors.grey[100],
      label: Text("Calls"),
      selected: _value == 2,
      onSelected: (bool selected) {
        setState(() {
          _value = selected ? 2 : null;
        });
      },
    ),
      ],
    );
  }
}