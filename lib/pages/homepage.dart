import 'package:flutter/material.dart';
import 'package:cloud_data/database/database.dart';
import 'package:cloud_data/models/data.dart';
import 'package:cloud_data/components/data_card.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Database.getDocs(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Container(
              color: Colors.white,
              child: const LinearProgressIndicator(
                backgroundColor: Colors.black,
              ),
            );
          } else {
            if (snapshot.hasError) {
              return Container(
                color: Colors.white,
                child: Center(
                    child: Text(
                  'Something wrong, try again.',
                  style: Theme.of(context).textTheme.headline6,
                )),
              );
            } else {
              // var length;
              return Scaffold(
                appBar: AppBar(
                  title: Text('cloud data'),
                ),
                body: ListView.builder(
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: DataCard(
                          data: Data.fromMap(snapshot.data[index]),
                          onTapDelete: () async {
                            _deleteData(Data.fromMap(snapshot.data[index]));
                          },
                        ),
                      );
                    },
                    itemCount: snapshot.data.length),
              );
            }
          }
        });
  }

  _deleteData(Data data) async {
    await Database.delete(data);
    setState(() {});
  }
}
