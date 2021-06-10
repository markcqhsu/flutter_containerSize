import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

      body: Column(
        children: [
          SizedBox(
            height: 400,
            child: Placeholder(
              fallbackHeight: 200,//在遇到Unbound的尺寸的時候, 才會有效果
              fallbackWidth: 20,
            ),
          ),
        ],
      ),

      //如果Container包裹上一層Column的話, 他的高度就會是Child的高度
      // body: Column(
      //   children: [
      //     Container(
      //       margin: EdgeInsets.only(top: 80),
      //       color: Colors.orange,
      //       child: Align(
      //         alignment: Alignment.center,
      //         child: FlutterLogo(
      //           size: 100,
      //         ),
      //       ),
      //     ),
      //   ],
      // ),

      //沒有Child的時候, 就會是全螢幕（以父級組件約束的最大值）.除非約束是無邊界.

      // body: Column(
      //   children: [
      //     Container(
      //       height: 50,//如果這個狀態下沒有設定高度的話, 畫面上會看不到東西, 因為Container選擇的高度是0
      //       color: Colors.orange,
      //     )
      //   ],
      // ),

      //有Child的時候, 會盡量包裹住Child的尺寸, 除非是在有需要對齊（Alignment）的狀態下.
      // body: Container(
      //   color: Colors.orange,
      //   child: Align(
      //     alignment: Alignment.center,
      //     child: FlutterLogo(
      //       size: 100,
      //     ),
      //   ),
      // ),

      // body: Container(
      //   color: Colors.black,//因為Container的尺寸會根據Child, 所以這個Black會沒有效果.
      //   child: Container(
      //     color: Colors.orange,
      //     width: 200,
      //     height: 200,
      //     child: Align(
      //       alignment: Alignment.topLeft,
      //       child: FlutterLogo(
      //         size: 100,
      //       ),
      //     ),
      //   ),
      // ),

      //-----SizedBox包裹Container
      // body: Center(
      //   child: SizedBox(
      //     width: 200,
      //     child: Container(
      //       color: Colors.orange,
      //       child: FlutterLogo(//width: 200, height:100, 因為SizedBox傳遞了一個緊約束
      //         size: 100,
      //       ),
      //     ),
      //   ),
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
