import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './style.dart' as style;
import './profile.dart';
import './main.dart';
import './store.dart';


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
                      GestureDetector(
                        child: Text('이름 : ${widget.data[i]['user']}'),
                        onTap: (){
                          Navigator.push(context,
                            PageRouteBuilder(
                              pageBuilder: (c,a1,a2) => Profile(),
                              transitionsBuilder: (c,a1,a2,child) =>
                                  FadeTransition(opacity: a1, child: child,),
                              // SlideTransition(
                              //   position: Tween(
                              //     begin: Offset(1.0,0.0),
                              //     end: Offset(0.0,0.0),
                              //   ).animate(a1),
                              //   child: child,
                              // )
                              // transitionDuration: Duration(milliseconds: 500),
                            ),
                            //CupertinoPageRoute(builder: (c) => Profile())
                          );
                        },
                      ),
                      Text('좋아요 : ${widget.data[i]['likes']}개'),
                      Text('날짜 : ${widget.data[i]['date']}'),
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