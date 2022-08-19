import 'package:flutter/material.dart';
import 'package:flutter_universe/data.dart';
import 'constants.dart';
import 'samplescenepage.dart';
import 'package:translator/translator.dart';

class DetailPage extends StatefulWidget {
  final PlanetInfo planetInfo;
  DetailPage({Key key, @required this.planetInfo}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  GoogleTranslator translator = GoogleTranslator();

  List<String> items = [
    "Select_a_language",
    "English",
    "Tamil",
    "Hindi",
    "Malayalam",
  ];

  String selectedItem = "Select_a_language";
  String text = "hello";
  bool ans = false;
  String cont = "";
  String ErrorText = "";
  @override
  Widget build(BuildContext context) {
    //ans = false;

    //below string used in translator
    if (selectedItem == "Select_a_language") {
      ErrorText = "select a language";
    } else {}

    //when a dropdown value changes it will load
    void trans(lan) async {
      switch (lan) {
        case "Select_a_language":
          cont = "";
          ErrorText = "select a language";
          break;
        case "English":
          ans = true;
          print(cont);
          await translator
              .translate(widget.planetInfo.description, to: "en")
              .then((value) {
            setState(() {
              cont = value.toString();
            });
          });
          ErrorText = "";
          break;
        case "Tamil":
          ans = true;
          await translator
              .translate(widget.planetInfo.description, to: "ta")
              .then((value) {
            setState(() {
              cont = value.toString();
            });
          });
          ErrorText = "";
          break;
        case "Hindi":
          ans = true;
          await translator
              .translate(widget.planetInfo.description, to: "hi")
              .then((value) {
            setState(() {
              cont = value.toString();
            });
          });
          ErrorText = "";
          break;
        case "Malayalam":
          await translator
              .translate(widget.planetInfo.description, to: "ml")
              .then((value) {
            setState(() {
              cont = value.toString();
            });
          });
          ErrorText = "";
          break;
      }
      //translator.translate(cont, to: "ta").then((value) {
      //  setState(() {
      //   widget.planetInfo.description = value.toString();
      // });
      //});
    }

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
                        widget.planetInfo.position.toString(),
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
                          Image.asset(widget.planetInfo.iconImage,
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
                          widget.planetInfo.name,
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
                        //DropdownMenu started.........
                        DropdownButton(
                            value: selectedItem,
                            items: items.map((String items) {
                              return DropdownMenuItem(
                                value: items,
                                child: Text(
                                  items,
                                  style: TextStyle(
                                    fontFamily: 'Avenir',
                                    fontSize: 17,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String newValue) {
                              setState(() {
                                selectedItem = newValue;
                                trans(selectedItem);
                              });
                            }),
                        //DropdownMenu ended.........
                        Text(
                          ErrorText,
                          style: TextStyle(color: Colors.redAccent),
                        ),
                        Divider(color: Colors.black38),
                        SizedBox(height: 32),
                        Text(
                          cont ?? '',
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
                        itemCount: widget.planetInfo.images.length,
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
                                  widget.planetInfo.images[index],
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

    if (widget.planetInfo.position == 1) {
      print("111111111111111111111111111111111111111");
      //_unityWidgetController.postMessage("GameObject", "LoadScene", "1");
      //pageIndex = "1";
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SimpleScreen(pageIndex: "1")),
      );
    } else if (widget.planetInfo.position == 2) {
      print("22222222222222222222222222222222222222222222");
      //pageIndex = "2";
      //_unityWidgetController.postMessage("GameObject", "LoadScene", "2");

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SimpleScreen(pageIndex: "2")),
      );
    } else if (widget.planetInfo.position == 3) {
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
