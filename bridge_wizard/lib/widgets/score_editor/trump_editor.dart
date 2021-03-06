import 'package:flutter/material.dart';
import '../../methods/calculator.dart';

class TrumpEditor extends StatefulWidget {
  final Calculator recentCalculator;
  TrumpEditor(this.recentCalculator);

  @override
  _TrumpEditorState createState() => _TrumpEditorState();
}

class _TrumpEditorState extends State<TrumpEditor> {
  List _trump = ['Clubs', 'Diamonds', 'Hearts', 'Spades', 'No Trump'];
  int _index = 0;

  void _indexIncrese() {
    setState(() {
      _index += 1;
      widget.recentCalculator.trumpIndexes = _index;
    });
    
  }

  void _indexDecrese() {
    setState(() {
      _index -= 1;
      widget.recentCalculator.trumpIndexes = _index;
    });
    
  }

  int get thisIndex {
    return _index;
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
                  'Trump',
                  style: TextStyle(
                    fontSize: 20,
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
                    '${_trump[_index]}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    color: Theme.of(context).errorColor,
                    onPressed: _index >= 4 ? null : _indexIncrese,
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
