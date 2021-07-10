import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

/// This is the main application widget.
class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        // appBar: AppBar(title: const Text(_title)),
        body: const Home(),
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> listNames = ["Helio", "Alvaro", "Jose"];

  double _currentSliderValue = 0.4;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(
            child: TweenAnimationBuilder(
              builder: (BuildContext context, Size size, Widget child) {
                return Container(
                  height: size.height,
                  width: size.width,
                  decoration: BoxDecoration(
                      color: Colors.red,
                      border: Border.all(),
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                );
              },
              tween: SizeTween(
                  begin: MediaQuery.of(context).size,
                  end: Size(
                      MediaQuery.of(context).size.width -
                          (MediaQuery.of(context).size.width *
                              ((_currentSliderValue - 0.4) * 0.4)),
                      MediaQuery.of(context).size.height -
                          (MediaQuery.of(context).size.height *
                              ((_currentSliderValue - 0.4) * 0.4)))),
              duration: Duration.zero,
            ),
          ),
          NotificationListener<DraggableScrollableNotification>(
            // ignore: missing_return
            onNotification: (notification) {
              setState(() {
                _currentSliderValue = notification.extent;
                print("${notification.extent}");
              });
            },
            child: DraggableScrollableSheet(
                initialChildSize: 0.40,
                minChildSize: 0.40,
                builder:
                    (BuildContext context, ScrollController scrollcontroller) {
                  return SingleChildScrollView(
                      controller: scrollcontroller,
                      child: Column(
                        children: [
                          AnimatedContainer(
                            duration: Duration(seconds: 2),
                            child: Container(
                              height: (_currentSliderValue - 0.4) * 100,
                              color: Colors.grey,
                            ),
                          ),
                          Container(
                            height: 120,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.amberAccent,
                            child: Text("Hello World"),
                          ),
                          Container(
                            height: 120,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.blue,
                            child: Text("Hello World"),
                          ),
                          Container(
                            height: 120,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.green,
                            child: Text("Hello World"),
                          ),
                          Container(
                            height: 120,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.pink,
                            child: Text("Hello World"),
                          ),
                          Container(
                            height: 120,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.cyan,
                            child: Text("Hello World"),
                          ),
                          Container(
                            height: 120,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.orange,
                            child: Text("Hello World"),
                          ),
                          Container(
                            height: 120,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.teal,
                            child: Text("Hello World"),
                          ),
                        ],
                      ));
                }),
          ),
        ],
      ),
    );
  }
}
