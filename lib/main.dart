import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'package:instagram/notification.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';
import './style.dart' as style;
import './profile.dart';
import './homepage.dart';
import './upload.dart';
import './store.dart';
import './notification.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/services.dart';

Future<bool> requestExactAlarmPermission() async {
  final platform = MethodChannel('dexterx.dev/flutter_local_notifications_example');
  final hasPermission = await platform.invokeMethod('requestExactAlarmPermission');
  return hasPermission;
}

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (c) => Store1()),
          ChangeNotifierProvider(create: (c) => Store2()),
        ],
        child: MaterialApp(
            theme: style.theme,
            // initialRoute: '/',
            // routes: {
            //   '/' : (context) => Text('첫페이지'), //앱로드시
            //   '/detail' : (context) => Text('둘째페이지'), //detail 경로 입력시 이동할 곳
            //   //Navigator.pushNamed(context.'/detail')
            // },
            home: MyApp()
        ),
      )
  );
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  var tab = 0;
  var list = [1,2,3];
  var map = {'name':'john','age':20};
  var data = [];
  var userImage;
  var userContent;

  saveData() async {
    var storage = await SharedPreferences.getInstance();
    var map = {'age' : 20};
    storage.setString('map', jsonEncode(map));
    var result = storage.getString('map') ?? '없는데요';
    print(jsonDecode(result)['age']);
  }

  setUserContent(a){
    setState(() {
      userContent = a;
    });
  }

  addMyData(){
    var myData = {
      'id' : data.length,
      'image' : userImage,
      'likes' : 15,
      'data' : 'July 25',
      'content' : userContent,
      'user' : 'John kim'
    };
    setState(() {
      data.insert(0,myData);
    });
  }

  addData(a){
    setState(() {
      data.add(a);
    });
  }

  getData() async {
    var result = await http.get(Uri.parse('https://codingapple1.github.io/app/data.json'));
    var result2 = jsonDecode(result.body);
    if (result.statusCode == 200){
      setState(() {
        data = result2;
      });
    } else {
      throw Exception('실패함ㅅㄱ');
    }
    // print(result2[0]['likes']);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    saveData();
    getData();
    initNotification(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(child: Text('+'), onPressed: (){
        showNotification();
      },),
      appBar: AppBar(
        title: Text('Instagram'),
        actions: [
          IconButton(
            onPressed: () async {
              var picker = ImagePicker();
              var image = await picker.pickImage(source: ImageSource.gallery);
              if(image != null){
                setState(() {
                  userImage = File(image.path);
                });
              }
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Upload(
                    userImage : userImage,
                    addMyData: addMyData,
                    userContent: userContent,
                    setUserContent: setUserContent,
                  )) // arrow Function
              );
            },
            icon: Icon(Icons.add_box_outlined),
            iconSize: 30,
          ),
        ],
      ),
      body: PageView(children: [[HomePage(data : data, addData: addData,),Text('샵페이지')][tab],]),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 20,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (i){
          setState(() {
            tab = i;
          });
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: '홈',),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined),label: '샵'),
        ],
      ),

    );
  }
}


