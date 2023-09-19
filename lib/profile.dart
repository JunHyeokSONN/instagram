import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './main.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(context.watch<Store2>().name),
        ),
        body: ProfileHeader()
    );
  }
}

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: context.watch<Store1>().profileImage.isEmpty ? Colors.grey : null,
            backgroundImage: context.watch<Store1>().profileImage.isEmpty
                ? null
                : NetworkImage(context.watch<Store1>().profileImage[0]),
          ),
          Text('팔로워 ${context.watch<Store1>().follower}명'),
          ElevatedButton(onPressed: (){
            context.read<Store1>().changeFollower();
          }, child: Text('팔로우')),
          ElevatedButton(onPressed: (){
            context.read<Store1>().getData();
          }, child: Text('사진가져오기')),
        ],
      ),
    );
  }
}