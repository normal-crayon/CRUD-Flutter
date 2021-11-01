import 'package:flutter/material.dart';
import 'package:cloud_data/models/data.dart';

class DataCard extends StatelessWidget {
  DataCard({required this.data, required this.onTapDelete});
  final Data data;
  final Function() onTapDelete;

  @override
  Widget build(BuildContext context) {
    return Material(
        elevation: 2.0,
        color: Colors.white,
        child: ListTile(
            title: Text(data.name),
            // subtitle: Text('${data.id}'),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  child: Icon(Icons.delete),
                  onTap: onTapDelete,
                ),
              ],
            )));
  }
}
