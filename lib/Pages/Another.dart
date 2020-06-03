import 'package:flutter/material.dart';

class AnotherWidget extends StatefulWidget {
  @override
  _AnotherWidgetState createState() => _AnotherWidgetState();
}

class _AnotherWidgetState extends State<AnotherWidget>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(color: Colors.red, child: Text("Patient Profile"));
  }

  @override
  void initState() {
    super.initState();
    print("Initial state AnotherWidget");
  }

  @override
  bool get wantKeepAlive => true;
}
