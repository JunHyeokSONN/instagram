import 'package:flutter/material.dart';
import './main.dart';
import './store.dart';

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
              Navigator.pop(context);
            }
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
                    onChanged: (text){
                      setUserContent(text);
                    },
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