import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body:
      Padding(padding: EdgeInsets.all(16.0),child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Text(
            'Gumbi is a property app to simplify township and +backroom renting and to make it easier to find places to stay around townships. Gumbi is born and bred in Katlehong.',
            style: TextStyle(color: Colors.black87),
          ),
          ListTile(
            trailing: Icon(Icons.alternate_email),
            title: Text(
              'Email',
            ),
            subtitle: Text(
              'vivathapelo@gmail.com',
            ),
          ),
        ],
      ),)
    );
  }
}
