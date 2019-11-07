import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

Future<List<Image>> imageLoader(DocumentSnapshot document) async {
  List<Image> images = [
    await Future.value(Image.network(
      document['image1'],
      fit: BoxFit.fitWidth,
    )),
    await Future.value(Image.network(
      document['image2'],
      fit: BoxFit.fitWidth,
    )),
    await Future.value(Image.network(
      document['image3'],
      fit: BoxFit.fitWidth,
    ))
  ];
  return images;
}

imageSlider(List<Image> images) {
  PageController _sliderController =
      new PageController(viewportFraction: 0.8, initialPage: 1);
  //int sIndex = 0;

  return Stack(children: [
    PageView(
      controller: _sliderController,
      children: <Widget>[
        //image1
        images[0],
        //image2
        images[1],
        //image3
        images[2],
      ],
    ),
    // Align(alignment: Alignment.topRight,child: IconButton(icon: Icon(Icons.favorite_border,color: Colors.blueGrey.shade400,), onPressed: (){}),),
/*
    Align(
      child: IconButton(
          icon: Icon(Icons.arrow_back_ios,color: Colors.blueAccent,),
          onPressed: () {
            setState(selected) {
              if (sIndex - 1 > 0) {
                _sliderController.animateToPage(sIndex - 1,
                    duration: Duration(milliseconds: 1), curve: Curves.ease);
                sIndex -= 1;
              }
            }
          }),
      alignment: Alignment.centerLeft,
    ),
    Align(
      child: IconButton(
        icon: Icon(Icons.arrow_forward_ios,color: Colors.blueAccent,),
        onPressed: () {
          setState() {
            if (sIndex + 1 < 3) {
              _sliderController.animateToPage(sIndex - 1,
                  duration: Duration(milliseconds: 1), curve: Curves.ease);
            }
            sIndex += 1;
          }
        },
      ),
      alignment: Alignment.centerRight,
    ),
    */
  ]);
}
