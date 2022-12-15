import 'package:cakecraft/admin_panel/add_product.dart';
import 'package:cakecraft/admin_panel/orders.dart';
import 'package:cakecraft/admin_panel/view_all.dart';
import 'package:cakecraft/screen/checkloginregister.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({Key? key}) : super(key: key);

  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Panel'),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 30,
              width: 90,
              child: TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                        )
                    )
                ),
                onPressed: (){
                  FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> Check()));
                },
                child: const Text('Logout',style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold),),),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Center(
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(
                          height: 140,
                          width: 140,
                          child: Image.asset('images/cclogo.png')),
                      Text("Welcome To Cake Craft",style: TextStyle(fontSize: 20),),
                    ],
                  ),

                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> AddProduct()));
                    },
                    child: Card(
                      elevation: 10,
                      margin: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Container(
                        height: 150,
                        width: 300,
                        child: Stack(
                          children: [
                            Ink(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: AssetImage(
                                      'images/splash.png'
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Center(child: Text("Add Cake",style: TextStyle(fontSize: 30,color: Colors.white),)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ViewCake()));
                    },
                    child: Card(
                      elevation: 10,
                      margin: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Container(
                        height: 150,
                        width: 300,
                        child: Stack(
                          children: [
                            Ink(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: AssetImage(
                                      'images/splash.png'
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Center(child: Text("Show Cake's",style: TextStyle(fontSize: 30,color: Colors.white),)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> ShowOrders()));
                    },
                    child: Card(
                      elevation: 10,
                      margin: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)
                      ),
                      child: Container(
                        height: 150,
                        width: 300,
                        child: Stack(
                          children: [
                            Ink(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: DecorationImage(
                                  image: AssetImage(
                                      'images/splash.png'
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Center(child: Text("Show Order's",style: TextStyle(fontSize: 30,color: Colors.white),)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
