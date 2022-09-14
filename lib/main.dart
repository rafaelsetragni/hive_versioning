import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'models/adapters/user_model_adapter.dart';
import 'models/user_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Hive.init(
      (await getApplicationDocumentsDirectory()).path,
      backendPreference: HiveStorageBackendPreference.native
  );
  Hive.registerAdapter(UserModelAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hive Versioning Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Hive Versioning Demo Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  Box<UserModel>? userBox;

  String content = '';

  @override
  void initState() {
    Hive.openBox<UserModel>('users').then(
      (openedBox) {
        userBox = openedBox;
        setState(() {
          _counter = openedBox.length;
          _printBoxContent();
        });
      });

    super.initState();
  }

  @override
  void dispose(){
    userBox?.close();
    userBox = null;
    super.dispose();
  }

  Future<void> _incrementCounterV1() async {
    userBox ??= await Hive.openBox<UserModel>('users');
    UserModel newUserModel = UserModel(
        uuid: (++_counter).toString(),
        name: 'teste $_counter',
        lastName: 'V1',
        age: 1,
        version:  'V1',
    );
    userBox?.put(newUserModel.uuid, newUserModel);

    setState(() {
      _printBoxContent();
    });
  }

  Future<void> _incrementCounterV2() async {
    userBox ??= await Hive.openBox<UserModel>('users');
    UserModel newUserModel = UserModel(
        uuid: (++_counter).toString(),
        name: 'teste $_counter',
        lastName: 'V2',
        age: 1,
        version:  'V2',
    );
    userBox?.put(newUserModel.uuid, newUserModel);

    setState(() {
      _printBoxContent();
    });
  }

  Future<void> _decrementCounter() async {
    userBox ??= await Hive.openBox<UserModel>('users');
    if(userBox!.isNotEmpty) {
      userBox?.delete(userBox!.values.last.uuid);
    }

    setState(() {
      _printBoxContent();
      _counter--;
    });
  }


  Future<void> _printBoxContent() async {
    userBox ??= await Hive.openBox<UserModel>('users');
    content = '';
    for(UserModel userModel in userBox!.values){
      setState(() {
        content += 'id:${userModel.uuid} (${
            userModel.toString().replaceAll('Instance of ','')
        })\n';
      });
    }
    print('printing done');
  }

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
            Text(content),
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _decrementCounter,
            backgroundColor: Colors.red,
            tooltip: 'Increment',
            child: const Icon(Icons.exposure_minus_1),
          ),
          const SizedBox(width: 4),
          FloatingActionButton(
            onPressed: _incrementCounterV1,
            tooltip: 'Increment V1',
            child: const Icon(Icons.exposure_plus_1),
          ),
          const SizedBox(width: 4),
          FloatingActionButton(
            onPressed: _incrementCounterV2,
            tooltip: 'Increment V2',
            child: const Icon(Icons.exposure_plus_2),
          ),
        ],
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
