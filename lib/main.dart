import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
          primaryColor: Colors.blueAccent, accentColor: Colors.redAccent),
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    String email;
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              //Route
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MaterialButton(
                    color: Colors.blueAccent,
                    onPressed: () {
                      Get.to(SeconPage());
                    },
                    child: Text("Get Next Page"),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  MaterialButton(
                    color: Colors.blueAccent,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SeconPage(),
                        ),
                      );
                    },
                    child: Text("Flutter Next Page"),
                  )
                ],
              ),
              //ThemeData
              MaterialButton(
                color: Colors.blueAccent,
                onPressed: () {
                  if (Get.isDarkMode) {
                    Get.changeTheme(ThemeData.light());
                  } else {
                    Get.changeTheme(ThemeData.dark());
                  }
                },
                child: Text("Change Theme"),
              ),
              //Dialog
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MaterialButton(
                    color: Colors.blueAccent,
                    onPressed: () {
                      Get.defaultDialog();
                    },
                    child: Text("Get Dialog"),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  MaterialButton(
                    color: Colors.blueAccent,
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Not in stock'),
                            content:
                                const Text('This item is no longer available'),
                            actions: [
                              MaterialButton(
                                child: Text('Ok'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Text("Flutter Dialog"),
                  )
                ],
              ),
              //Bottom Sheet
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  MaterialButton(
                    color: Colors.blueAccent,
                    onPressed: () {
                      Get.bottomSheet(
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              ListTile(
                                leading: new Icon(Icons.photo),
                                title: new Text('Photo'),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                leading: new Icon(Icons.music_note),
                                title: new Text('Music'),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                leading: new Icon(Icons.videocam),
                                title: new Text('Video'),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                              ListTile(
                                leading: new Icon(Icons.share),
                                title: new Text('Share'),
                                onTap: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                          backgroundColor: Colors.white);
                    },
                    child: Text("Get BottomSheet"),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  MaterialButton(
                    color: Colors.blueAccent,
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                ListTile(
                                  leading: new Icon(Icons.photo),
                                  title: new Text('Photo'),
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  leading: new Icon(Icons.music_note),
                                  title: new Text('Music'),
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  leading: new Icon(Icons.videocam),
                                  title: new Text('Video'),
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                ),
                                ListTile(
                                  leading: new Icon(Icons.share),
                                  title: new Text('Share'),
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                ),
                              ],
                            );
                          });
                    },
                    child: Text("Flutter BottomSheet"),
                  )
                ],
              ),
              //MediaQuery
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(Get.height.toString()),
                  SizedBox(
                    width: 40,
                  ),
                  Text(MediaQuery.of(context).size.height.toString()),
                ],
              ),
              //Validation
              Container(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50),
                      child: TextFormField(
                        onChanged: (value) {
                          email = value;
                        },
                      ),
                    ),
                    MaterialButton(
                      child: Text("Validate Email"),
                      onPressed: () {
                        if (GetUtils.isEmail(email)) {
                          Get.snackbar(
                            "Email Correct",
                            "Good Email Format",
                            backgroundColor: Colors.green,
                            snackPosition: SnackPosition.BOTTOM,
                          );
                          GetStorage storage = GetStorage();
                          storage.write("email", email);
                        } else {
                          Get.snackbar(
                            "Email Incorrect",
                            "Bad Email Format",
                            backgroundColor: Colors.red,
                            snackPosition: SnackPosition.BOTTOM,
                          );
                        }
                      },
                    ),
                    Text(
                      GetStorage().read("email") ?? "",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SeconPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("I'm Second Page"),
        ),
      ),
    );
  }
}
