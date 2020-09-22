import 'package:flutter/material.dart';

void main() {
  runApp(SwipeGesture());
}

class SwipeGesture extends StatefulWidget {
  SwipeGesture({Key key}) : super(key: key);

  @override
  _SwipeGestureState createState() => _SwipeGestureState();
}

class _SwipeGestureState extends State<SwipeGesture> {
  final items = List<String>.generate(26, (index) => "Item ${index + 1}");

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Dismissing Item",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Dismissing item"),
        ),
        body: ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];

              return Dismissible(
                key: Key(item),
                onDismissed: (direction) {
                  setState(() {
                    items.removeAt(index);
                  });
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text("$item dismissed")));
                
                },
                background: Container(color: Colors.red,),
                child: ListTile(title: Text("$item"),),
              );
            }),
      ),
    );
  }
}
