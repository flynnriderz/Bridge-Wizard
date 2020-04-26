import 'package:flutter/material.dart';

class VulnerableEditor extends StatefulWidget {
  @override
  _VulnerableEditorState createState() => _VulnerableEditorState();
}

class _VulnerableEditorState extends State<VulnerableEditor> {
  // String vulnerable = 'Non-Vulnerable';
  List vulnerable = ['Non-Vulnerable', 'Vulnerable'];
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
                child: Text(
                  'vulnerable',
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
                    '${vulnerable[_index]}',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    color: Theme.of(context).errorColor,
                    onPressed: _index >= 1 ? null : _indexIncrese,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      //),
    );
  }
}