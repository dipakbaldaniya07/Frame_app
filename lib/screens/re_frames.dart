// ignore_for_file: unnecessary_statements, avoid_print


import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_grid_view.dart';
import 'package:staggered_grid_view_flutter/widgets/staggered_tile.dart';

class ReFrames extends StatefulWidget {
  const ReFrames({Key? key}) : super(key: key);
  @override
  State<ReFrames> createState() => _ReFramesState();
}

class _ReFramesState extends State<ReFrames> {
  FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  @override
  void initState() {
    super.initState();
    [FirebaseAnalyticsObserver(analytics: analytics)];
  }

  
  @override
  Widget build(BuildContext context) {
    final dynamic res = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          "select frame",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pushNamedAndRemoveUntil('select_frame', (route) => false);
          },
          icon: const Icon(
            Icons.arrow_back,
          ),
        ),
      ),
      body: StaggeredGridView.countBuilder(
        crossAxisCount: 3,
        itemCount: res[1].length,
        itemBuilder: (context, i) {
          return Card(
            elevation: 2,
            child: InkWell(
              onTap: () async {
                  Navigator.of(context).pushNamed("framepage", arguments: [
                    res[0],
                    res[1][i],
                    res[1],
                    res[2],
                  ]);
              },
              child: Card(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        res[1][i],
                      ),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
        staggeredTileBuilder: (int index) =>
            StaggeredTile.count(1, index.isEven ? 2 : 1),
      ),
    );
  }
}
