import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'SpaceDetail.dart';

class RoomCard extends StatefulWidget {
  DocumentSnapshot documentSnapshot;

  RoomCard(DocumentSnapshot document) {
    this.documentSnapshot = document;
  }

  @override
  State<StatefulWidget> createState() => new _RoomCardState(documentSnapshot);
}

class _RoomCardState extends State<RoomCard> {
  DocumentSnapshot document;

  _RoomCardState(DocumentSnapshot document) {
    this.document = document;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
        child: Card(
          clipBehavior: Clip.hardEdge,
          color: Colors.black12,
          borderOnForeground: false,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 180.0,
                child: Stack(
                  children: <Widget>[
                    Positioned.fill(
                        child: Image.network(
                      document['image1'],
                      fit: BoxFit.fitWidth,
                    )),
                    /*
                    Align(alignment: Alignment.topRight,child: IconButton(icon: Icon(Icons.favorite_border,color: Colors.blueAccent,), onPressed: (){}),),
*/
                    Align(
                        alignment: Alignment.bottomLeft,
                        child:
                        new Container(
                          color: Color.fromRGBO(0, 0, 0, .3),
                          child:
                          new ListTile(
                            title: Text(
                              document['bed'].toString() +
                                  ' Bed, ' +
                                  document['bath'].toString() +
                                  ' Bath, ' +
                                  document['parking'].toString() +
                                  " Parking",
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.white),
                            ),
                            subtitle: Text(
                              (document['type']+" • "+document['section'])
                                  .toString(),
                              style: TextStyle(
                                  fontSize: 12.0, color: Colors.white,fontWeight: FontWeight.bold),
                            ),
                            trailing:
                            Column(mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                              Text(
                                "R" + document['price'].toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                    color: Colors.white),
                              ),
                              Text("per " + document['pay_cycle'],style: TextStyle(color: Colors.white,fontSize: 11.0),)
                            ],)
                          ),
                        ))
                  ],
                ),
              ),
            ],
          ),
        ),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => SpaceDetail(document)));
        });
  }
}
