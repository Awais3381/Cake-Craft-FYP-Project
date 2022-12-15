import 'package:cakecraft/admin_panel/admin_custom_card.dart';
import 'package:cakecraft/model/order_model.dart';
import 'package:cakecraft/model/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class ShowOrders extends StatefulWidget {
  const ShowOrders({Key? key}) : super(key: key);

  @override
  State<ShowOrders> createState() => _ShowOrdersState();
}

class _ShowOrdersState extends State<ShowOrders> {

  @override
  void initState() {
    fetchAllOrders().then((List list) {
      setState(() {
        contacts = list;
      });
    });
    super.initState();
  }


  User? user = FirebaseAuth.instance.currentUser;
  QuerySnapshot? snap;
  List contacts= [];
  OrderModel orderDetail=OrderModel();
  List<OrderModel> order=[];

  Future<List> fetchAllOrders() async {
    List contactList = [];
    QuerySnapshot snap =
    await FirebaseFirestore.instance.collection('orders').get();
     snap.docs.forEach((document) {
      contactList.add(document['order']);
    });
     print(contactList);
    print('contactList');
    return contactList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Show Orders'),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (BuildContext context,int index){
                print(contacts.length);//return Text('${order.length}');
                return AdCustomCard(
                  cname: contacts[index][0]['cakename'].toString(),
                  cprice: "${contacts[index][0]['cakeprice']}",
                  cimage: "${contacts[index][0]['cakepic']}",
                    totalprice: "${contacts[index][0]['totalprice']}",
                    userlocation: "${contacts[index][0]['userlocation']}",
                  username: "${contacts[index][0]['username']}",
                );
              }
          ),
        ),
      ),
    );
  }
}

class AdCustomCard extends StatelessWidget {
  final String? cname;
  final String? cprice;
  final String? cimage;
  final String? totalprice;
  final String? username;
  final String? userlocation;
  final String? time;

  AdCustomCard(
      {this.cname,
        this.cprice,
        this.cimage,
        this.totalprice,
        this.username,
        this.userlocation,
        this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 270,
        child: Card(
          color: Colors.blue,
          elevation: 10,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Cake Name:',style: TextStyle(color: Colors.black,fontSize: 15),),
                    Text(cname!,style: TextStyle(color: Colors.white,fontSize: 18),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Cake Price:',style: TextStyle(color: Colors.black,fontSize: 15),),
                    Text('Rs '+cprice!,style: TextStyle(color: Colors.white,fontSize: 18),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Cake Image:',style: TextStyle(color: Colors.black,fontSize: 15),),
                    Image.asset(cimage!,height: 50,width: 50,),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Username:',style: TextStyle(color: Colors.black,fontSize: 15),),
                    Text(username!,style: TextStyle(color: Colors.white,fontSize: 18),),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Userlocation:',style: TextStyle(color: Colors.black,fontSize: 15),),
                    Text(userlocation!,style: TextStyle(color: Colors.white,fontSize: 18),),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
