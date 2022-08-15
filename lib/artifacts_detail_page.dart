import 'package:flutter/material.dart';
import 'artifacts_data_page.dart';
import 'constants.dart';
import 'package:flutter_universe/samplescenepage.dart';

class artifactDetailPage extends StatelessWidget {
  final ArtifactsInfo artifactsInfo;
  const artifactDetailPage({Key key, this.artifactsInfo}) : super(key: key);

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
                        artifactsInfo.position.toString(),
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 247,
                          color: primaryTextColor.withOpacity(0.08),
                          fontWeight: FontWeight.w900,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      //Padding(
                      // padding: EdgeInsets.symmetric(horizontal: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            artifactsInfo.iconImage1,
                            width: 230,
                          ),
                        ],
                      ),
                      //),
                    ],
                  ),
                  //  ),

                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 1),
                        Text(
                          artifactsInfo.name1,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SimpleScreen(
                                        pageIndex: "0",
                                      )),
                            );
                          },
                        ),
                        Divider(color: Colors.black38),
                        SizedBox(height: 32),
                        Text(
                          artifactsInfo.description1 ?? '',
                          maxLines: 590,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
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
                        fontFamily: 'Montserrat',
                        fontSize: 25,
                        color: const Color(0xff47455f),
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    height: 100,
                    padding: const EdgeInsets.only(left: 32.0),
                    child: ListView.builder(
                        itemCount: artifactsInfo.images1.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: AspectRatio(
                                aspectRatio: 1,
                                child: Image.network(
                                  artifactsInfo.images1[index],
                                  fit: BoxFit.cover,
                                )),
                          );
                        }),
                  ),
                  Divider(color: Colors.black38),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        artifactsInfo.position2.toString(),
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 247,
                          color: primaryTextColor.withOpacity(0.08),
                          fontWeight: FontWeight.w900,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      //Padding(
                      // padding: EdgeInsets.symmetric(horizontal: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            artifactsInfo.iconImage2,
                            width: 230,
                          ),
                        ],
                      ),
                      //),
                    ],
                  ),
                  //  ),

                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 1),
                        Text(
                          artifactsInfo.name2,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SimpleScreen()),
                            );
                          },
                        ),
                        Divider(color: Colors.black38),
                        SizedBox(height: 32),
                        Text(
                          artifactsInfo.description2 ?? '',
                          maxLines: 590,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
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
                        fontFamily: 'Montserrat',
                        fontSize: 25,
                        color: const Color(0xff47455f),
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    height: 100,
                    padding: const EdgeInsets.only(left: 32.0),
                    child: ListView.builder(
                        itemCount: artifactsInfo.images1.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: AspectRatio(
                                aspectRatio: 1,
                                child: Image.network(
                                  artifactsInfo.images1[index],
                                  fit: BoxFit.cover,
                                )),
                          );
                        }),
                  ),

                  Divider(color: Colors.black38),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        artifactsInfo.position3.toString(),
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 247,
                          color: primaryTextColor.withOpacity(0.08),
                          fontWeight: FontWeight.w900,
                        ),
                        textAlign: TextAlign.left,
                      ),
                      //Padding(
                      // padding: EdgeInsets.symmetric(horizontal: 16),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            artifactsInfo.iconImage3,
                            width: 230,
                          ),
                        ],
                      ),
                      //),
                    ],
                  ),
                  //  ),

                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 1),
                        Text(
                          artifactsInfo.name3,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
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
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SimpleScreen()),
                            );
                          },
                        ),
                        Divider(color: Colors.black38),
                        SizedBox(height: 32),
                        Text(
                          artifactsInfo.description3 ?? '',
                          maxLines: 590,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontFamily: 'Montserrat',
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
                        fontFamily: 'Montserrat',
                        fontSize: 25,
                        color: const Color(0xff47455f),
                        fontWeight: FontWeight.w300,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  Container(
                    height: 100,
                    padding: const EdgeInsets.only(left: 32.0),
                    child: ListView.builder(
                        itemCount: artifactsInfo.images1.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Card(
                            clipBehavior: Clip.antiAlias,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(24),
                            ),
                            child: AspectRatio(
                                aspectRatio: 1,
                                child: Image.network(
                                  artifactsInfo.images1[index],
                                  fit: BoxFit.cover,
                                )),
                          );
                        }),
                  ),
                ],
              ),
            ),
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
}
