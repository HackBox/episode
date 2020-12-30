import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfilePage extends StatefulWidget {
  @override
  MapScreenState createState() => MapScreenState();
}

class MapScreenState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  TextEditingController myEmailCtrl = TextEditingController();
  TextEditingController myNameCtrl = TextEditingController();
  var box = Hive.box("episode");
  bool _status = true;
  final FocusNode myFocusNode = FocusNode();
  setData() async {
    await box.put("name", myNameCtrl.text);
    await box.put("email", myEmailCtrl.text);

    // SharedPreferences prefs = await SharedPreferences.getInstance();
    // await prefs.setString("name", myNameCtrl.text);

    // await prefs.setString("email", myEmailCtrl.text);

    return true;
  }

  getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringValue = prefs.getString('email');
    String name = prefs.getString('name');
    Map data = {
      "name": name,
      "email": stringValue,
    };
    return data;
  }

  // @override
  // void dispose() {
  //   // Clean up the controller when the Widget is disposed
  //   myFocusNode.dispose();
  //   super.dispose();
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: NeumorphicTheme.baseColor(context),
        appBar: NeumorphicAppBar(
          title: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text("Profile"),
          ),
        ),
        body: Container(
          child: ListView(
            children: <Widget>[
              Container(
                height: 250.0,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Stack(fit: StackFit.loose, children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                                width: 140.0,
                                height: 140.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image:
                                        ExactAssetImage('assets/icon/icon.png'),
                                    fit: BoxFit.cover,
                                  ),
                                )),
                          ],
                        ),
                        Padding(
                            padding: EdgeInsets.only(top: 90.0, right: 100.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                CircleAvatar(
                                  backgroundColor: Colors.red,
                                  radius: 25.0,
                                  child: Icon(
                                    Icons.camera_alt,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            )),
                      ]),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 25.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                        padding:
                            EdgeInsets.only(left: 25.0, right: 25.0, top: 5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  'Personal Information',
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                _status ? _getEditIcon() : Container(),
                              ],
                            )
                          ],
                        )),
                    Padding(
                      padding: const EdgeInsets.only(left:25.0,top: 10.0,right: 05.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              'Name',
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold),
                            ),
                          ),
                          !_status
                              ? TextField(
                                  controller: myNameCtrl,
                                  decoration: InputDecoration(
                                    hintText: "Enter Your Name",
                                  ),
                                )
                              : Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(box.get("name") == null
                                    ? "No Name"
                                    : box.get("name")),
                              ),
                          Text(
                            'Email ID',
                            style: TextStyle(
                                fontSize: 16.0, fontWeight: FontWeight.bold),
                          ),
                          !_status
                              ? TextField(
                                  controller: myEmailCtrl,
                                  decoration: InputDecoration(
                                      hintText: "Enter Email ID"),
                                )
                              : Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text(box.get("email") == null
                                    ? "No data found"
                                    : box.get("email")),
                              ),
                          !_status
                              ? Padding(
                                  padding: EdgeInsets.only(
                                      left: 25.0, right: 25.0, top: 45.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.only(right: 10.0),
                                          child: Container(
                                              child: RaisedButton(
                                            child: Text("Save"),
                                            textColor: Colors.white,
                                            color: Colors.green,
                                            onPressed: () async {
                                              //send text controller daata
                                              await setData();
                                              setState(() {
                                                _status = true;

                                                // send
                                              });
                                            },
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20.0)),
                                          )),
                                        ),
                                        flex: 2,
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding: EdgeInsets.only(left: 10.0),
                                          child: Container(
                                              child: RaisedButton(
                                            child: Text("Cancel"),
                                            textColor: Colors.white,
                                            color: Colors.red,
                                            onPressed: () {
                                              setState(() {
                                                _status = true;
                                                FocusScope.of(context)
                                                    .requestFocus(FocusNode());
                                              });
                                            },
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        20.0)),
                                          )),
                                        ),
                                        flex: 2,
                                      ),
                                    ],
                                  ),
                                )
                              : Container(),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  Widget _getEditIcon() {
    return GestureDetector(
      child: CircleAvatar(
        backgroundColor: Colors.red,
        radius: 15.0,
        child: Icon(
          Icons.edit,
          color: Colors.white,
          size: 16.0,
        ),
      ),
      onTap: () {
        setState(() {
          _status = false;
        });
      },
    );
  }
}
