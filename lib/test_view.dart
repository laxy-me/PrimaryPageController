import 'package:flutter/material.dart';
import 'package:primarypageview/primary_page_view.dart';

class PrimaryPageViewPage extends StatefulWidget {
  @override
  _PrimaryPageViewPageState createState() => _PrimaryPageViewPageState();
}

class _PrimaryPageViewPageState extends State<PrimaryPageViewPage> {

  PrimaryPageController primaryPageController = PrimaryPageController();
  PrimaryPageController primaryPageController1 = PrimaryPageController();
  PrimaryPageController primaryPageController2 = PrimaryPageController();
  PrimaryPageController primaryPageController3 = PrimaryPageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PrimaryPageView(
        controller: primaryPageController,
        physics: ClampingScrollPhysics(),
        children: <Widget>[
          ChildPage(
            controller: primaryPageController1,
            key: ValueKey<int>(1),
            children: <Widget>[
              _buildChild('page11', Colors.blueAccent),
              _buildChild('page12', Colors.redAccent),
              _buildChild('page13', Colors.black45),
            ],
          ),

          ChildPage(
            controller: primaryPageController2,
            key: ValueKey<int>(2),
            children: <Widget>[
              _buildChild('page21', Colors.yellowAccent),
              _buildChild('page22', Colors.greenAccent),
              _buildChild('page23', Colors.black45),
            ],
          ),

          ChildPage(
            controller: primaryPageController3,
            key: ValueKey<int>(3),
            children: <Widget>[
              _buildChild('page31', Colors.pinkAccent),
              _buildChild('page32', Colors.cyanAccent),
              _buildChild('page33', Colors.black45),
            ],
          ),

        ],
      ),
    );
  }
}

class ChildPage extends StatefulWidget {

  final List<Widget> children;
  final PrimaryPageController controller;
  ChildPage({required this.children, Key? key,required this.controller}):super(key: key);

  @override
  _ChildPageState createState() => _ChildPageState();
}

class _ChildPageState extends State<ChildPage> {
  @override
  Widget build(BuildContext context) {
    return PrimaryPageView(
      primary: true,
      controller: widget.controller,
      physics: ClampingScrollPhysics(),
      children: widget.children,
    );
  }
}

Widget _buildChild(String text, Color color) {
  return Container(
    color: color,
    alignment: Alignment.center,
    child: Text(text),
  );
}