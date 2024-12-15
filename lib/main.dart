import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

final player = AudioPlayer()..setReleaseMode(ReleaseMode.loop);

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Autobiography App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final tabs = [
    Screen1(),
    Screen2(),
    Screen3(),
    Screen4(),
  ];

  int currentIndex = 0;

  void playAudio(int index) {
    player.stop();
    player.play(AssetSource('${index + 1}.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    if (currentIndex == 0) playAudio(0);

    return Scaffold(
      appBar: AppBar(
        title: Text('Autobiography App'),
        centerTitle: true,
      ),
      body: tabs[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        selectedFontSize: 18,
        unselectedFontSize: 14,
        iconSize: 30,
        currentIndex: currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/f1.jpg',
              width: currentIndex == 0 ? 40 : 30,
              height: currentIndex == 0 ? 40 : 30,
            ),
            label: 'About Me',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Learning Journey',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.scale_outlined),
            label: 'Future Plans',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.engineering),
            label: 'Professional Goals',
          ),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
            playAudio(index);
          });
        },
      ),
    );
  }
}

class Screen1 extends StatelessWidget {
  final String autobiography =
      'My name is Sanzio Evan Filbert (吴堅榮). I was born on June 30, 2005, and I am 19 years old. I am an Indonesian currently studying abroad in Taiwan at the National Kaohsiung University of Science and Technology (NKUST), where I am a second-year Computer Science and Information Engineering student.'
      '\n\nHobbies:'
      '\n- ☘️ Playing billiards'
      '\n- 🏀 Basketball'
      '\n- 🎮 Playing games'
      '\n- 🎵 Listening to music'
      '\n\nEducation:'
      '\nI am passionate about technology and innovation, aiming to become a skilled programmer contributing to meaningful tech advancements.';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Text(
              'About Me',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.fromLTRB(30, 0, 30, 50),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 3),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(color: Colors.amberAccent, offset: Offset(6, 6)),
              ],
            ),
            child: Text(
              autobiography,
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(height: 15),
          Image.asset('assets/f1.jpg', height: 200, width: 200),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildImageContainer('assets/f1.jpg'),
              _buildImageContainer('assets/f1.jpg'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildImageContainer(String imagePath) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.purple, width: 2),
        borderRadius: BorderRadius.circular(30),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Learning Journey',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Learning Goals', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          ListView(
            shrinkWrap: true,
            children: [
              Text('1. Improve English skills'),
              Text('2. Master programming'),
              Text('3. Obtain certifications'),
              Text('4. Build strong relationships'),
            ],
          ),
        ],
      ),
    );
  }
}

class Screen4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Professional Goals',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
