import 'package:flutter/material.dart';

class NewRouteRoot extends StatefulWidget {
  @override
  _NewRouteRootState createState() => _NewRouteRootState();
}

class _NewRouteRootState extends State<NewRouteRoot> {
  @override
  Widget build(BuildContext context) {
    BuildContext c;
    return WillPopScope(
      onWillPop: () async {
        final result = await Navigator.maybePop(c);
        if (!result) {
          Navigator.pop(context);
        }
        return false;
      },
      child: Scaffold(
        body: Navigator(
          onGenerateRoute: (s) {
            return MaterialPageRoute(
              builder: (BuildContext context) {
                c = context;
                return NewPage();
              },
            );
          },
        ),
      ),
    );
  }
}

class NewPage extends StatefulWidget {
  @override
  _NewPageState createState() => _NewPageState();
}

class _NewPageState extends State<NewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Text("新路由"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return Page2();
          }));
        },
      ),
    );
  }
}

class Page2 extends StatefulWidget {
  @override
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("2"),
      ),
    );
  }
}
