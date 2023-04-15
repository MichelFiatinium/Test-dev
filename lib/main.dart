import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  int _currentIndex = 0;

  final tabs = [
    HomePage(),
    LoginForm(),
    Center(child: Text('Settings')),
  ];

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text("My_app pages"),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),

      body: tabs[_currentIndex],

      // barre se navigation
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_rounded,
              color: Colors.deepOrangeAccent,
              size: 30,
            ),
            label: 'Home',
            //backgroundColor: Colors.deepOrangeAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.login_rounded,
              color: Colors.deepPurpleAccent,
              size: 30,
            ),
            label: 'LogIn',
            //backgroundColor: Colors.deepPurpleAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.settings_rounded,
              color: Colors.blueAccent,
              size: 30,
            ),
            label: 'Settings',
            //backgroundColor: Colors.blueAccent,
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),

      /*  floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), */ // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      
      children: [
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Image.network(
              "https://scontent-lis1-1.xx.fbcdn.net/v/t39.30808-6/242393123_1022143271922346_7489402958299997720_n.jpg?_nc_cat=104&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=aNzl8hRzJEsAX-eGAtg&_nc_ht=scontent-lis1-1.xx&oh=00_AfD-4gCX3f-1CQ_cnyUCsENPkD44ZVyh1VOHWEJ6M5fhHg&oe=643DEFAA",
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width / 2,
            ),
            Image.asset(
              "img/ma_photo.jpg",
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width / 2,
            )
          ],
        ),

         SizedBox(height: 16),
                Text(
                  'Sonia Ahouéfa NOUMON',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    backgroundColor: Colors.black,
                    color: Colors.white
                  
                  ),
                ),
      ],
    );
  }
}



class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _passwordVisible = false;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void _togglePasswordVisibility() {
    setState(() {
      _passwordVisible = !_passwordVisible;
    });
  }

  void _showModal(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color.fromARGB(255, 211, 211, 211),
          title: Text("Informations de connexion"),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Identifiant : ${_usernameController.text}"),
              SizedBox(height: 10),
              Text("Mot de passe : ${_passwordController.text}"),
            ],
          ),
          actions: [
            ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("Fermer"),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Color.fromARGB(255, 255, 17, 0)),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 146, 239, 255),
    
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                
                controller: _usernameController,
                decoration: InputDecoration(
                  icon: Icon(
                  Icons.person,
                  size: 30,
                  color: Colors.white,),
                  labelText: "Identifiant",
                  
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _passwordController,
                obscureText: !_passwordVisible,
                decoration: InputDecoration(
                  icon: Icon(
                  Icons.password,
                  size: 30,
                  color: Colors.white,),
                  labelText: "Mot de passe",
                  
                  suffixIcon: IconButton(
                    icon: Icon(
                      _passwordVisible ? Icons.visibility : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                    onPressed: _togglePasswordVisibility,
                  ),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => _showModal(context),
                child: Text("S'authentifier"),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Color(0xFF007C91)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

