import 'package:flutter/material.dart';
import 'package:toon/models/webtoon_model.dart';
import 'package:toon/services/api_service.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 3,
        backgroundColor: Colors.white,
        foregroundColor: Colors.greenAccent,
        title: const Text("오늘의 웹툰",style: TextStyle(fontSize: 30, height: 1.0),
        ),
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot){
          if(snapshot.hasData){
            return Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Expanded(child: makeList(snapshot))
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<dynamic>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      itemBuilder: (context, index){
        print(index);
        var webtoon = snapshot.data![index];
        return Column(
          children: [
            Image.network(webtoon.thumb),
            Text(webtoon.title)
          ],
        );
      },
      separatorBuilder: (context, index) => const SizedBox(width: 20,),
    );
  }
}



