import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final Completer<GoogleMapController> _controller = Completer();
  List<Marker> markers = [];
  LatLng point = const LatLng(0, 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Stack(children: [
      SizedBox(
          width: double.infinity,
          height: 253,
          child: GoogleMap(
              markers: Set.from(markers),
              initialCameraPosition: CameraPosition(target: point, zoom: 10),
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              })),
      Positioned(
          top: 230,
          bottom: 0,
          right: 0,
          left: 0,
          child: LayoutBuilder(
              builder: (context, constraint) => Container(
                  width: constraint.maxWidth,
                  height: constraint.maxHeight,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(27),
                          topLeft: Radius.circular(27)))))),
      LayoutBuilder(
          builder: (context, constraints) => SizedBox(
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              child: Column(children: [
                const SizedBox(height: 250),
                Expanded(
                    child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        scrollDirection: Axis.vertical,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [
                                Expanded(
                                    child: Row(children: [
                                  SizedBox(
                                      height: 70,
                                      width: 70,
                                      child: Stack(children: [
                                        ClipOval(
                                            child: CachedNetworkImage(
                                                fit: BoxFit.cover,
                                                imageUrl:
                                                    "https://sparkcdnwus2.azureedge.net/sparkimageassets/XP99VR1BPSBQJ2-e043f8b6-665b-4eda-96b9-d3c12e34074b",
                                                progressIndicatorBuilder:
                                                    (context, url,
                                                            downloadProgress) =>
                                                        CircularProgressIndicator(
                                                            value:
                                                                downloadProgress
                                                                    .progress),
                                                errorWidget: (context, url,
                                                        error) =>
                                                    const Icon(Icons.error))),
                                        Align(
                                            alignment:
                                                AlignmentDirectional.bottomEnd,
                                            child: Container(
                                                width: 18,
                                                height: 18,
                                                decoration: const BoxDecoration(
                                                    color: Colors.red,
                                                    shape: BoxShape.circle)))
                                      ])),
                                  const SizedBox(width: 10),
                                  Flexible(
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: const [
                                        Text('Moojood',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold,
                                                overflow:
                                                    TextOverflow.ellipsis)),
                                        Text('2.2Km . Moroccan restaurant',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontWeight: FontWeight.w600,
                                                overflow:
                                                    TextOverflow.ellipsis))
                                      ]))
                                ])),
                                Container(
                                    height: 40,
                                    width: 120,
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius:
                                            BorderRadius.circular(12)),
                                    child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: const [
                                              Icon(Icons.add,
                                                  color: Colors.white),
                                              SizedBox(width: 10),
                                              Text('Closed',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      height: 1,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w500))
                                            ])))
                              ]),
                              const SizedBox(height: 10),
                              const Text(
                                'Similar stores are now open',
                                style: TextStyle(
                                    fontWeight: FontWeight.w600, fontSize: 16),
                              ),
                              const SizedBox(height: 7),
                              ListView.builder(
                                  primary: false,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) =>
                                      similarStoreWidget(
                                        title: 'Moojood',
                                        desc: '2.2Km . Moroccan restaurant',
                                        logoImg:
                                            "https://sparkcdnwus2.azureedge.net/sparkimageassets/XP99VR1BPSBQJ2-e043f8b6-665b-4eda-96b9-d3c12e34074b",
                                        img:
                                            "https://sparkcdnwus2.azureedge.net/sparkimageassets/XP99VR1BPSBQJ2-e043f8b6-665b-4eda-96b9-d3c12e34074b",
                                      ),
                                  itemCount: 2),
                              const SizedBox(height: 10),
                              const Text('Near you;)',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16)),
                              const SizedBox(height: 10),
                              ListView.builder(
                                  primary: false,
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) => storeWidget(
                                      title: 'Moojood',
                                      desc: '2.2Km . Moroccan restaurant',
                                      logoImg:
                                          "https://sparkcdnwus2.azureedge.net/sparkimageassets/XP99VR1BPSBQJ2-e043f8b6-665b-4eda-96b9-d3c12e34074b",
                                      img:
                                          "https://sparkcdnwus2.azureedge.net/sparkimageassets/XP99VR1BPSBQJ2-e043f8b6-665b-4eda-96b9-d3c12e34074b",
                                      dis: '85.5 Km'),
                                  itemCount: 5),
                              const SizedBox(height: 10)
                            ])))
              ])))
    ])));
  }

  Widget storeWidget(
      {required String title,
      required String desc,
      required String logoImg,
      required String img,
      required String dis}) {
    return Container(
        height: 90,
        margin: const EdgeInsets.symmetric(vertical: 5),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: const Color(0xFFF0F5FB),
            borderRadius: BorderRadius.circular(20)),
        child: Row(children: [
          Expanded(
              child: Row(children: [
            SizedBox(
                width: 57,
                height: 60,
                child: Stack(children: [
                  Align(
                    alignment: AlignmentDirectional.bottomStart,
                    child: Container(
                        width: 55,
                        height: 55,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: CachedNetworkImageProvider(img)))),
                  ),
                  Container(
                      alignment: AlignmentDirectional.topEnd,
                      child: Container(
                          width: 12,
                          height: 12,
                          decoration: const BoxDecoration(
                              color: Colors.green, shape: BoxShape.circle)))
                ])),
            const SizedBox(width: 10),
            Flexible(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Text(title,
                      style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          overflow: TextOverflow.ellipsis)),
                  Text(desc,
                      style: const TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.w600,
                          overflow: TextOverflow.ellipsis))
                ]))
          ])),
          Text(dis,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold))
        ]));
  }

  Widget similarStoreWidget(
      {required String title,
      required String desc,
      String img = '',
      String logoImg = ''}) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        child: Column(children: [
          Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(img)))),
          const SizedBox(height: 7),
          Row(mainAxisAlignment: MainAxisAlignment.start, children: [
            Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: Colors.cyan),
                child: Stack(children: [
                  ClipOval(
                      child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          imageUrl: logoImg,
                          progressIndicatorBuilder:
                              (context, url, downloadProgress) =>
                                  CircularProgressIndicator(
                                      value: downloadProgress.progress),
                          errorWidget: (context, url, error) =>
                              const Icon(Icons.error))),
                  Container(
                      alignment: AlignmentDirectional.bottomEnd,
                      child: Container(
                          width: 12,
                          height: 12,
                          decoration: const BoxDecoration(
                              color: Colors.green, shape: BoxShape.circle)))
                ])),
            const SizedBox(width: 10),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(title,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w700)),
              Text(desc,
                  style: const TextStyle(
                      color: Colors.grey, fontWeight: FontWeight.w500))
            ])
          ])
        ]));
  }
}
