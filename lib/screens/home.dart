/*
 * Home screen dart file for the Philam Hackathon App
 * @author: John Chew [Untitled]
 * @date: November 10, 2019
 * @license: MIT
 */

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:dartapp/screens/details.dart';
import 'package:dartapp/util/data.dart';
import 'package:dartapp/widgets/badge.dart';

// Creates New Screen Called 'Home'
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

// Main Home Screen Functions
class _HomeState extends State<Home> {
  final TextEditingController _searchControl = new TextEditingController();


  @override
  Widget build(BuildContext context) => Scaffold(
      // Menu Button
      appBar: AppBar(
        actions: <Widget>[
          Center(
            child: IconBadge(
              icon: Feather.getIconData("menu"),
            ),
          ),
          SizedBox(width: 20),
        ],
      ),

      body: ListView(
        padding: EdgeInsets.only(left: 20),
        children: <Widget>[

          Padding(
            padding: EdgeInsets.only(right: 20),
            child: Text(
              "Welcome, \nJohn.",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

          // User Data Search
          SizedBox(height: 10),
          SizedBox(height: 30),

          Container(
            height: 275,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: homemenu.length,
              itemBuilder: (BuildContext context, int index) {
                Map mainmenu = homemenu[index];

                return Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context){
                            return Details();
                          },
                        ),
                      );
                    },
                    child: Container(
                      height: 275,
                      width: 220,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "${mainmenu["name"]}",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 23,
                            ),
                          ),
                          SizedBox(height: 10),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.asset(
                              "${mainmenu["img"]}",
                              height: 240,
                              width: 220,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Current Clients",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ],
          ),

          Container(
            height: 140,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: clients.length,
              itemBuilder: (BuildContext context, int index) {
                Map client = clients[index];

                return Padding(
                  padding: EdgeInsets.only(right: 20),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context){
                            return Details();
                          },
                        ),
                      );
                    },
                    child: Container(
                      height: 140,
                      width: 140,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          "${client["img"]}",
                          height: 140,
                          width: 140,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          SizedBox(height: 10),
        ],
      ),
    );
}
