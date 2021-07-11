import 'package:flutter/cupertino.dart';
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

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  List<String> listNames = ["Helio", "Alvaro", "Jose"];

  double _currentSliderValue = 0.4;
  ScrollController draggableController;
  bool showAppBar = false;

  AnimationController _controllerAppBar;

  @override
  void initState() {
    super.initState();
    _controllerAppBar = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: showAppBar
      //     ? CupertinoNavigationBar(
      //         backgroundColor: Theme.of(context).backgroundColor,
      //         middle: Text("GAMBETA MLK DOIDO",
      //             style: TextStyle(
      //               color: Theme.of(context).textTheme.headline6.color,
      //             )))
      //     : null,
      backgroundColor: Colors.white,
      body: AnimatedBuilder(
        animation: _controllerAppBar,
        builder: (context, child) => Stack(children: <Widget>[
          Transform.translate(
            offset: Offset(0, -_controllerAppBar.value * 64),
            child: Container(
                height: 100.0,
                child: AppBar(
                  title: Text('GAMBETA MLK DOIDO'),
                  leading: Icon(
                    Icons.arrow_back,
                  ),
                )),
          ),
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
                if (notification.extent > 0.5) {
                  showAppBar = true;
                  _controllerAppBar.forward();
                }

                if (notification.extent < 1) {
                  showAppBar = false;
                  _controllerAppBar.reverse();
                }
                _currentSliderValue = notification.extent;
              });
            },
            child: DraggableScrollableSheet(
                initialChildSize: 0.40,
                minChildSize: 0.40,
                builder:
                    (BuildContext context, ScrollController scrollcontroller) {
                  if (scrollcontroller.hasClients) {
                    draggableController = scrollcontroller;
                  }

                  return SingleChildScrollView(
                      controller: scrollcontroller,
                      child: Column(
                        children: [
                          // AnimatedOpacity(
                          // duration: Duration(milliseconds: 200),
                          // opacity: _currentSliderValue == 1 ? 1 : 0,
                          Visibility(
                            visible: _currentSliderValue > 8 ? true : false,
                            child: AnimatedContainer(
                              duration: Duration.zero,
                              child: Container(
                                height: _currentSliderValue > 8 ? 120 : 0,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                          // ),
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
        ]),
      ),
    );
  }
}
//         )
//       body: Stack(
//         children: [
        //   Center(
        //     child: TweenAnimationBuilder(
        //       builder: (BuildContext context, Size size, Widget child) {
        //         return Container(
        //           height: size.height,
        //           width: size.width,
        //           decoration: BoxDecoration(
        //               color: Colors.red,
        //               border: Border.all(),
        //               borderRadius: BorderRadius.all(Radius.circular(20))),
        //         );
        //       },
        //       tween: SizeTween(
        //           begin: MediaQuery.of(context).size,
        //           end: Size(
        //               MediaQuery.of(context).size.width -
        //                   (MediaQuery.of(context).size.width *
        //                       ((_currentSliderValue - 0.4) * 0.4)),
        //               MediaQuery.of(context).size.height -
        //                   (MediaQuery.of(context).size.height *
        //                       ((_currentSliderValue - 0.4) * 0.4)))),
        //       duration: Duration.zero,
        //     ),
        //   ),
        //   NotificationListener<DraggableScrollableNotification>(
        //     // ignore: missing_return
        //     onNotification: (notification) {
        //       setState(() {
        //         if (notification.extent == 1) {
        //           showAppBar = true;
        //         }

        //         if (notification.extent < 1) {
        //           showAppBar = false;
        //         }
        //         _currentSliderValue = notification.extent;
        //       });
        //     },
        //     child: DraggableScrollableSheet(
        //         initialChildSize: 0.40,
        //         minChildSize: 0.40,
        //         builder:
        //             (BuildContext context, ScrollController scrollcontroller) {
        //           if (scrollcontroller.hasClients) {
        //             draggableController = scrollcontroller;
        //           }

        //           return SingleChildScrollView(
        //               controller: scrollcontroller,
        //               child: Column(
        //                 children: [
        //                   // AnimatedOpacity(
        //                   // duration: Duration(milliseconds: 200),
        //                   // opacity: _currentSliderValue == 1 ? 1 : 0,
        //                   Visibility(
        //                     visible: _currentSliderValue > 8 ? true : false,
        //                     child: AnimatedContainer(
        //                       duration: Duration.zero,
        //                       child: Container(
        //                         height: _currentSliderValue > 8 ? 120 : 0,
        //                         color: Colors.grey,
        //                       ),
        //                     ),
        //                   ),
        //                   // ),
        //                   Container(
        //                     height: 120,
        //                     width: MediaQuery.of(context).size.width,
        //                     color: Colors.amberAccent,
        //                     child: Text("Hello World"),
        //                   ),
        //                   Container(
        //                     height: 120,
        //                     width: MediaQuery.of(context).size.width,
        //                     color: Colors.blue,
        //                     child: Text("Hello World"),
        //                   ),
        //                   Container(
        //                     height: 120,
        //                     width: MediaQuery.of(context).size.width,
        //                     color: Colors.green,
        //                     child: Text("Hello World"),
        //                   ),
        //                   Container(
        //                     height: 120,
        //                     width: MediaQuery.of(context).size.width,
        //                     color: Colors.pink,
        //                     child: Text("Hello World"),
        //                   ),
        //                   Container(
        //                     height: 120,
        //                     width: MediaQuery.of(context).size.width,
        //                     color: Colors.cyan,
        //                     child: Text("Hello World"),
        //                   ),
        //                   Container(
        //                     height: 120,
        //                     width: MediaQuery.of(context).size.width,
        //                     color: Colors.orange,
        //                     child: Text("Hello World"),
        //                   ),
        //                   Container(
        //                     height: 120,
        //                     width: MediaQuery.of(context).size.width,
        //                     color: Colors.teal,
        //                     child: Text("Hello World"),
        //                   ),
        //                 ],
        //               ));
        //         }),
        //   ),
        // ],
//       ),
//     );
//   }
// }
