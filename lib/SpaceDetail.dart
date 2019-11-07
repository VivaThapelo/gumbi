import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'image_slider.dart';
//import 'package:firebase_admob/firebase_admob.dart';

class SpaceDetail extends StatefulWidget {
  DocumentSnapshot document;

  SpaceDetail(DocumentSnapshot document) {
    this.document = document;
  }

  @override
  State<StatefulWidget> createState() => SpaceDetailState(document);
}

class SpaceDetailState extends State<SpaceDetail> {
  DocumentSnapshot document;

  SpaceDetailState(DocumentSnapshot document) {
    this.document = document;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: new AppBar(
        elevation: 0,
        title: new Text("Place Details"),
        actions: <Widget>[
          //IconButton(icon: Icon(Icons.favorite_border), onPressed: () {})
        ],
      ),
      body:
      ListView(shrinkWrap: true, padding: EdgeInsets.only(bottom: 56.0),
        children: <Widget>[
          SizedBox(
            height: 200.0,
            child: Stack(
              children: <Widget>[
                Positioned.fill(
                    child: FutureBuilder(
                        future: imageLoader(document),
                        builder: (context, snapshot) {
                          if (!snapshot.hasData)
                            return const Text('Loading...');
                          return imageSlider(snapshot.data);
                        })),

              ],
            ),
          ),

          new ListTile(
            title: Text(
              document['bed'].toString() +
                  ' Bed • ' +
                  document['bath'].toString() +
                  ' Bath • ' +
                  document['parking'].toString() +
                  " Parking",
              style: TextStyle(fontSize: 18.0),
            ),
            subtitle: Text(
              document['address'].toString() +
                  " • " +
                  document['section'].toString() +
                  " • " +
                  document['town'].toString(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.0),
            ),
            trailing: Text(
              "R" + double.parse(document['price']).toString(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22.0),
            ),
            isThreeLine: true,
          ),

          ListTile(trailing: Text(document['extra'].toString(),style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),),title: Text('Rooms',style: TextStyle(color: Colors.grey.shade700),),leading: Icon(Icons.business,size: 36.0,color: Colors.blue,),),
          ListTile(trailing: Text(document['power'].toString(),style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),),title: Text('Power',style: TextStyle(color: Colors.grey.shade700),),leading: Icon(Icons.power,size: 36.0,color: Colors.blue,),),
          ListTile(trailing: Text(document['utilities'].toString(),style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),),title: Text('Utilities',style: TextStyle(color: Colors.grey.shade700),),leading: Icon(Icons.opacity,size: 36.0,color: Colors.blue,),),
          ListTile(trailing: Text(document['length']+"m * "+document['width']+ "m = " + (double.parse(document['length'])*double.parse(document['width'])).toString()+" m2",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),),title: Text('Dimensions',style: TextStyle(color: Colors.grey.shade700),),leading: Icon(Icons.aspect_ratio,size: 36.0,color: Colors.blue,),),
          ListTile(trailing: Text(document['parking'] + " spot",style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),),title: Text('Parking',style: TextStyle(color: Colors.grey.shade700),),leading: Icon(Icons.directions_car,size: 36.0,color: Colors.blue,),),
          ListTile(trailing: Text(document['date'],style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),),title: Text('Listed',style: TextStyle(color: Colors.grey.shade700),),leading: Icon(Icons.access_time,size: 36.0,color: Colors.blue,),),
          ListTile(trailing: Text(document['owner'],style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold),),title: Text('Owner',style: TextStyle(color: Colors.grey.shade700),),leading: Icon(Icons.person,size: 36.0,color: Colors.blue,),),

        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            var phone = "+27"+ document['owner_phone'].toString().substring(1);
            var message = "Via Gumbi: Hello, I'm looking for a place. Can you help?";
            var whatsappUrl ="whatsapp://send?phone=$phone&text=$message";
            await canLaunch(whatsappUrl)? launch(whatsappUrl):print("open whatsapp app link or do a snackbar with notification that there is no whatsapp installed");
          }, label: Text('Contact owner'),
        icon: Icon(Icons.chat),),
    );
  }
}
