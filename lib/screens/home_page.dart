import 'dart:html';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //     title: Image(
      //   image: AssetImage(
      //     "assets/images/logo.png",
      //   ),
      //   height: 40,
      // )),
      body: Column(
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 22),
              color: Color(0xFF004BDB),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ConstrainedBox(
                        constraints:
                            BoxConstraints.tightFor(width: 212, height: 47),
                        child: Image.asset(
                          "assets/images/logo2.png",
                        ),
                      ),
                      IntrinsicHeight(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Container(
                              child: IntrinsicWidth(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      "Home",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    Container(
                                      height: 1,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 2.0),
                              child: Container(
                                margin: EdgeInsets.symmetric(
                                  horizontal: 4,
                                ),
                                width: 2,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: 6,
                            ),
                            Container(
                              child: IntrinsicWidth(
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: [
                                    Text(
                                      "Profile",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    // Container(
                                    //   height: 1,
                                    //   color: Colors.white,
                                    // ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Spacer(),
                  Container(
                    child: Text(
                      "Welcome, Suriya",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w600)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18.0, top: 8),
                    child: ConstrainedBox(
                        constraints: BoxConstraints.tightFor(width: 700),
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                new BoxShadow(
                                  color: Colors.black.withOpacity(0.6),
                                  blurRadius: 10.0,
                                ),
                              ],
                              borderRadius: BorderRadius.circular(12)),
                          child: IntrinsicHeight(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                    child: Icon(
                                  Icons.search,
                                  size: 26,
                                  color: Color.fromRGBO(102, 102, 102, 1),
                                )),
                                Expanded(
                                    flex: 8,
                                    child: TextField(
                                        decoration: InputDecoration(
                                      hintText: "Type here...",
                                      border: InputBorder.none,
                                    ))),
                                Expanded(
                                    flex: 2,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Color(0xFF357BFF),
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(12),
                                              bottomRight:
                                                  Radius.circular(12))),
                                      child: Center(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 24),
                                          child: Text(
                                            "Search",
                                            style: GoogleFonts.poppins(
                                                textStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                          ),
                                        ),
                                      ),
                                    )),
                              ],
                            ),
                          ),
                        )

                        //  Container(
                        //     child: TextFormField(
                        //   decoration: InputDecoration(
                        //     filled: true,
                        //     fillColor: Colors.white,
                        //     prefixIconConstraints: BoxConstraints(minWidth: 80),
                        //     prefixIcon: Icon(
                        //       Icons.search,
                        //       color: Color.fromRGBO(102, 102, 102, 1),
                        //       size: 25,
                        //     ),
                        //     hintText: "Type here...",
                        //     suffixIcon: FittedBox(
                        //       child: Container(
                        //         color: Colors.amber,
                        //         child: Center(child: Text("Search")),
                        //       ),
                        //     ),
                        //     border: OutlineInputBorder(
                        //       borderSide: BorderSide(color: Colors.white),
                        //       borderRadius: BorderRadius.circular(20),
                        //     ),
                        //   ),
                        // )),

                        ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 38.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 400,
                          height: 180,
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Color.fromRGBO(0, 75, 219, 0.06)),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    168, 32, 168, 22.0),
                                child: Image.asset(
                                  "assets/images/task.png",
                                  height: 63,
                                  width: 63,
                                ),
                              ),
                              Text("Generate Report",
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: Color.fromRGBO(0, 0, 0, 0.8),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500)))
                            ],
                          ),
                        ),
                        Container(
                          width: 400,
                          height: 180,
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              color: Color.fromRGBO(0, 75, 219, 0.06)),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(
                                    168, 32, 168, 22.0),
                                child: Image.asset(
                                  "assets/images/generate.png",
                                  height: 63,
                                  width: 63,
                                ),
                              ),
                              Text("Report History",
                                  style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: Color.fromRGBO(0, 0, 0, 0.8),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500)))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 50,
                    decoration: new BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        new BoxShadow(
                          color: Colors.black,
                          blurRadius: 4.0,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.copyright_rounded),
                          Text(
                            "2022 ApplogiQ. All Rights Reserved",
                            style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                textStyle: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 1))),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
