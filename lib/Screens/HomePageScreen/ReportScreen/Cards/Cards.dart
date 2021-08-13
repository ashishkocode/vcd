// ignore: file_names
// ignore: file_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vcd/Providers/HomePageProvider.dart';

class Cards extends StatefulWidget {
  final String? title;
  final pageNo;

  Cards({
    Key? key,
    this.title,
    this.pageNo,
  }) : super(key: key);

  @override
  _CardsState createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  void changeIndex(BuildContext context, indexNo) {
    Provider.of<HomePageProvider>(context, listen: false).changeIndex(indexNo);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        changeIndex(context, widget.pageNo);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 25),
        decoration: BoxDecoration(
          color: Color(0xffD3E7F1),
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.56,
                  padding: EdgeInsets.only(left: 10),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    '${widget.title}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color(0xff3D5A80),
                    ),
                  ),
                ),
              ]),
              Container(
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
