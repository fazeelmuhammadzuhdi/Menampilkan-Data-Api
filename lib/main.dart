import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quiz_api/api.dart';
import 'package:quiz_api/model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Service ServiceAPI = Service();
  late Future<List<cModel>> ListData;

  @override
  void initState() {
    super.initState();
    ListData = ServiceAPI.getAllData();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("JSON DATA"),
        ),
        body: Container(
          child: FutureBuilder<List<cModel>>(
            future: ListData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<cModel> isidata = snapshot.data!;
                return ListView.builder(itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: ListTile(
                        title: Text(isidata[index].namaBarang),
                        subtitle: Text(isidata[index].deskripsi),
                        trailing: Text(
                          isidata[index].harga,
                          style: TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.bold,
                            
                          ),
                        ),
                        leading: CircleAvatar(
                          backgroundImage: NetworkImage(isidata[index].foto),
                        ),
                      ),
                    ),
                  );
                });
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
