import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
import 'package:wonders/data/wonders.dart';
import 'package:wonders/presentation/widgets/wonder_tile.dart';
import 'package:wonders/presentation/screens/wonder_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // ignore: non_constant_identifier_names
  List<WorldWonder> WonderList = worldWondersList;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('World Wonders'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
        child: ListView.builder(
          itemCount: WonderList.length,
          itemBuilder: (BuildContext context, int index) {
            final wonder = WonderList[index];
            return GestureDetector(
              onTap: () => Navigator.pushNamed(context, WonderScreen.routeName,
                      arguments: wonder)
                  .then((_) {
                setState(() {});
              }),
              child: WonderTile(
                  name: WonderList[index].name,
                  description: WonderList[index].description,
                  latLong: WonderList[index].latLong),
            );
          },
        ),
      ),
    );
  }
}
