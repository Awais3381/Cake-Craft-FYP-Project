class AddProductModel{
  String? cakename;
  String? cakeprice;

  AddProductModel({this.cakename,this.cakeprice,});

  factory AddProductModel.fromMap(map){
    return AddProductModel(
        cakename: map["cakename"],
        cakeprice: map["cakeprice"]
    );
  }
   Map<String, dynamic> toMap() {
     return {
       'cakename': cakename,
       'cakeprice': cakeprice
     };
   }
}