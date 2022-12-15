import 'package:cakecraft/model/customcake_model.dart';
import 'package:cakecraft/model/user_model.dart';
import 'package:cakecraft/screen/homepage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CustomCake extends StatefulWidget {
  const CustomCake({Key? key}) : super(key: key);

  @override
  State<CustomCake> createState() => _CustomCakeState();
}

class _CustomCakeState extends State<CustomCake> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance.collection("users").doc(user!.uid).get().then((
        value) {
      loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }
  bool regFlavors = false;
  bool pounds =false;
  bool pressAttention = false;
  bool pressAttention2 = false;
  bool chocolate=false;
  bool mango=false;
  bool vanilla=false;
  bool coconut=false;
  bool strawberry=false;
  bool pineapple=false;
  bool three=false;
  bool four=false;
  bool five=false;
  bool six=false;
  bool seven=false;
  TextEditingController specialController=TextEditingController();
  var cakePrice = "";

  late String cakeType;
  late String Flavour;
  late String poun;
  late String descri;


  Future<bool> showExitPopup(context) async{
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            content: SizedBox(
              height: 90,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Do you want to customize cake?"),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text("Yes", style: TextStyle(color: Colors.black)),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,),
                        ),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                PageRouteBuilder(
                                  pageBuilder: (context, animation1, animation2) => const HomePage(),
                                  transitionDuration: Duration.zero,
                                  reverseTransitionDuration: Duration.zero,
                                ),);
                            },
                            child: const Text("No"),
                            style: ElevatedButton.styleFrom(
                                primary: Colors.blue.shade500
                            ),
                          ))
                    ],
                  )
                ],
              ),
            ),
          );
        });
  }
  @override
  Widget build(BuildContext context) {
   final desField= TextFormField(
      controller: specialController,
      decoration: const InputDecoration(hintText: 'Special instruction and detail regarding order'),
      maxLines: 3,
      onSaved: (value){
        specialController.text=value!;
      },
      validator: (value) {
        if (value!.isEmpty) {
          return 'Required';
        }
      //  return null;
      },
    );
    return WillPopScope(
      onWillPop: ()=>showExitPopup(context),
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Cake Craft'),
          ),
          body: SingleChildScrollView(
            child: Stack(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 10),
                    child: Center(child: Text('Create Your Custom Cake',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 25,color: Colors.blue),)),
                  ),
                  Padding(
                    padding:  const EdgeInsets.only(top: 50),
                    child: SizedBox(
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
                          padding:  const EdgeInsets.only(left: 300),
                          child: Center(
                            child: Text("Rs "+cakePrice,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.black),),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15,right: 15),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: const [
                                  Text('Cake Type',style: TextStyle(fontSize: 20,color: Colors.blue),),
                                ],
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ElevatedButton(
                                child: const Text('Foundant'),
                                // textColor: Colors.white,
                                // shape:  RoundedRectangleBorder(
                                // borderRadius: BorderRadius.circular(5),
                                // ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: pressAttention ? Colors.blue: null,
                                  ),
                                //  color: pressAttention ? Colors.blue: null ,
                                onPressed: () =>
                                    setState(() { pressAttention = true;
                                      pressAttention2 = false;
                                    regFlavors = true;
                                    cakeType='Foundant';
                                    }),
                                ),
                                ElevatedButton(
                                  child: const Text('Fresh Cream'),
                                  // textColor: Colors.white,
                                  // shape:  RoundedRectangleBorder(
                                  //   borderRadius: BorderRadius.circular(5),
                                  // ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: pressAttention2 ? Colors.blue :null,
                                  ),
                                  //color: pressAttention2 ? Colors.blue :null,
                                  onPressed: () => setState(() {
                                    pressAttention2 = true;
                                  pressAttention = false;
                                  regFlavors = true;
                                  cakeType='Fresh Cream';
                                  }),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15,),
                            Padding(
                              padding:const EdgeInsets.only(left: 20,right: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: const [
                                  Text('Regular Flavour',style: TextStyle(fontSize: 20,color: Colors.blue),),
                                ],
                              ),
                            ),
                            regFlavors == true?
                                Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton (
                                      child: const Text('Chocolate'),
                                      // textColor: Colors.white,
                                      // shape:  RoundedRectangleBorder(
                                      //   borderRadius: BorderRadius.circular(5),
                                      // ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: chocolate ? Colors.blue.shade600 :null,
                                      ),
                                     // color: chocolate ? Colors.blue.shade600 :null,
                                      onPressed: () => setState(() {
                                        chocolate = true;
                                      mango=false;
                                      vanilla=false;
                                      coconut=false;
                                      strawberry=false;
                                      pineapple=false;
                                      pounds=true;
                                      Flavour='Chocolate';
                                      }),
                                    ),
                                    ElevatedButton(
                                      child: const Text('Mango'),
                                      // textColor: Colors.white,
                                      // shape:  RoundedRectangleBorder(
                                      //   borderRadius: BorderRadius.circular(5),
                                      // ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: mango ? Colors.blue.shade600 :null,
                                      ),
                                     // color: mango ? Colors.blue.shade600 :null,
                                      onPressed: () => setState(() {chocolate = false;
                                      mango=true;
                                      vanilla=false;
                                      coconut=false;
                                      strawberry=false;
                                      pineapple=false;
                                      pounds=true;
                                      seven=false;
                                      Flavour='Mango';
                                      }),
                                    ),
                                    ElevatedButton(
                                      child: const Text('Vanilla'),
                                      // textColor: Colors.white,
                                      // shape:  RoundedRectangleBorder(
                                      //   borderRadius: BorderRadius.circular(5),
                                      // ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: vanilla ? Colors.blue.shade600 :null,
                                      ),
                                      //color: vanilla ? Colors.blue.shade600 :null,
                                      onPressed: () => setState(() {chocolate = false;
                                      mango=false;
                                      vanilla=true;
                                      coconut=false;
                                      strawberry=false;
                                      pineapple=false;
                                      pounds=true;
                                      Flavour='Vanilla';
                                      }),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                      child: const Text('Strawberry'),
                                      // textColor: Colors.white,
                                      // shape:  RoundedRectangleBorder(
                                      //   borderRadius: BorderRadius.circular(5),
                                      // ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: strawberry ? Colors.blue.shade600 :null,
                                      ),
                                     // color: strawberry ? Colors.blue.shade600 :null,
                                      onPressed: () => setState(() {chocolate = false;
                                      mango=false;
                                      vanilla=false;
                                      coconut=false;
                                      strawberry=true;
                                      pineapple=false;
                                      pounds=true;
                                      Flavour='Strawberry';
                                      }),
                                    ),
                                    ElevatedButton(
                                      child: const Text('Coconut'),
                                      // textColor: Colors.white,
                                      // shape:  RoundedRectangleBorder(
                                      //   borderRadius: BorderRadius.circular(5),
                                      // ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: coconut ? Colors.blue.shade600 :null,
                                      ),
                                     // color: coconut ? Colors.blue.shade600 :null,
                                      onPressed: () => setState(() {chocolate = false;
                                      mango=false;
                                      vanilla=false;
                                      coconut=true;
                                      strawberry=false;
                                      pineapple=false;
                                      pounds=true;
                                      Flavour='Coconut';
                                      }),
                                    ),
                                    ElevatedButton(
                                      child: const Text('Pineapple'),
                                      // textColor: Colors.white,
                                      // shape:  RoundedRectangleBorder(
                                      //   borderRadius: BorderRadius.circular(5),
                                      // ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: pineapple ? Colors.blue.shade600 :null,
                                      ),
                                      //color: pineapple ? Colors.blue.shade600 :null,
                                      onPressed: () => setState(() {chocolate = false;
                                      mango=false;
                                      vanilla=false;
                                      coconut=false;
                                      strawberry=false;
                                      pineapple=true;
                                      pounds=true;
                                      Flavour='Pineapple';
                                      }),
                                    ),
                                  ],
                                ),
                              ],
                            ): const SizedBox(height: 100,),
                            const SizedBox(height: 15,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: const [
                                Text('Pounds',style: TextStyle(fontSize: 20,color: Colors.blue),),
                              ],
                            ),
                            pounds==true?
                            Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                      child: const Text('3 Pound'),
                                      // textColor: Colors.white,
                                      // shape:  RoundedRectangleBorder(
                                      //   borderRadius: BorderRadius.circular(5),
                                      // ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: three ? Colors.blue.shade600 :null,
                                      ),
                                      //color: three ? Colors.blue.shade600 :null,
                                      onPressed: () => setState(() {
                                      three=true;
                                      four=false;
                                      five=false;
                                      six=false;
                                      seven=false;
                                      cakePrice='4000';
                                      poun='3 Pound';
                                      }),
                                    ),
                                    ElevatedButton(
                                      child: const Text('4 Pound'),
                                      // textColor: Colors.white,
                                      // shape:  RoundedRectangleBorder(
                                      //   borderRadius: BorderRadius.circular(5),
                                      // ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: four ? Colors.blue.shade600 :null,
                                      ),
                                      //color: four ? Colors.blue.shade600 :null,
                                      onPressed: () => setState(() {
                                        three=false;
                                        four=true;
                                        five=false;
                                        six=false;
                                        seven=false;
                                        cakePrice='5000';
                                        poun='4 Pound';
                                      }),
                                    ),
                                    ElevatedButton(
                                      child: const Text('5 Pound'),
                                      // textColor: Colors.white,
                                      // shape:  RoundedRectangleBorder(
                                      //   borderRadius: BorderRadius.circular(5),
                                      // ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: five ? Colors.blue.shade600 :null,
                                      ),
                                    //  color: five ? Colors.blue.shade600 :null,
                                      onPressed: () => setState(() {
                                        three=false;
                                        four=false;
                                        five=true;
                                        six=false;
                                        seven=false;
                                        cakePrice='6000';
                                        poun='5 Pound';
                                      }),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    ElevatedButton(
                                      child: const Text('6 Pound'),
                                      // textColor: Colors.white,
                                      // shape:  RoundedRectangleBorder(
                                      //   borderRadius: BorderRadius.circular(5),
                                      // ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: six ? Colors.blue.shade600 :null,
                                      ),
                                      //color: six ? Colors.blue.shade600 :null,
                                      onPressed: () => setState(() {
                                        three=false;
                                        four=false;
                                        five=false;
                                        six=true;
                                        seven=false;
                                        cakePrice='7000';
                                        poun='6 Pound';
                                      }),
                                    ),
                                    ElevatedButton(
                                      child: const Text('7 Pound'),
                                      // textColor: Colors.white,
                                      // shape:  RoundedRectangleBorder(
                                      //   borderRadius: BorderRadius.circular(5),
                                      // ),
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: seven ? Colors.blue.shade600 :null,
                                      ),
                                      //color: seven ? Colors.blue.shade600 :null,
                                      onPressed: () => setState(() {
                                        three=false;
                                        four=false;
                                        five=false;
                                        six=false;
                                        seven=true;
                                        cakePrice='9000';
                                        poun='7 Pound';
                                      }),
                                    ),
                                  ],
                                ),
                              ],
                            ): const SizedBox(height: 100,),
                            const SizedBox(height: 15,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text('Make it Specail',style: TextStyle(fontSize: 20,color: Colors.blue),),
                                Text('(Optional)',style: TextStyle(fontSize: 12,color: Colors.black),),
                              ],
                            ),
                            const SizedBox(
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
                                child: desField
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text('We can deliver your custom cake in 24 hours',style: TextStyle(fontSize: 15,color: Colors.blue),),
                            const SizedBox(
                              height: 10,
                            ),

                            SizedBox(
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
                                onPressed: () {
                                  if(three == true){
                                    saveDetailToFireStore();
                                  }
                                  else if(four == true){
                                    saveDetailToFireStore();
                                  }
                                  else if(five == true){
                                    saveDetailToFireStore();
                                  }
                                  else if(six == true){
                                    saveDetailToFireStore();
                                  }
                                  else if(seven == true){
                                    saveDetailToFireStore();
                                  }
                                  else {
                                    ScaffoldMessenger.of(context).showSnackBar( const SnackBar( content: Text("Please Select all Combinition",style: TextStyle(color: Colors.white),),backgroundColor: Colors.red) );
                                  }
                                },
                                child: const Text('Place Your Order',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),),

                            ),
                            const SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ]
            ),)),
    );
  }

  saveDetailToFireStore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    List<CustomCakeModel> customcakeorders = [];
      customcakeorders.add(
        CustomCakeModel(
            cakeType: cakeType.toString(),
            rFlavour: Flavour.toString(),
            Pounds: poun.toString(),
            des: specialController.text,
            loction: loggedInUser.address.toString(),
            date: DateTime.now().toString(),
            username: loggedInUser.username.toString(),
            price: cakePrice.toString(),
            //des: null
        ),
      );
    print(customcakeorders);
    await firebaseFirestore
        .collection("customcakeorders").add({
      'order': customcakeorders.map((e) => e.toJson()).toList(),
    });
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text(
        "Order Place Successfully",
        style: TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.blue,
    ));
   Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> HomePage()));
  }
}