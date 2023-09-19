import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './main.dart';
import './store.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(context.watch<Store2>().name),
        ),
        body: CustomScrollView(
          slivers: [
            // SliverAppBar(centerTitle: true, title: Text('Profile'),),
            SliverToBoxAdapter(
              child: ProfileHeader(),
            ),
            SliverGrid(
                delegate: SliverChildBuilderDelegate(
                      (c,i) => Container(
                        child:
                        context.watch<Store1>().profileImage.isEmpty
                            ? Center(child: Icon(Icons.image, color: Colors.grey,),)
                            : Image.network(context.watch<Store1>().profileImage[i]),
                      ),
                      childCount: context.watch<Store1>().profileImage.length,
                ),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
            ),
          ],
        )
        // ProfileHeader()
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
            backgroundColor: Colors.grey,
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