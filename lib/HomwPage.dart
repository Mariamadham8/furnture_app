import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Model.dart';
import 'Models/ItemCountModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<ScaffoldState> KEY = GlobalKey();

  List<String> images = [
    "assets/pic1.jpg",
    "assets/pic2.jpg",
    "assets/pic3.jpg",
  ];

  int currentIndex = 0;

  void _nextImage() {
    setState(() {
      if (currentIndex < images.length - 1) {
        currentIndex++;
        if(currentIndex==images.length)
          {
            currentIndex=0;
          }
      }
    });
  }

  void _prevImage() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
        if(currentIndex==images.length)
        {
          currentIndex=0;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {

    return ChangeNotifierProvider(
      create: (context) => CountInfo(),
        child: Builder(
        builder: (context) {
          final counterinfo = Provider.of<CountInfo>(context);
          final userProvider = Provider.of<UserInfo>(context);
          return Scaffold(
            key: KEY,
            appBar: AppBar(
              backgroundColor: const Color(0xFF957067),
              leading: InkWell(
                onTap: () {
                  KEY.currentState!.openDrawer();
                },
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/Yo Hello GIF.gif"),
                ),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Home Page",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Badge(
                    child: Icon(Icons.shopping_cart, color: Colors.white),
                    label: Text("${counterinfo.counte}"),
                  ),
                ),
              ],
            ),
            drawer: Drawer(
              width: 250,
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  UserAccountsDrawerHeader(
                    decoration: const BoxDecoration(
                      color: Colors.brown,
                    ),
                    accountName: Text(userProvider.name),
                    accountEmail: Text(userProvider.email),
                    currentAccountPicture: const CircleAvatar(
                      backgroundImage: AssetImage("assets/Yo Hello GIF.gif"),
                    ),
                  ),
                  ListTile(
                    leading: const Icon(Icons.settings),
                    title: const Text("Settings"),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: const Icon(Icons.logout),
                    title: const Text("Logout"),
                    onTap: () {},
                  ),
                ],
              ),
            ),
            body: Padding(
              padding: EdgeInsets.only(top:150 ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios_new_rounded),
                        onPressed: _prevImage,
                      ),

                      Container(
                        width: 250,
                        height: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.brown[200],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.asset(
                            images[currentIndex],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      IconButton(
                        icon: const Icon(Icons.arrow_forward_ios_rounded),
                        onPressed: _nextImage,
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 80),
                    child: Row(
                      children: [
                        MaterialButton(
                          color: Colors.brown,
                            child:Text("Add",style: TextStyle(color: Colors.white),),
                            onPressed: (){
                              counterinfo.inc();

                        }),
                        Text("  ${  counterinfo.counte  }  ",style: TextStyle(fontWeight: FontWeight.bold),),
                        MaterialButton(
                            color: Colors.brown,
                            child:Text("Del",style: TextStyle(color: Colors.white),),
                            onPressed: (){
                              counterinfo.dec();
                            }),

                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        }
    )
    );
  }
}
