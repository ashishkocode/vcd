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
      'showImage': 'assets/images/map-doctor.png',
      'title': 'Find a Doctor',
      'desc': 'Scedule a consultation with a doctor',
      'pageNo': 3,
    },
    {
      'showImage': 'assets/images/awesome-id-card.png',
      'title': 'Member Card',
      'desc': 'Scedule a consultation with a doctor',
      'pageNo': 4,
    },
    {
      'showImage': 'assets/images/awesome-hands.png',
      'title': 'Benifits',
      'desc': 'Scedule a consultation with a doctor',
      'pageNo': 5,
    },
    {
      'showImage': 'assets/images/awesome-history.png',
      'title': 'Benifits History',
      'desc': 'Scedule a consultation with a doctor',
      'pageNo': 6,
    },
  ];

  List<Color> colors = [
    Color(0xffddfffc),
    Color(0xfffdedee),
    Color(0xfffdf3eb),
    Color(0xffe7eaef)
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
          showImage: _allCards[index]['showImage'],
          color: colors[index],
          title: _allCards[index]['title'],
          desc: _allCards[index]['desc'],
          pageNo: _allCards[index]['pageNo'],
        ),
      ),
    );
  }
}
