import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './main.dart';

class Store1 extends ChangeNotifier{
  var follower = 0;
  var checkPush = false;
  var profileImage =[];

  getData() async {
    var result = await http.get(Uri.parse('https://codingapple1.github.io/app/profile.json'));
    var result2 = jsonDecode(result.body);
    profileImage = result2;
    notifyListeners();
  }

  changeFollower(){
    if (checkPush == false ){
      follower = follower +1;
      checkPush = true;
    } else {
      follower = follower -1;
      checkPush = false;
    }
    notifyListeners();
  }
}


class Store2 extends ChangeNotifier{
  var name = 'john kim';
}