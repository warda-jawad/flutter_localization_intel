import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization/translation.dart';
// import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:localization/translation_strings.dart';
import 'package:provider/provider.dart';

import 'Model.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Providermodal()),
      ],
      child: Consumer<Providermodal>(builder: (context, appmodel, child) {
        return MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          locale: appmodel.appLocal,
          supportedLocales: [
            const Locale('ar', ''), // Arabic
            const Locale('en', ''), // English
          ],
          localizationsDelegates: [
            const TranslationsDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          home: MyHomePage(title: 'Flutter Localization'),
        );
      }),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              Translationss.of(context)!.hello,
              style: Theme.of(context).textTheme.headline4,
            ),
            Text(
              Translationss.of(context)!.email,
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            changelanguage();
          });
        },
        tooltip: 'Increment',
        child: Icon(Icons.language),
      ), 
    );
  }

  changelanguage() {
    var barstatuse = Provider.of<Providermodal>(context, listen: false);
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(6))),
              content: Container(
                  width: 352,
                  height: 150,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Change language",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Cairo-Regular',
                              color: Colors.pink[400]),
                        ),
                        SizedBox(height: 20
                            ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                barstatuse.changeDirectionspisfic(1);
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: 57,
                                width: 135,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(6),
                                    )),
                                child: Center(
                                  child: Text(
                                    "English",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontFamily: 'Cairo-Regular',
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            GestureDetector(
                              onTap: () {
                                barstatuse.changeDirectionspisfic(0);
                                Navigator.pop(context);
                              },
                              child: Container(
                                height: 57,
                                width: 135,
                                decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(6),
                                    )),
                                child: Center(
                                  child: Text(
                                    "Arabic",
                                    style: TextStyle(
                                      fontSize: 22,
                                      fontFamily: 'Cairo-Regular',
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ])));
        });
  }
}
