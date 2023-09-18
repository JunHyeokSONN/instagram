// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
// import './style.dart' as style;
//
// void main() {
//   runApp(
//       MaterialApp(
//           theme: style.theme,
//           home: MyApp()
//       )
//   );
// }
//
// class MyApp extends StatefulWidget {
//   MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//
//   var tab = 0;
//   var list = [1,2,3];
//   var map = {'name':'john','age':20};
//   var data = [];
//
//   addData(a){
//     setState(() {
//       data.add(a);
//     });
//   }
//
//
//   getData() async {
//     var result = await http.get(Uri.parse('https://codingapple1.github.io/app/data.json'));
//     var result2 = jsonDecode(result.body);
//     if (result.statusCode == 200){
//       setState(() {
//         data = result2;
//       });
//     } else {
//       throw Exception('실패함ㅅㄱ');
//     }
//
//     // print(result2[0]['likes']);
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     getData();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Instagram'),
//         actions: [
//           IconButton(
//             onPressed: (){},
//             icon: Icon(Icons.add_box_outlined),
//             iconSize: 30,
//           ),
//         ],
//       ),
//       body: PageView(children: [[HomePage(data : data, addData: addData,),Text('샵페이지')][tab],]),
//       bottomNavigationBar: BottomNavigationBar(
//         iconSize: 20,
//         showSelectedLabels: false,
//         showUnselectedLabels: false,
//         onTap: (i){
//           setState(() {
//             tab = i;
//           });
//         },
//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: '홈',),
//           BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined),label: '샵'),
//         ],
//       ),
//
//     );
//   }
// }
//
// class HomePage extends StatefulWidget {
//   HomePage({Key? key, this.data, this.addData}) : super(key:key);
//   final data;
//   final addData;
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//
//   var scroll = ScrollController();
//   var loadingstate = 0;
//   var getcount = 1;
//
//   getCount() {
//     getcount ++;
//   }
//
//
//   getMore() async {
//     if (loadingstate == 0) {
//       loadingstate = 1;
//       var api = 'http://codingapple1.github.io/app/more${getcount.toString()}.json';
//       try {
//         var result = await http.get(Uri.parse(api));
//         var result2 = jsonDecode(result.body);
//         widget.addData(result2);
//         print(getcount);
//         getCount();
//       } catch (e) {
//         print("오류 발생: $e");
//         print(getcount);
//       } finally {
//         loadingstate = 0;
//       }
//     }
//   }
//
//
//   @override
//
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     scroll.addListener(() {
//       if(loadingstate==0&&scroll.position.pixels==scroll.position.maxScrollExtent){
//         setState(() {
//           getMore();
//         });
//       }
//     });
//   }
//
//
//   Widget build(BuildContext context) {
//     if ( widget.data.isNotEmpty ){
//       return ListView.builder(
//           itemCount:widget.data.length,
//           controller: scroll,
//           itemBuilder:(c,i){
//             return Column(
//               children: [
//                 Image.network(widget.data[i]['image']),
//                 Container(
//                   constraints: BoxConstraints(maxWidth: 600),
//                   padding: EdgeInsets.all(20),
//                   width: double.infinity,
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('좋아요 : ${widget.data[i]['likes']}개'),
//                       Text('글쓴이 : ${widget.data[i]['user']}'),
//                       Text('글내용 : ${widget.data[i]['content']}'),
//                     ],
//                   ),
//                 )
//               ],
//             );
//           }
//       );
//     } else {
//       return CircularProgressIndicator();
//     }
//   }
// }

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import './style.dart' as style;

void main() {
  runApp(
      MaterialApp(
          theme: style.theme,
          // initialRoute: '/',
          // routes: {
          //   '/' : (context) => Text('첫페이지'), //앱로드시
          //   '/detail' : (context) => Text('둘째페이지'), //detail 경로 입력시 이동할 곳
          //   //Navigator.pushNamed(context.'/detail')
          // },
          home: MyApp()
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
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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

class HomePage extends StatefulWidget {
  HomePage({Key? key, this.data, this.addData}) : super(key:key);
  final data;
  final addData;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var scroll = ScrollController();
  var loadingstate = 0;
  var getcount = 1;

  getCount() {
    getcount ++;
  }


  getMore() async {
    if (loadingstate == 0) {
      loadingstate = 1;
      var api = 'http://codingapple1.github.io/app/more${getcount.toString()}.json';
      try {
        var result = await http.get(Uri.parse(api));
        var result2 = jsonDecode(result.body);
        widget.addData(result2);
        print(getcount);
        getCount();
      } catch (e) {
        print("오류 발생: $e");
        print(getcount);
      } finally {
        loadingstate = 0;
      }
    }
  }


  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    scroll.addListener(() {
      if(loadingstate==0&&scroll.position.pixels==scroll.position.maxScrollExtent){
        setState(() {
          getMore();
        });
      }
    });
  }


  Widget build(BuildContext context) {
    if ( widget.data.isNotEmpty ){
      return ListView.builder(
          itemCount:widget.data.length,
          controller: scroll,
          itemBuilder:(c,i){
            return Column(
              children: [
                widget.data[i]['image'].runtimeType == String
                    ? Image.network(widget.data[i]['image'])
                    : Image.file(widget.data[i]['image']),
                Container(
                  constraints: BoxConstraints(maxWidth: 600),
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('좋아요 : ${widget.data[i]['likes']}개'),
                      Text('글쓴이 : ${widget.data[i]['user']}'),
                      Text('글내용 : ${widget.data[i]['content']}'),
                    ],
                  ),
                )
              ],
            );
          }
      );
    } else {
      return CircularProgressIndicator();
    }
  }
}

class Upload extends StatelessWidget {
  const Upload({Key? key, this.userImage, this.data, this.addData, this.addMyData, this.setUserContent, this.userContent}) : super(key: key);
  final userImage;
  final data;
  final addData;
  final addMyData;
  final setUserContent;
  final userContent;

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.amber[100],
      appBar: AppBar(
        backgroundColor: Colors.amber[300],
        centerTitle: true,
        leading: IconButton(
            onPressed: (){
              print('menu button print');
            },
            icon: Icon(Icons.menu)),
        title: Text('게시물 업로드',style: TextStyle(fontSize: 22,letterSpacing: 2.0, fontWeight: FontWeight.bold, color: Colors.white),),
        actions: [IconButton(onPressed: (){
          if(addMyData != null){
            addMyData();
          }
          Navigator.pop(context);
          }, icon: Icon(Icons.send))],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          width: 500,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                Image.file(userImage,width: 270,fit: BoxFit.cover,),

                SizedBox(height: 20),

                TextField(
                  decoration: InputDecoration(
                    labelText: '글내용',
                    helperText: '글내용을 입력해주세요',
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (text){ setUserContent(text);},
                ),

                //TextField(),
                //사진 줄이기 resizeToAvoidBottomInset, 이미지 줄이거나, 글쓰는 페이지 하나 더 만들던가
                IconButton(onPressed: (){
                  Navigator.pop(context);
                }, icon: Icon(Icons.close)),
              ],
            ),
          ),
        ),
      )
    );
  }
}
