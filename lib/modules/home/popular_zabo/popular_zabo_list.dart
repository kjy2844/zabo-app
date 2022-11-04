import 'package:flutter/material.dart';

class PopularZabo extends StatelessWidget {
  const PopularZabo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const List<String> names = <String>[
      '스팍스 2019 가을 리크루팅',
      '학부 총학생회 신입위원 모집',
      'DITO 참가팀 모집'
    ];

    const List<List<String>> chipLabels = <List<String>>[
      <String>['# 동아리', '# 모집'],
      <String>['# 공지', '# 모집', '# 오픈톡방'],
      <String>['# 행사', '# 교육', '# 공지', '# 모집'],
    ];

    return Container(
      margin: EdgeInsets.all(16.0),
      color: Colors.grey,
      child: Column(
        children: [
          Text('인기 있는 자보'),
          ListView.builder(
            shrinkWrap: true,
            itemCount: names.length,
            itemBuilder: (BuildContext context, int index) {
              return ZaboListTile(
                name: names[index],
                chipLabels: chipLabels[index],
              );
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
    this.name = "",
    required this.chipLabels,
  }) : super(key: key);

  final String name;
  final List chipLabels;

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
              image: AssetImage('poster_example.png'),
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
                            widget.chipLabels.length,
                            (index) => ZaboTypeChip(
                              label: widget.chipLabels[index],
                            ),
                          )),
                    ),
                    Text(
                      widget.name,
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        Image(
                          image: AssetImage('zabo_team_icon.png'),
                          width: 20.0,
                          height: 20.0,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'Zabo Team',
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
