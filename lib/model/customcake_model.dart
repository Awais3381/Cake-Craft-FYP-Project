import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class CustomCakeModel{
  String? cakeType;
  String? rFlavour;
  String? Pounds;
  String? des;
  String? username;
  String? loction;
  String date;
  String? price;


  CustomCakeModel({
    required this.cakeType,
    required this.rFlavour,
    required this.Pounds,
    required this.des,
    required this.username,
    required this.loction,
    required this.date,
    required this.price
  });

  factory CustomCakeModel.fromJson(Map<String,dynamic>json){
    return CustomCakeModel(
        cakeType: json['caketype'],
        rFlavour: json['regularFlavoure'],
        Pounds: json['pound'],
        des: json['description'],
        username: json['username'],
        loction: json['location'],
        date: json['date'],
        price: json['price']
    );
  }
  Map<String,dynamic>toJson(){
    final Map<String,dynamic> tojson=Map<String,dynamic>();
    tojson['caketype']= this.cakeType;
    tojson['regularFlavoure']= this.rFlavour;
    tojson['pounds']=this.Pounds;
    tojson['description']=this.des;
    tojson['username']=this.username;
    tojson['location']=this.loction;
    tojson['date']=this.date;
    tojson['price']=this.price;
    return tojson;
  }
}