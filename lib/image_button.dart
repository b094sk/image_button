import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';




class MyChromeSafariBrowser extends ChromeSafariBrowser {
  @override
  void onOpened() {
    print("ChromeSafari browser opened");
  }

  @override
  void onCompletedInitialLoad() {
    print("ChromeSafari browser initial load completed");
  }

  @override
  void onClosed() {
    print("ChromeSafari browser closed");
  }
}

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isAndroid) {
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
  }

  runApp(MaterialApp(home: MyApp(), theme: new ThemeData(scaffoldBackgroundColor: const Color(0xFFA7A5A5)),
      debugShowCheckedModeBanner: false));
}

class MyApp extends StatefulWidget {
  final ChromeSafariBrowser browser = new MyChromeSafariBrowser();

  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Image Button"),
    ),

      body:


      SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child:
        Column(children: <Widget>[



          Container(
            // padding: EdgeInsets.all(50),
            alignment: Alignment.center,
            child: IconButton(
              icon: Image.asset('assets/icon/google.png'),
              iconSize: 50,
              color: Colors.green,
              splashColor: Colors.purple,
              onPressed: () async {
                await widget.browser.open(
                    url: Uri.parse("https://google.com"),
                    options: ChromeSafariBrowserClassOptions(
                        android: AndroidChromeCustomTabsOptions(
                          addDefaultShareMenuItem: false,),
                        ios: IOSSafariOptions(barCollapsingEnabled: true)));
              },
            ),
          ),











        ]),


      ),


    );
  }
}
