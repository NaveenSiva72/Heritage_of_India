import 'package:flutter/material.dart';
import 'package:flutter_universe/home_page.dart';
import 'artifacts_data_page.dart';
import 'color.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'artifacts_detail_page.dart';

class artifactHomePage extends StatefulWidget {
  @override
  State<artifactHomePage> createState() => _artifactHomePageState();
}

class _artifactHomePageState extends State<artifactHomePage> {
  List<String> items = ["Monuments", "Artefacts"];
  String selectedItem = "Monuments";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: gradientEndColor,
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [gradientStartColor, gradientEndColor],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.3, 0.7])),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(32.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      'Artefacts',
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 44,
                        color: Colors.white,
                        fontWeight: FontWeight.w900,
                      ),
                      textAlign: TextAlign.left,
                    ),

                    //dropdown started...............
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
                            onSelected(context, selectedItem);
                          });
                        }),
                    //dropdown ended..........
                  ],
                ),
              ),
              Container(
                height: 500,
                padding: const EdgeInsets.only(left: 32),
                child: Swiper(
                  itemCount: planets.length,
                  itemWidth: MediaQuery.of(context).size.width - 2 * 64,
                  layout: SwiperLayout.STACK,
                  pagination: SwiperPagination(
                    builder:
                        DotSwiperPaginationBuilder(activeSize: 20, space: 8),
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, a, b) => artifactDetailPage(
                              artifactsInfo: planets[index],
                            ),
                          ),
                        );
                      },
                      child: Stack(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              SizedBox(height: 100),
                              Card(
                                elevation: 8,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(32),
                                ),
                                color: Colors.white,
                                child: Padding(
                                  padding: const EdgeInsets.all(32.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      SizedBox(height: 130),
                                      Text(
                                        planets[index].Name,
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 35,
                                          color:
                                              Color.fromARGB(255, 157, 46, 160),
                                          fontWeight: FontWeight.w900,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      Text(
                                        'Artefacts',
                                        style: TextStyle(
                                          fontFamily: 'Montserrat',
                                          fontSize: 17,
                                          color: primaryTextColor,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        textAlign: TextAlign.left,
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        children: <Widget>[
                                          Text(
                                            'Description',
                                            style: TextStyle(
                                              fontFamily: 'Montserrat',
                                              fontSize: 18,
                                              color: secondaryTextColor,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            textAlign: TextAlign.left,
                                          ),
                                          Icon(
                                            Icons.arrow_forward,
                                            color: secondaryTextColor,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Hero(
                            tag: planets[index].position,
                            child: Image.asset(
                              planets[index].iconImage,
                              width: 180,
                              height: 250,
                            ),
                          ),
                          Positioned(
                            right: 20,
                            bottom: 30,
                            child: Text(
                              planets[index].position.toString(),
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 200,
                                color: primaryTextColor.withOpacity(0.11),
                                fontWeight: FontWeight.w900,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(36.0),
          ),
          color: navigationColor,
        ),
        padding: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              icon: Image.asset('assets/menu_icon.png'),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset('assets/search_icon.png'),
              onPressed: () {},
            ),
            IconButton(
              icon: Image.asset('assets/profile_icon.png'),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }

  onSelected(BuildContext context, selectedItem) {
    switch (selectedItem) {
      case "Monuments":
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => HomePage()));

        break;
    }
  }
}
