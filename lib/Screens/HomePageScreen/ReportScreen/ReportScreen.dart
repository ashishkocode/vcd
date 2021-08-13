import 'package:flutter/material.dart';
import 'package:vcd/Screens/HomePageScreen/ReportScreen/Cards/Cards.dart';

class ReportScreen extends StatefulWidget {
  final VoidCallback? onPressed;

  ReportScreen({Key? key, this.onPressed}) : super(key: key);

  @override
  _ReportScreenState createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  List _allCards = [
    {
      'title': 'Find a Doctor',
      'pageNo': 3,
    },
    {
      'title': 'Member Card',
      'pageNo': 4,
    },
    {
      'title': 'Benifits',
      'pageNo': 5,
    },
    {
      'title': 'Benifits History',
      'pageNo': 6,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 30, left: 20, right: 20),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 4,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) => Cards(
          key: ValueKey(index),
          title: _allCards[index]['title'],
          pageNo: _allCards[index]['pageNo'],
        ),
      ),
    );
  }
}
