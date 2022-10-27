import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: ZaboAppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Banner(),
              MenuBar(),
              NotiBar(),
              PopularZabo(),
              PopularGroup(),
              RegisterGroup(),
              AllZabo(),
            ],
          ),
        ),
      ),
    );
  }
}

class ZaboAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ZaboAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Zabo'),
      elevation: 1,
      actions: [
        ElevatedButton(
          onPressed: () {},
          child: const Text(
            '로그인',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}

class Banner extends StatelessWidget {
  const Banner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      margin: EdgeInsets.all(16.0),
      child: Center(
        child: Column(
          children: [
            Text('이제 포스터 확인은 자보에서,'),
            Text('카이스트의 소식을 바로 알아보세요'),
            Row(
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () {},
                  child: Text('신규 그룹 신청'),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.white,
                    textStyle: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () {},
                  child: Text('자보 업로드'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MenuBar extends StatelessWidget {
  const MenuBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      margin: EdgeInsets.all(16.0),
      padding: EdgeInsets.all(10.0),
      child: Center(
        child: Row(
          children: [
            Column(
              children: [
                CircleAvatar(
                  radius: 10.0,
                  backgroundColor: Colors.black,
                ),
                Text('전체보기'),
              ],
            ),
            Column(
              children: [
                CircleAvatar(
                  radius: 10.0,
                  backgroundColor: Colors.black,
                ),
                Text('행사'),
              ],
            ),
            Column(
              children: [
                CircleAvatar(
                  radius: 10.0,
                  backgroundColor: Colors.black,
                ),
                Text('공연'),
              ],
            ),
            Column(
              children: [
                CircleAvatar(
                  radius: 10.0,
                  backgroundColor: Colors.black,
                ),
                Text('축제'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NotiBar extends StatelessWidget {
  const NotiBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      margin: EdgeInsets.all(16.0),
      padding: EdgeInsets.all(16.0),
      child: Center(
        child: Text('현재 마감이 임박한 자보가 없습니다.'),
      ),
    );
  }
}

class PopularZabo extends StatelessWidget {
  const PopularZabo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const List<String> names = <String>[
      '스팍스 2019 가을 리크루팅',
      '학부 총학생회 신입위원 모집',
      'DITO 참가팀 모집'
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
              return ZaboListTile(name: names[index]);
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
  }) : super(key: key);

  final String name;

  @override
  State<ZaboListTile> createState() => _ZaboListTileState();
}

class _ZaboListTileState extends State<ZaboListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(4.0),
      child: Container(
        child: ElevatedButton(
          child: Text(widget.name),
          onPressed: () {
            Navigator.pushNamed(context, '/zabo-detail');
          },
        ),
        height: 30.0,
      ),
    );
  }
}

class PopularGroup extends StatelessWidget {
  const PopularGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const List<String> names = <String>[
      'Zabo Team',
      'Idea Factory',
      '학부 총학생회 Flex',
      'SPARCS',
      '산업디자인학과 학생회'
    ];

    return Container(
      margin: EdgeInsets.all(16.0),
      color: Colors.grey,
      child: Column(
        children: [
          Text('이 그룹은 어때요?'),
          ListView.builder(
            shrinkWrap: true,
            itemCount: names.length,
            itemBuilder: (BuildContext context, int index) {
              return GroupListTile(name: names[index]);
            },
          ),
        ],
      ),
    );
  }
}

class GroupListTile extends StatefulWidget {
  const GroupListTile({Key? key, this.name = ""}) : super(key: key);

  final String name;

  @override
  State<GroupListTile> createState() => _GroupListTileState();
}

class _GroupListTileState extends State<GroupListTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.all(4.0),
      child: ElevatedButton(
        child: Text(widget.name),
        onPressed: () {
          Navigator.pushNamed(context, '/group');
        },
      ),
    );
  }
}

class RegisterGroup extends StatelessWidget {
  const RegisterGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0),
      color: Colors.grey,
      child: Column(
        children: [
          Text('신규 그룹 신청'),
          Container(
            color: Colors.black,
            margin: EdgeInsets.all(4.0),
            child: Container(
              height: 30.0,
            ),
          ),
        ],
      ),
    );
  }
}

class AllZabo extends StatelessWidget {
  const AllZabo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(16.0),
      color: Colors.grey,
      child: Column(
        children: [
          Text('전체 자보 보기'),
          Container(
            color: Colors.black,
            margin: EdgeInsets.all(4.0),
            child: Container(
              height: 30.0,
            ),
          ),
          Container(
            color: Colors.black,
            margin: EdgeInsets.all(4.0),
            child: Container(
              height: 30.0,
            ),
          ),
          Container(
            color: Colors.black,
            margin: EdgeInsets.all(4.0),
            child: Container(
              height: 30.0,
            ),
          ),
        ],
      ),
    );
  }
}
