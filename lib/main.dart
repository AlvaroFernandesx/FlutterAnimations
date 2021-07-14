import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
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
  // List<Color> colors = [
  //   Colors.amberAccent,
  //   Colors.blue,
  //   Colors.green,
  //   Colors.pink,
  //   Colors.cyan,
  //   Colors.orange,
  //   Colors.teal,
  //   Colors.deepOrange,
  //   Colors.orange,
  //   Colors.teal,
  //   Colors.deepOrange,
  // ];

  List<Container> containers = [
    Container(
      height: 120,
      width: 420,
      color: Colors.yellow,
    ),
    Container(
      height: 120,
      width: 420,
      color: Colors.red,
    ),
    Container(
      height: 120,
      width: 420,
      color: Colors.green,
    ),
    Container(
      height: 120,
      width: 420,
      color: Colors.pink,
    ),
    Container(
      height: 120,
      width: 420,
      color: Colors.cyan,
    ),
    Container(
      height: 120,
      width: 420,
      color: Colors.orange,
    ),
    Container(
      height: 120,
      width: 420,
      color: Colors.blue,
    ),
    Container(
      height: 120,
      width: 420,
      color: Colors.grey,
    ),
    Container(
      height: 120,
      width: 420,
      color: Colors.cyan,
    ),
    Container(
      height: 120,
      width: 420,
      color: Colors.orange,
    ),
    Container(
      height: 120,
      width: 420,
      color: Colors.blue,
    ),
    Container(
      height: 120,
      width: 420,
      color: Colors.grey,
    ),
  ];

  PanelController _pc = new PanelController();

  double _currentSliderValue = 0.4;
  final key = GlobalKey<AnimatedListState>();

  void close() {
    _pc.close();
    if (containers.length == 13) {
      containers.removeAt(0);
    }
  }

  void open() {
    _pc.open();
    if (containers.length < 13) {
      containers.insert(
        0,
        Container(
          height: 120,
          width: 420,
          color: Colors.grey,
        ),
      );
    }
  }

  void appendMenu() {
    setState(() {
      containers.insert(
          3,
          Container(
            height: 120,
            width: 120,
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      color: Colors.red,
                    ),
                    Container(
                      height: 60,
                      width: 60,
                      color: Colors.brown,
                    )
                  ],
                ),
                Row(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      color: Colors.blue,
                    ),
                    Container(
                      height: 60,
                      width: 60,
                      color: Colors.green,
                    )
                  ],
                ),
              ],
            ),
          ));
    });

    _pc.animatePanelToPosition(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton:
            FloatingActionButton(onPressed: () => appendMenu()),
        backgroundColor: Colors.black,
        body: SlidingUpPanel(
          snapPoint: 0.2,
          color: Colors.transparent,
          onPanelOpened: open,
          onPanelClosed: close,
          onPanelSlide: (value) {
            setState(() {
              _currentSliderValue = value;
            });
          },
          minHeight: MediaQuery.of(context).size.height * 0.4,
          controller: _pc,
          maxHeight: MediaQuery.of(context).size.height,
          panelBuilder: (scroll) {
            return AnimatedList(
              key: key,
              controller: scroll,
              initialItemCount: containers.length,
              itemBuilder: (BuildContext context, int index,
                  Animation<double> animation) {
                return buildItem(index, animation);
              },
            );
          },
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: MediaQuery.of(context).size.height -
                    (MediaQuery.of(context).size.height *
                        ((_currentSliderValue - 0.4) * 0.4)),
                width: MediaQuery.of(context).size.width -
                    (MediaQuery.of(context).size.width *
                        ((_currentSliderValue - 0.4) * 0.4)),
                decoration: BoxDecoration(
                    color: Colors.red,
                    border: Border.all(),
                    borderRadius: BorderRadius.all(Radius.circular(20))),
              ),
            ],
          ),
        ));
  }

  Widget buildItem(int index, Animation<double> animation) =>
      SizeTransition(sizeFactor: animation, child: containers[index]);
}
