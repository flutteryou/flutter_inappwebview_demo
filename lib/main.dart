import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

InAppLocalhostServer localhostServer = new InAppLocalhostServer();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await localhostServer.start();
  if (Platform.isAndroid) {
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('InAppWebView Example'),
        ),
        body: Container(
            child: Column(children: <Widget>[
              Expanded(
                child: Container(
                  child: InAppWebView(
                    initialUrlRequest: URLRequest(
                        url: Uri.parse("http://localhost:8080/assets/index.html")
                    ),
                    initialOptions: InAppWebViewGroupOptions(
                        crossPlatform: InAppWebViewOptions(

                        )
                    ),
                    onWebViewCreated: (controller) {

                    },
                    onLoadStart: (controller, url) {

                    },
                    onLoadStop: (controller, url) {

                    },
                  ),
                ),
              )]
            )
        ),
      ),
    );
  }
}

