import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_next/flutter_next.dart';

class CustomizeCake extends StatefulWidget {
  const CustomizeCake({Key? key}) : super(key: key);

  @override
  State<CustomizeCake> createState() => _CustomizeCakeState();
}

class _CustomizeCakeState extends State<CustomizeCake> {
  String cakeValue= 'Select';
  String creamValue= 'Select';
  String poundValue= 'Select';
  List<String> cakesV=['Fresh Cream','Foundant'];
  List<String> creamv=['Chocolate','Mango','Vanilla','Coconut','Strawberry'];
  List<String> poundv=['3 Pounds','4 Pounds','5 Pounds','6 Pounds','7 Pounds'];

  bool isButtonEnabled=false;

  TextEditingController specialController= TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Cake Craft'),
        actions: [
          Padding(
            padding:  EdgeInsets.only(right: 8),
            child: Icon(Icons.shopping_cart_rounded),
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Center(child: Text('Create Your Custom Cake',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 25,color: Colors.blue),)),
            ),
            Padding(
              padding:  EdgeInsets.only(top: 50),
              child: Container(
                height: 300,
                width: MediaQuery.of(context).size.width,
                child: Image.asset('images/cake.png',fit: BoxFit.cover,),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 360),
              child: Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.only(left: 300),
                    child: Center(
                      child: Container(
                        child: Text('Rs -----',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15,right: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text('Cake Type',style: TextStyle(fontSize: 20,color: Colors.blue),),
                            DropdownButton(
                              borderRadius: BorderRadius.circular(10),
                              value: cakeValue,
                              icon: Icon(Icons.keyboard_arrow_down,color: Colors.grey,),
                              items: <String>['Select','Fresh Cream','Foundant'].map<DropdownMenuItem<String>>((String items){
                                return DropdownMenuItem<String>(
                                    value: items,
                                    child: Text(items,style: TextStyle(color: Colors.blue),));
                              }).toList(),
                              onChanged: (String? newValue){
                                setState(() {
                                  cakeValue = newValue!;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding:EdgeInsets.only(left: 20,right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Regular Falavour',style: TextStyle(fontSize: 20,color: Colors.blue),),
                            DropdownButton(
                              borderRadius: BorderRadius.circular(10),
                              value: creamValue,
                              icon: Icon(Icons.keyboard_arrow_down,color: Colors.grey,),
                              items: <String>['Select','Chocolate','Mango','Vanilla','Coconut','Strawberry'].map<DropdownMenuItem<String>>((String items){
                                return DropdownMenuItem<String>(
                                    value: items,
                                    child: Text(items,style: TextStyle(color: Colors.blue),));
                              }).toList(),
                              onChanged: (String? newValue){
                                setState(() {
                                  creamValue = newValue!;
                                });
                              },
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Pounds',style: TextStyle(fontSize: 20,color: Colors.blue),),
                          DropdownButton(
                            borderRadius: BorderRadius.circular(10),
                            value: poundValue,
                            icon: Icon(Icons.keyboard_arrow_down,color: Colors.grey,),
                            items: <String>['Select','3 Pounds','4 Pounds','5 Pounds','6 Pounds','7 Pounds'].map<DropdownMenuItem<String>>((String items){
                              return DropdownMenuItem<String>(
                                  value: items,
                                  child: Text(items,style: TextStyle(color: Colors.blue),));
                            }).toList(),
                            onChanged: (String? newValue){
                              setState(() {
                                poundValue = newValue!;
                              });
                            },
                          ),
                        ],
                      ),
                      // Column(
                      //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      //   children: [
                      //     Text('Reference Design of Cake',style: TextStyle(fontSize: 20,color: Colors.blue),),
                      //     SizedBox(
                      //       height: 10,
                      //     ),
                      //     Text('Image Upload')
                      //   ],
                      // ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('Make it Specail',style: TextStyle(fontSize: 20,color: Colors.blue),),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: 100,
                        width: 350,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.blue)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10,left: 10),
                          child: TextFormField(
                            controller: specialController,
                            decoration: const InputDecoration(hintText: 'Special instruction and detail regarding order'),
                            maxLines: 3,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Required';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('We can deliver your custom cake in 24 hours',style: TextStyle(fontSize: 15,color: Colors.blue),),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 40,
                        width: 150,
                        child: TextButton(
                          style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(Colors.blue),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)
                                  )
                              )
                          ),
                          onPressed: (){
                            },
                          child: Text('Place Your Order',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),),

                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                      ),
                    ],
                  ),
            )
        ]
    ),));
  }
}
