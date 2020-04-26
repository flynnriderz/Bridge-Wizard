import 'package:flutter/material.dart';

class DeclarerEditor extends StatefulWidget {
  @override
  _DeclarerEditorState createState() => _DeclarerEditorState();
}

class _DeclarerEditorState extends State<DeclarerEditor> {
  List _declarer = ['N', 'E', 'S', 'W'];
  int _index = 0;

  void _indexIncrese() {
    setState(() {
      _index += 1;
    });
    
  }

  void _indexDecrese() {
    setState(() {
      _index -= 1;
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          Container(
            width: 100,
            height: 60,
            child: Card(
              child: Center(
                child: const Text(
                  'declarer',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 20,
            child: Container(
              height: 60,
              child: Card(
                child: ListTile(
                  leading: IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    color: Theme.of(context).errorColor,
                    onPressed: _index <= 0 ? null : _indexDecrese,
                  ),
                  title: Text(
                    '${_declarer[_index]}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    color: Theme.of(context).errorColor,
                    onPressed: _index >= 3 ? null : _indexIncrese,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),

    );
  }
}