import 'package:flutter/material.dart';
import 'dart:ui';


class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}



class _MyHomePageState extends State<MyHomePage> {

  var width = 0.0;
  var height = 0.0;
  bool isExpanded = false;
  var animateHeight = 0.0;
  var animateWidth = 0.0;
  String text = 'Well-designed animations make a UI feel more intuitive, contribute to the slick look and feel of a polished app, and improve the user experience. Flutter’s animation support makes it easy to implement a variety of animation types. Many widgets, especially Material widgets, come with the standard motion effects defined in their design spec, but it’s also possible to customize these effects.The following resources are a good place to start learning the Flutter animation framework. Each of these documents shows, step by step, how to write animation code.';

  @override
  Widget build(BuildContext context) {

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;


    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            _buildBackGround(),
            _bookNowContainer(),
            _scrollAnimateContainer(),
            _moreDetail(),
          ],
        ),
      ),
    );
  }

  Widget _moreDetail(){
    return Positioned(
      bottom: 15.0,
      left: 0.0,
      right: 0.0,
      child: Align(
        alignment: Alignment.center,
        child: FlatButton.icon(
          onPressed: (){
            setState(() {
              if(isExpanded){
                animateWidth = 0.0;
                animateHeight = 0.0;
                isExpanded = false;
              }else{
                animateWidth = 290.0;
                animateHeight = 250.0;
                isExpanded = true;
              }
            });
          },
          icon: Icon(Icons.keyboard_arrow_down,color: Colors.white,),
          label: Text(
            'More details',
            style: TextStyle(
                color: Colors.white,
                fontSize: 16.0
            ),
          ),
        ),
      ),
    );
  }


  Widget _scrollAnimateContainer(){
    return Positioned(
      bottom: height / 8 ,
      left: 35.0,
      right: 35.0,
      child: AnimatedContainer(
        height: animateHeight,
        width: animateWidth,
        duration: Duration(milliseconds: 600),
        child: Container(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25.0),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5,
                sigmaY: 5,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color : Colors.grey.shade300.withOpacity(0.4),
                ),
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: SingleChildScrollView(
                    physics: BouncingScrollPhysics(),
                    child: Text(
                      text,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13.0,
                          letterSpacing: 1.1
                      ),
                    ),
                  ),
                ),
              ),
              //        ),
            ),
            //),
          ),
        ),
      ),
    );
  }


  Widget _bookNowContainer(){
    return AnimatedPositioned(
      duration: Duration(milliseconds: 600),
      top: isExpanded ? height / 10 : height / 2,
      left: 0.0,
      right: 0.0,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          height: 190.0,
          width: 290.0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25.0),
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 5,
                sigmaY: 5,
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25.0),
                  color : Colors.grey.shade300.withOpacity(0.4),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            'Grand Royal\nPark Hotel',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 28.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '\$220.0',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.0,),
                      Row(
                        children: <Widget>[
                          Text(
                            'France, Paris',
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                fontSize: 13.0
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20.0,),
                      Container(
                        width: double.infinity,
                        height: 45.0,
                        child: RaisedButton(
                          child: Text(
                            'Book now',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16.0
                            ),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ),
                          color: Colors.tealAccent,
                          onPressed: (){
                            print('Click able');
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),

        ),
      ),
    );
  }


  Widget _buildBackGround(){
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/image.jpg',),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black12, BlendMode.darken)
          )
      ),
    );
  }
}
