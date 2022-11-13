import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ZaboListInfo {
  final String title;
  final String team;
  final List chipLabels;

  const ZaboListInfo(
      {required this.title, required this.team, required this.chipLabels});

  factory ZaboListInfo.fromJson(Map<String, dynamic> json) {
    return ZaboListInfo(
        title: json['title'],
        team: json['name'],
        chipLabels: json['chipLabels']);
  }
}

class PopularZabo extends StatefulWidget {
  const PopularZabo({Key? key}) : super(key: key);

  @override
  State<PopularZabo> createState() => _PopularZaboState();
}

class _PopularZaboState extends State<PopularZabo> {
  Future<List<ZaboListInfo>> getZaboListInfo() async {
    final String response =
        await rootBundle.loadString('assets/zabo_list_data.json');
    final data = json.decode(response).cast<Map<String, dynamic>>();

    return data
        .map<ZaboListInfo>((json) => ZaboListInfo.fromJson(json))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0),
      color: Colors.grey,
      child: Column(
        children: [
          Text('인기 있는 자보'),
          FutureBuilder<List<ZaboListInfo>>(
            future: getZaboListInfo(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<ZaboListInfo> _items = snapshot.data!;
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: _items.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ZaboListTile(zabo: _items[index]);
                  },
                );
              } else if (snapshot.hasError) {
                return Text('에러남');
              } else {
                return Text('로딩중');
              }
            },
          )
        ],
      ),
    );
  }
}

class ZaboListTile extends StatefulWidget {
  const ZaboListTile({
    Key? key,
    required this.zabo,
  }) : super(key: key);

  final ZaboListInfo zabo;

  @override
  State<ZaboListTile> createState() => _ZaboListTileState();
}

class _ZaboListTileState extends State<ZaboListTile> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, '/zabo-detail');
      },
      child: Container(
        height: 145.0,
        color: Colors.white,
        margin: EdgeInsets.all(4.0),
        child: Row(
          children: [
            Image(
              image: AssetImage('assets/poster_example.png'),
            ),
            SizedBox(
              width: 15.0,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 8.0),
                      child: Wrap(
                          spacing: 6.0,
                          runSpacing: 6.0,
                          children: List.generate(
                            widget.zabo.chipLabels.length,
                            (index) => ZaboTypeChip(
                              label: widget.zabo.chipLabels[index],
                            ),
                          )),
                    ),
                    Text(
                      widget.zabo.title,
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Image(
                          image: AssetImage('assets/zabo_team_icon.png'),
                          width: 20.0,
                          height: 20.0,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          widget.zabo.team,
                          style: TextStyle(
                            fontSize: 12.0,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '2020.3.04 조회수 1,324',
                      style: TextStyle(fontSize: 10.0),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ZaboTypeChip extends StatefulWidget {
  const ZaboTypeChip({
    Key? key,
    this.label = "",
  }) : super(key: key);

  final String label;

  @override
  State<ZaboTypeChip> createState() => _ZaboTypeChipState();
}

class _ZaboTypeChipState extends State<ZaboTypeChip> {
  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(widget.label),
      labelStyle: TextStyle(fontSize: 10.0),
      padding: EdgeInsets.zero,
      labelPadding: EdgeInsets.fromLTRB(6, -4, 6, -4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(4.0),
        ),
      ),
    );
  }
}
