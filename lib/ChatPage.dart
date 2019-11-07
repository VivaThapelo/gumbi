import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget{
  @override
  State createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
          Text('John Doe',style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold),), //Owner
          Text('Backroom - Tsietsi',style: TextStyle(fontSize: 12.0,fontWeight: FontWeight.normal),) //subtitle - Info about place
        ],),
      ),
      body: ListView(shrinkWrap: true,
        children: <Widget>[

          
         // Container(child: ,),
          /**
          *  This is the bottom Chat bar hence Align bottom
          * **/
          Align(alignment: Alignment.bottomCenter,
            child:
            new Row(children: <Widget>[
              IconButton(icon: Icon(Icons.image), onPressed: null),
              TextField(),
              IconButton(icon: Icon(Icons.send), onPressed: null),
          ],),)

        ],),


    );
  }
}