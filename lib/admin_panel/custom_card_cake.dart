import 'package:flutter/material.dart';

class CustomCardCakes extends StatefulWidget {
  final String? pic;
  final String? name;
  final int? price;

   CustomCardCakes({this.pic='',this.name='',this.price});
  @override
  State<CustomCardCakes> createState() => _CustomCardCakeState();
}

class _CustomCardCakeState extends State<CustomCardCakes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10)
        ),
        child: Column(
          children: [
            SizedBox(
              height: 125,
              child: Center(child: Image.asset(widget.pic!)),
            ),
            const Divider(
              height: 10,
              color: Colors.blue,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5,left: 10),
                  child: Text(widget.name!,),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5,left: 10),
                  child: Text('Rs '+widget.price!.toString(),style: const TextStyle(fontSize: 13,fontWeight: FontWeight.bold),),
                ),
              ],
            ),
          ],
        ),
        elevation: 15,
        shadowColor: Colors.blue,
      ),
    );
  }
}