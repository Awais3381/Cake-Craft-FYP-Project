import 'dart:io';

import 'package:cakecraft/admin_panel/admin_homepage.dart';
import 'package:cakecraft/admin_panel/admintmodel/addproductmodel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key? key}) : super(key: key);

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  TextEditingController nameController= TextEditingController();
  TextEditingController priceController= TextEditingController();
  final _formKey=GlobalKey<FormState>();
  PlatformFile? pickedFile;

  Future uploadFile() async{
    final path= 'files/${pickedFile!.name}';
    final file=File(pickedFile!.path!);
    final ref=FirebaseStorage.instance.ref().child(path);
    ref.putFile(file);
  }
  Future selectFile() async{
    final result=await FilePicker.platform.pickFiles();
    if(result== null){
      return;
    }
    setState(() {
      pickedFile = result.files.first;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Product"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Stack(
            children: [
              Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextFormField(
                      controller: nameController,
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      autofocus: true,
                      onSaved: (value){
                        nameController.text=value!;
                      },
                      validator: (value){
                        if(value!.isEmpty){
                          return "Please Enter Cake Name";
                        }
                      },
                      decoration: const InputDecoration(
                        labelText: " Cake Name",
                        suffixIcon: Icon(Icons.cake),
                        border: UnderlineInputBorder()
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: TextFormField(
                      controller: priceController,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      autofocus: true,
                      onSaved: (value){
                        priceController.text=value!;
                      },
                      validator: (value){
                        if(value!.isEmpty){
                          return "Please Enter Cake Price";
                        }
                      },
                      decoration: const InputDecoration(
                          labelText: " Price",
                          prefix: Text("Rs "),
                          suffixIcon: Icon(Icons.price_check),
                          border: UnderlineInputBorder()
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30
                  ),
                  if(pickedFile != null)
                    SizedBox(
                      height: 250,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Container(
                              color: Colors.blue,
                              child: Image.file(
                                File(pickedFile!.path!),
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  SizedBox(
                      height: 30
                  ),
                  SizedBox(
                    height: 50,
                    width: 320,
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
                        if(_formKey.currentState!.validate()){
                          selectFile();
                        }
                      },
                      child: const Text('Select File',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 50,
                    width: 320,
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
                        if(_formKey.currentState!.validate()){
                          saveDetailToFireStore();
                          //uploadFile();
                        }
                      },
                      child: const Text('Upload File',style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),
    );
  }

  saveDetailToFireStore() async{
    FirebaseFirestore firebaseFirestore=FirebaseFirestore.instance;

    AddProductModel addProductModel=AddProductModel();
    addProductModel.cakename=nameController.text;
    addProductModel.cakeprice=priceController.text;
    await firebaseFirestore.
    collection("cakes")
        .doc().set(addProductModel.toMap());
    Navigator.pushReplacement(context,MaterialPageRoute(builder: (context) => const AdminHomePage()),);

    ScaffoldMessenger.of(context).showSnackBar( const SnackBar( content: Text("Uploaded Successfully",style: TextStyle(color: Colors.white),),backgroundColor: Colors.blue, ) );
  }

}
