import 'package:flutter/material.dart';

class SelectPlaces extends StatefulWidget {
  @override
  State createState() => _SelectPlacesState();
}

class _SelectPlacesState extends State<SelectPlaces>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Select a location'),
      ),
      body: new Container(
        color: Colors.white,
        child: ListView(
          children: <Widget>[
            ListTile(
              title: Text(
                'Katlehong',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Text('Operational'),
              enabled: true,
              onTap: () {
                Navigator.pushNamed(context, '/');
              },
            ),
            ListTile(
              title: Text(
                'Tokoza',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Text('Coming Soon'),
              enabled: false,
            ),
            ListTile(
              title: Text(
                'Vosloorus',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              subtitle: Text('Coming Soon'),
              enabled: false,
            ),
          ],
        ),
      ),
    );
  }
}
