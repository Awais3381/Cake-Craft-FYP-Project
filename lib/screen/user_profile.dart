import 'package:cakecraft/model/user_model.dart';
import 'package:cakecraft/screen/checkloginregister.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
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

  final _formKey=GlobalKey<FormState>();
  bool visibility=false;

  var newpass= "";
  final newPasswordEditingController = TextEditingController();

  @override
  void dispose(){
    newPasswordEditingController.dispose();
    super.dispose();
  }

  final currentUser=FirebaseAuth.instance.currentUser;
  changePassword() async{
    try{
      await currentUser!.updatePassword(newpass);
      FirebaseAuth.instance.signOut();
      Navigator.pushAndRemoveUntil(context, PageRouteBuilder(pageBuilder: (context, a,b) => const Check(),
          transitionDuration:const Duration(seconds: 0)), (route) => false);
      ScaffoldMessenger.of(context).showSnackBar( const SnackBar( content: Text("Your Password has been changed. Login Again !",style: TextStyle(color: Colors.white),),backgroundColor: Colors.blue, ) );
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar( const SnackBar( content: Text("Your Password has not changed",style: TextStyle(color: Colors.white),),backgroundColor: Colors.blue, ) );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cake Craft'),
      ),
      body: Form(
        key: _formKey,
        child: Stack(
          children: [
            SizedBox(
              height: 240,
              width: MediaQuery.of(context).size.width,
              child: Image.asset('images/splash.png',fit: BoxFit.cover,),
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(
                    child: Image.asset('images/cclogo.png'),
                    height: 180,
                  ),
                  const Text('Pakistan No 1 Bakkery',style: TextStyle(color: Colors.white,fontSize: 20),)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 250),
              child: Column(
                children: [
                  Card(
                    elevation: 5,
                    shadowColor: Colors.black87,
                    color: Colors.blue.shade500,
                    margin: EdgeInsets.all(8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                    ),
                    child: SizedBox(
                      height: 100,
                      child: Row(
                        children: [
                          const Text('  Username:  ',style: TextStyle(color: Colors.white,fontSize: 20),),
                          Text("${loggedInUser.username}",
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 20
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Card(
                    elevation: 10,
                    color: Colors.blue.shade300,
                    margin: EdgeInsets.all(8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: SizedBox(
                      height: 100,
                      child: Row(
                        children: [
                          const Text('  Email:  ',style: TextStyle(color: Colors.white,fontSize: 20),),
                          Text("${loggedInUser.email}",
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                //fontWeight: FontWeight.bold
                            ),),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Card(
                    color: Colors.blue.shade100,
                    elevation: 10,
                    margin: EdgeInsets.all(8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),

                    child: SizedBox(
                      height: 100,
                      child: Row(
                        children: [
                          const Text('   Address:  ',style: TextStyle(color: Colors.white,fontSize: 20),),
                          Text("${loggedInUser.address}",
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              //fontWeight: FontWeight.bold
                            ),),
                        ],
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
