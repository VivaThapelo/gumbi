import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'RoomCard.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int sIndex;

  @override
  void initState() {
    sIndex=0;
    // TODO: implement initState
    super.initState();
  }
/*
  _iconChange(){
    _favIcon = Icons.favorite;
    _favColor = Colors.red;
  }
*/

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(

      drawer: Drawer(
        child: Column(
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Gumbi",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 28.0),),
              accountEmail: Text("Welcome"),
             /* currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('images/inside2.webp'),
              ),*/
            ),
            /*
            ListTile(
              leading: Icon(
                Icons.favorite,
              ),
              title: Text('Favorites'),
            ),
        */
            ListTile(
              onTap: (){
                Navigator.pushNamed(context, '/aboutus');
              },
              leading: Icon(
                Icons.info,
              ),
              title: Text('About Us'),
            )
          ],
        ),
      ),

      appBar: new AppBar(elevation: 0,
        title: Text(
          'Gumbi',
        ),
        actions: <Widget>[
          FlatButton(onPressed: (){Navigator.pushNamed(context, '/selectplaces');}, child: Text('Katlehong',style: TextStyle(color: Colors.blueAccent,decoration: TextDecoration.underline),)),

        ],
      ),
      body: new Container(

        margin: EdgeInsets.only(top: 0.0, left: 8.0, right: 8.0),
        child:
          // This is for streaming data
          StreamBuilder(stream: Firestore.instance.collection('spaces').snapshots(),
              builder: (BuildContext context, snapshot) {
                if (!snapshot.hasData) return const Text("Loading...");
                return ListView.builder(shrinkWrap: true,
                  itemBuilder: (context,index){
                    if(!snapshot.hasData) return const Text('Loading...');
                    return new RoomCard(snapshot.data.documents[index]);
                  },
                  itemCount: snapshot.data.documents.length,
                );

              }),

      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          var phone = 27612669821;
          var message = "Via Gumbi: Hello, Can you please assist me.";
          var whatsappUrl ="whatsapp://send?phone=$phone&text=$message";
          await canLaunch(whatsappUrl)? launch(whatsappUrl):print("open whatsapp app link or do a snackbar with notification that there is no whatsapp installed");
        },
        tooltip: 'Add new place',
        icon: Icon(Icons.add_comment),
        label: Text('Contact us'),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }



  @override
  void dispose() {
    super.dispose();
  }
}