import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wandrer/src/screens/details_page/details.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        TopBar(),
        Positioned(top: 160, left: 15, child: SearchBar()),
        Positioned(
          top: 210,
          left: 10,
          child: SizedBox( height: 100,width: 400,child: Catagaries()),
        ),
        Positioned(
          top: 305,
          left: 10,
          child: Container(
              child: Text('Explore cities', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30))),
        ),
        Positioned(
          top: 350,
          left: 10,
          child: SizedBox(height: 300, width: 400, child: ExploreCities()),
        ),
        // Positioned(
        //   top: 700,
        //   left: 10,
        //   child: Container(
        //       child:
        //           Text('Polular Catagories', style: TextStyle(fontSize: 30))),
        // ),
        // Positioned(
        //   bottom: 110,
        //   left: 10,
        //   child: SizedBox(height: 100, width: 400, child: Popular()),
        // ),
      const BottomAppBar(

      ),
      ],
    )
    );
  }
}

class TopBar extends StatefulWidget {
  const TopBar({Key? key}) : super(key: key);

  @override
  State<TopBar> createState() => _TopBarState();
}

class _TopBarState extends State<TopBar> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 50,
          left: 10,
          child: CircleAvatar(
            backgroundImage:NetworkImage('https://cdn.imgbin.com/2/4/15/imgbin-computer-icons-portable-network-graphics-avatar-icon-design-avatar-DsZ54Du30hTrKfxBG5PbwvzgE.jpg') ,
            radius: 50,
          ),
        ),
        Positioned(
            top: 80,
            left: 140,
            child: Column(
              children: [
                Text(
                  'Harry Potter',
                  style: TextStyle(fontSize: 30),
                ),
                Text('decide what to explore',style: TextStyle(fontSize: 15),)
              ],
            ),
        )
      ],
    );
  }
}

class SearchBar extends StatefulWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: (){},
      child: SizedBox(
        child: Container(
            height: 50,
            width: 370,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(15),
            decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20)),
            child: Icon(Icons.search)),
      ),
    );
  }
}


class Catagaries extends StatefulWidget {
  const Catagaries({Key? key}) : super(key: key);

  @override
  State<Catagaries> createState() => _CatagariesState();
}

class _CatagariesState extends State<Catagaries> {
  List _data = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse("https://gist.githubusercontent.com/hiteshsahu/f58bcca95532fde77fd0d9e94a9c3148/raw/4ef7b30240c781341f1994f12453e9e7a5c2c67d/GirlImages.json"));
    final jsonList = json.decode(response.body)["GirlImages"] as List;
    setState(() {
      _data = jsonList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        scrollDirection: Axis.horizontal, // set scroll direction to horizontal
        itemCount: _data.length,
        itemBuilder: (BuildContext context, int index) {
          final item = _data[index];
          return Container(
            margin: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child:CircleAvatar(
                      radius: 50.0,
                      backgroundImage: NetworkImage(item["image-url"]),
                    )
                ),
                SizedBox(height: 8.0),
                Text(
                  item["description"],
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}





class ExploreCities extends StatefulWidget {
  const ExploreCities({Key? key}) : super(key: key);

  @override
  State<ExploreCities> createState() => _ExploreCitiesState();
}

class _ExploreCitiesState extends State<ExploreCities> {
  List _data = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse("https://gist.githubusercontent.com/hiteshsahu/f58bcca95532fde77fd0d9e94a9c3148/raw/4ef7b30240c781341f1994f12453e9e7a5c2c67d/GirlImages.json"));
    final jsonList = json.decode(response.body)["GirlImages"] as List;
    setState(() {
      _data = jsonList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        scrollDirection: Axis.horizontal, // set scroll direction to horizontal
        itemCount: _data.length,
        itemBuilder: (BuildContext context, int index) {
          final item = _data[index];
          return GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Details(item: item),
                ),
              );
            },
            child: Container(
              margin: EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(color: Colors.grey,borderRadius: BorderRadius.circular(20)),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Hero(
                          tag: 'sr',
                          child: Container(
                              width: 200,
                              height: 200,
                            decoration: BoxDecoration( image: DecorationImage(image: NetworkImage(item["image-url"])),)
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: Text(
                        item["description"],
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

//
// class Popular extends StatefulWidget {
//   const Popular({Key? key}) : super(key: key);
//
//   @override
//   State<Popular> createState() => _PopularState();
// }
//
// class _PopularState extends State<Popular> {
//   @override
//   Widget build(BuildContext context) {
//     return ListView(
//         scrollDirection: Axis.horizontal,
//         padding: EdgeInsets.all(10),
//         children: [
//           SizedBox(
//             height: 80,
//             width: 70,
//             child: Container(
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(400),
//                     color: Colors.red)),
//           ),
//           SizedBox(width: 10),
//           SizedBox(
//             height: 80,
//             width: 70,
//             child: Container(
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(400),
//                     color: Colors.red)),
//           ),
//           SizedBox(width: 10),
//           SizedBox(
//             height: 80,
//             width: 70,
//             child: Container(
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(400),
//                     color: Colors.red)),
//           ),
//           SizedBox(width: 10),
//           SizedBox(
//             height: 80,
//             width: 70,
//             child: Container(
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(400),
//                     color: Colors.red)),
//           ),
//         ]);
//   }
// }


