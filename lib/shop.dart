import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final auth = FirebaseAuth.instance;
final firestore = FirebaseFirestore.instance;


class Shop extends StatefulWidget {
  const Shop({Key? key}) : super(key: key);

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {

  getData() async {
    try {
      await auth.signInWithEmailAndPassword(
          email: 'kim@test.com',
          password: '123456'
      );
    } catch (e) {
      print(e);
    }
    if(auth.currentUser?.uid == null){
      print('로그인 안된 상태군요');
    } else {
      print('로그인 하셨네');
    }
  }



  // getData 안에꺼
  // try {
  //   var result = await firestore.collection('product').get(); // .doc('VG8YcP1QEHdKndTn3MEG')
  //   for( var doc in result.docs ){
  //     print(doc['name']);
  //   }
  // } catch (e) {
  //   print('에러남');
  // }

  // var result = await firestore.collection('product').add({'name': '내복', 'price': '3000'});
  // var result = await firestore.collection('product').where(field).get();
  // var result = await firestore.collection('product').doc().delete();
  // var result = await firestore.collection('product').doc().update({'':''});


  //     try {
  //       var result = await auth.createUserWithEmailAndPassword(
  //         email: "kim@test.com",
  //         password: "123456",
  //       );
  //       result.user?.updateDisplayName('John');
  //       print(result.user);
  //     } catch (e) {
  //       print(e);
  //     }

  // await auth.signOut();
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('샵페이지임'),
    );
  }
}
