// ignore: file_names
// ignore: file_names
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vcd/Providers/HomePageProvider.dart';

class Cards extends StatefulWidget {
  final String? showImage;
  final String? title;
  final String? desc;
  final color;
  final pageNo;

  Cards({
    Key? key,
    this.showImage,
    this.color,
    this.title,
    this.desc,
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
          color: Colors.white,
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
                  padding: EdgeInsets.all(15),
                  width: 50,
                  decoration: BoxDecoration(
                    color: widget.color,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Image.asset(
                    '${widget.showImage}',
                    fit: BoxFit.contain,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.56,
                  padding: EdgeInsets.only(left: 10),
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.title}',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Color(0xff3D5A80),
                        ),
                      ),
                      Text(
                        '${widget.desc}',
                        softWrap: true,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: Color(0xff8b8b8b),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
              Container(
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Color(0xff3D5A80),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
