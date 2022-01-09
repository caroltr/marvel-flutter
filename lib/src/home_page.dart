import 'package:flutter/material.dart';
import 'package:marvel/src/services/marvel_controller.dart';
import 'package:marvel/src/services/marvel_list_model.dart';
import 'package:marvel/src/services/marvel_service.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;

  final List<String> entries = <String>['A', 'B', 'C', 'D', 'E', 'F', 'G'];
  final List<int> colorCodes = <int>[600, 500, 100, 100, 600, 500, 600];

  void _incrementCounter() {
    setState(() {
      // _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var service = MarvelService();
    var controller = MarvelController(service: service);

    var result = controller.getTodos();

    print(result);

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<List<MarvelList>>(
          future: controller.getTodos(),
          initialData: [],
          builder: (context, snapshot) {
            return snapshot.hasData
                ? Center(
                    child: GridView.count(
                      crossAxisCount: 3,
                      padding: const EdgeInsets.all(8),
                      children: List.generate(snapshot.data!.length, (index) {
                        final item = snapshot.data![index];
                        return Container(
                          height: 50,
                          margin: const EdgeInsets.all(8),
                          color: Colors.red[100],
                          child: Center(child: Text(item.title)),
                        );
                      }),
                    ),
                  )
                : Center();
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
