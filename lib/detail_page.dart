import 'package:flutter/material.dart';
import 'package:flutter_universe/data.dart';
import 'constants.dart';
import 'samplescenepage.dart'; //import 'package:flutter_unity_widget/flutter_unity_widget.dart';

class DetailPage extends StatelessWidget {
  final PlanetInfo planetInfo;

  const DetailPage({Key key, this.planetInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        planetInfo.position.toString(),
                        style: TextStyle(
                          fontFamily: 'Avenir',
                          fontSize: 247,
                          color: primaryTextColor.withOpacity(0.08),
                          fontWeight: FontWeight.w900,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(planetInfo.iconImage,
                              width: 230), //expected
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 20),
                        Text(
                          planetInfo.name,
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 56,
                            color: primaryTextColor,
                            fontWeight: FontWeight.w900,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        IconButton(
                          icon: Image.asset('assets/3D.png'),
                          iconSize: 100,
                          onPressed: () {
                            PlainSUrfacePgaeRouter(context);
                          },
                        ),
                        Divider(color: Colors.black38),
                        SizedBox(height: 32),
                        Text(
                          planetInfo.description ?? '',
                          maxLines: 590,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 20,
                            color: contentTextColor,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        SizedBox(height: 32),
                        Divider(color: Colors.black38),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 32.0),
                    child: Text(
                      'Gallery',
                      style: TextStyle(
                        fontFamily: 'Avenir',
                        fontSize: 25,
                        color: Color.fromARGB(255, 0, 59, 254),
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    height: 100,
                    padding: const EdgeInsets.only(left: 32.0),
                    child: ListView.builder(
                        itemCount: planetInfo.images.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: AspectRatio(
                                aspectRatio: 1,
                                child: Image.asset(
                                  planetInfo.images[index],
                                  fit: BoxFit.cover,
                                )),
                          );
                        }),
                  ),
                ],
              ),
            ),
            /*Positioned(
              top: 60,
              left: 32,
              child:
            ),*/

            IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }

  void PlainSUrfacePgaeRouter(BuildContext context) {
    // UnityWidgetController _unityWidgetController;

    if (planetInfo.position == 1) {
      print("111111111111111111111111111111111111111");
      //_unityWidgetController.postMessage("GameObject", "LoadScene", "1");
      //pageIndex = "1";
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SimpleScreen(pageIndex: "1")),
      );
    } else if (planetInfo.position == 2) {
      print("22222222222222222222222222222222222222222222");
      //pageIndex = "2";
      //_unityWidgetController.postMessage("GameObject", "LoadScene", "2");

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SimpleScreen(pageIndex: "2")),
      );
    } else if (planetInfo.position == 3) {
      print("33333333333333333333333333333333333333333333333");
      //pageIndex = "3";
      // _unityWidgetController.postMessage("GameObject", "LoadScene", "3");

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SimpleScreen(pageIndex: "3")),
      );
    }
  }
}
