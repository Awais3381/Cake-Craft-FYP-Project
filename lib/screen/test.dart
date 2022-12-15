import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';



class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  final databaseRef=FirebaseDatabase.instance.reference();
  TextEditingController nameC=TextEditingController();
  TextEditingController priceC=TextEditingController();



  @override
  Widget build(BuildContext context) {

    final nameField =TextFormField(
      controller: nameC,
      autofocus: false,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      onSaved: (value){
        nameC.text=value!;
      },
      decoration: const InputDecoration(
        labelText: 'Email',
        prefixIcon: Icon(Icons.alternate_email),
        hintText: 'cakecraft123@gmail.com',
        border: UnderlineInputBorder(),
      ),
    );
    final priceField =TextFormField(
      controller: priceC,
      autofocus: false,
      keyboardType: TextInputType.emailAddress,
      textInputAction: TextInputAction.next,
      onSaved: (value){
        priceC.text=value!;
      },
      decoration: const InputDecoration(
        labelText: 'Email',
        prefixIcon: Icon(Icons.alternate_email),
        hintText: 'cakecraft123@gmail.com',
        border: UnderlineInputBorder(),
      ),
    );
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 250,left: 20,right: 20),
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                  width: 200,
                  child: FutureBuilder(
                    future: getImage(context, "deal.png"),
                     builder: (context,snapshot){
                      if(snapshot.connectionState ==ConnectionState.done){
                        return SizedBox(
                          width: MediaQuery.of(context).size.width / 1.2,
                          height: MediaQuery.of(context).size.width / 1.2,
                          child: snapshot.data as Widget,
                        );
                      }
                      if(snapshot.connectionState ==ConnectionState.waiting){
                        return SizedBox(
                          height: 100,
                          width: 100,
                          child: const CircularProgressIndicator(),
                        );
                      }
                      return Container();
                     },
                  ),
                ),
            Column(
              children: [
                 nameField,
                priceField,
                ]
            ),
                TextButton(onPressed: (){
                  insert_data(nameC.text, priceC.text);
                }, child: Text('Send'))
              ],
            ),
          )
        ],
      ),
    );
  }
  void insert_data(String name,String price){
    String key=databaseRef.child("Users").push().key;
    databaseRef.child("Users").push().set({
      "id":key,
      "name":name,
      "price":price
    }
    );
  }
}

Future<Widget> getImage(BuildContext context,String imgName) async{
  late Image image;
  await FireStorageService.loadImage(context, imgName).then((value){
    image=Image.network(
        value.toString(),
        fit: BoxFit.scaleDown,
    );
  });
  return image;
}

class FireStorageService extends ChangeNotifier{
  FireStorageService();
  static Future<dynamic> loadImage(BuildContext context,String image) async{
    return await FirebaseStorage.instance.ref().child(image).getDownloadURL();
  }
}