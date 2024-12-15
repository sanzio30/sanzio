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
        title: Text('My Autobiography'),
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
            label: 'Introduction',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Learning Journey',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.scale_outlined),
            label: 'Learning Plan',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.engineering),
            label: 'Specialization',
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
      'I was born into an ordinary but happy family. My father is a public servant working for the power company, and my mother is a homemaker. My younger brother and I are still in school. My parents raised us in a democratic way, encouraging us to be independent, proactive in learning, and to accumulate life experiences. They provide timely encouragement and advice, emphasizing two things: maintaining good health and focusing on academics. Without a healthy body, even the greatest talents and ambitions cannot be realized.'
      'During elementary school, I was active and energetic. My academic performance was average, but I excelled in extracurricular activities, serving as a class leader and participating in the school band and patrol team. I was also selected for the school high jump team.'
      'After graduating from elementary school, I attended a private middle school with strict rules, which helped me become more disciplined and mature. In middle school, I represented my school in a county-level award ceremony and delivered a speech at the graduation ceremony.'
      'In high school, every day felt fulfilling and joyful. The students were known for balancing hard work and fun. I constantly pushed myself to achieve this balance. In academics, I maintained good grades by paying close attention in class, thoroughly understanding the concepts taught, and asking questions whenever I had doubts. This approach allowed me to complete my studies efficiently and have extra time for extracurricular activities. Among all subjects, I particularly enjoyed math, chemistry, and biology. Math and chemistry honed my organizational and analytical skills, while biology provided insights into human life and mysteries.';

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Text(
              'Who Am I',
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
          Text('First Year Goals', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          SizedBox(height: 10),
          ListView(
            shrinkWrap: true,
            children: [
              Text('1. Improve English proficiency'),
              Text('2. Learn assembly language'),
              Text('3. Obtain certifications'),
              Text('4. Build interpersonal skills'),
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
        'Specialization',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
