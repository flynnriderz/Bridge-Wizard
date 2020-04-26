import 'package:flutter/material.dart';
// import '../models/calculating.dart';

class ContractEditor extends StatefulWidget {
  @override
  _ContractEditorState createState() => _ContractEditorState();
}

class _ContractEditorState extends State<ContractEditor> {
  int contractPoint = 1;


  void _contractIncrese() {
    setState(() {
      contractPoint += 1;
    });
  }

  void _contractDecrese() {
    setState(() {
      contractPoint -= 1;
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
                  'contract',
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
                child: Center(
                  child: ListTile(
                    leading: IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      color: Theme.of(context).errorColor,
                      onPressed: contractPoint <= 1 ? null : _contractDecrese,
                    ),
                    title: Text(
                      '$contractPoint',
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
                      onPressed: contractPoint >= 7 ? null : _contractIncrese,
                    ),
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