import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTabBar extends StatefulWidget {
  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> with TickerProviderStateMixin{
  String layervalue= 'Select';
  String temp='Select';
  String dropdownvalue= 'Select';
  String creamValue= 'Select';

  @override
  Widget build(BuildContext context) {
    TabController _tabController= TabController(length: 3, vsync: this);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customization'),
        actions: const [
          Padding(
            padding:  EdgeInsets.only(right: 8),
            child: Icon(Icons.shopping_cart_rounded),
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding:  const EdgeInsets.only(top: 20),
            child: Container(
              height: 300,
              width: MediaQuery.of(context).size.width,
              child: Image.asset('images/cake.png',fit: BoxFit.cover,),
            ),
          ),

          Padding(
            padding:  const EdgeInsets.only(bottom: 50,left: 300),
            child: Center(
              child: Container(
                child: const Text('Rs -----',style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.black),),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 100,bottom: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Center(
                  child: Container(
                    height: 50,
                    width: 220,
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
                      child: const Text('Add to cart',style: const TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 120,top: 470),
            child: TabBarView(
              controller: _tabController,
              children: [
                //1st Tabbar View
                Column(
                  children: [
                    const Text('Please Select Pound',style: const TextStyle(fontSize: 18),),
                    DropdownButton(
                      borderRadius: BorderRadius.circular(10),
                      value: temp,
                      icon: const Icon(Icons.keyboard_arrow_down,color: Colors.black,),
                      items: <String>['Select','1 Pound','2 Pound','3 Pound','4 Pound'].map<DropdownMenuItem<String>>((String items){
                        return DropdownMenuItem<String>(
                            value: items,
                            child: Text(items,style: const TextStyle(color: Colors.blue),));
                      }).toList(),
                      onChanged: (String? newValues){
                        setState(() {
                          temp = newValues!;
                        });
                      },

                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    const Text('Please Select Layers',style: TextStyle(fontSize: 18),),
                    DropdownButton(
                      borderRadius: BorderRadius.circular(10),
                      value: layervalue,
                      icon:  const Icon(Icons.keyboard_arrow_down,color: Colors.black,),
                      items: <String>['Select','1 layer','2 layer','3 layer','4 layer'].map<DropdownMenuItem<String>>((String items){
                        return DropdownMenuItem<String>(
                            value: items,
                            child: Text(items,style: const TextStyle(color: Colors.blue),));
                      }).toList(),
                      onChanged: (String? newValue){
                        setState(() {
                          layervalue = newValue!;
                        });
                      },
                    ),
                  ],
                ),
                //2nd Tab Bar
                Column(
                  children: [
                    const Text('Please Select Topping',style: TextStyle(fontSize: 18),),
                    DropdownButton(
                      borderRadius: BorderRadius.circular(10),
                      value: dropdownvalue,
                      icon:  const Icon(Icons.keyboard_arrow_down,color: Colors.black,),
                      items: <String>['Select','Chocolate','Coconut','Strawberry'].map<DropdownMenuItem<String>>((String items){
                        return DropdownMenuItem<String>(
                            value: items,
                            child: Text(items,style: const TextStyle(color: Colors.blue),));
                      }).toList(),
                      onChanged: (String? newValue){
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                    ),
                  ],
                ),
                //3rd TabBar
                Column(
                  children: [
                    const Text('Please Select Cream',style: TextStyle(fontSize: 18),),
                    DropdownButton(
                      borderRadius: BorderRadius.circular(10),
                      value: creamValue,
                      icon: const Icon(Icons.keyboard_arrow_down,color: Colors.black,),
                      items: <String>['Select','Chocolate','Mango','Vanilla','Coconut','Strawberry'].map<DropdownMenuItem<String>>((String items){
                        return DropdownMenuItem<String>(
                            value: items,
                            child: Text(items,style: const TextStyle(color: Colors.blue),));
                      }).toList(),
                      onChanged: (String? newValue){
                        setState(() {
                          creamValue = newValue!;
                        });
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          RotatedBox(
            quarterTurns: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  decoration: const BoxDecoration(
                      color: Colors.blue,
                    borderRadius:BorderRadius.only(
                      topLeft:  Radius.circular(30)
                    )
                  ),
                  height: 92,
                  width: 320,
                  child: Row(
                    children: [
                      TabBar(
                        controller: _tabController,
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.black38,
                        isScrollable: true,
                        labelPadding: const EdgeInsets.only(left: 20,right: 20,top: 20,bottom: 20),
                        tabs: const [
                          RotationTransition(
                              turns:  AlwaysStoppedAnimation(270/360),
                              child: Tab(text: "Size",icon: Icon(Icons.cake),),
                          ),
                          RotationTransition(
                              turns: AlwaysStoppedAnimation(270/360),
                              child: Tab(text: "Topping",icon: Icon(Icons.workspaces_outline),)
                          ),
                          RotationTransition(
                              turns:  AlwaysStoppedAnimation(270/360),
                              child: Tab(text: "Cream",icon: Icon(Icons.icecream),)
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}