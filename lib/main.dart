import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Big Data',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 20, 10, 210)),
        useMaterial3: true,
      ),
      home: MyAppPage(),
    );
  }
}

class MyAppPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "My Big Data",
          style: TextStyle(
              fontSize: 40, color: Color.fromARGB(255, 255, 255, 255)),
        ),
        backgroundColor: Color.fromARGB(255, 28, 0, 240),
      ),
      body: MyContent(),
    );
  }

  Widget MyContent() {
    final List<Map<String, String>> students = [
      {
        'name': 'นาย เกรียงศักดิ์ หมู่เมืองสอง',
        'id': '643450322-0',
        'image': 'assets/s.jpg',
        'about': 'เป็นคนดีมากๆ',
        'email': 'kriengsak.m@kkumail.com',
        'social': 'https://www.facebook.com/profile.php?id=100013027506922'
      },
      {
        'name': 'นายเจษฎา ลีรัตน์',
        'id': '643450067-0',
        'image': 'assets/pa.jpg',
        'about': 'เป็นคนอ่อนน้อม',
        'email': 'jatsada.l@kkumail.com',
        'social': 'https://www.facebook.com/pat.loveasd'
      },
      {
        'name': 'นายณัฐกานต์ อินทรพานิชย์',
        'id': '643450072-7',
        'image': 'assets/w.jpg',
        'about': 'เป็นคนเปิดเผย',
        'email': 'nattakarn.i@kkumail.com',
        'social': 'https://www.facebook.com/wai.nuttakan'
      },
      {
        'name': 'นายธนาธิป เตชะ',
        'id': '643450076-9',
        'image': 'assets/jjj.jpg',
        'about': 'เป็นคนชอบยิ้ม',
        'email': 'thanathip.t@example.com',
        'social': 'https://www.facebook.com/profile.php?id=100011086212292'
      },
      {
        'name': 'นายพีระเดช โพธิ์หล้า',
        'id': '643450082-4',
        'image': 'assets/p.jpg',
        'about': 'เป็นคนหุ่นหมี',
        'email': 'peeradet.p@kkumail.com',
        'social': 'https://www.facebook.com/peeradech8888'
      },
      {
        'name': 'นายวิญญู พรมภิภักดิ์',
        'id': '643450084-0',
        'image': 'assets/m.jpg',
        'about': 'เป็นคนรักแฟน',
        'email': 'winyu.p@kkumail.com',
        'social': 'https://www.facebook.com/profile.php?id=100014625613598'
      },
      {
        'name': 'นายเทวารัณย์ ชัยกิจ',
        'id': '643450324-6',
        'image': 'assets/pr.jpg',
        'about': 'เป็นคนน่าโดนแกล้ง',
        'email': 'tewaran.c@kkumail.com',
        'social': 'https://www.facebook.com/rungoodnam'
      },
      {
        'name': 'นายศุภชัย แสนประสิทธิ์',
        'id': '643450332-7',
        'image': 'assets/b.jpg',
        'about': 'เป็นคนเงียบๆ',
        'email': 'supachai.sa@kkumail.com',
        'social': 'https://www.facebook.com/beam.supachai.9'
      },
    ];

    return Container(
      color: Color.fromARGB(255, 96, 192, 244),
      child: Column(
        children: [
          const Text(
            "รายชื่อนักศึกษาปี 4 CIS",
            style: TextStyle(fontSize: 40, color: Color.fromARGB(255, 0, 0, 0)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                final student = students[index];
                final imageUrl = student['image']!;
                final studentName = student['name']!;
                final studentId = student['id']!;
                final studentAbout = student['about']!;
                final studentEmail = student['email']!;
                final studentSocial = student['social']!;
                final isHighlighted =
                    studentName == 'นาย เกรียงศักดิ์ หมู่เมืองสอง';
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StudentDetailPage(
                            name: studentName,
                            id: studentId,
                            image: imageUrl,
                            about: studentAbout,
                            email: studentEmail,
                            social: studentSocial,
                          ),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: AssetImage(imageUrl),
                          radius: 30,
                        ),
                        const SizedBox(width: 10),
                        Text(
                          '${index + 1}. $studentName',
                          style: TextStyle(
                            fontSize: 28,
                            color: isHighlighted
                                ? Color.fromARGB(255, 241, 6, 33)
                                : Colors.white,
                            fontWeight: isHighlighted
                                ? FontWeight.bold
                                : FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class StudentDetailPage extends StatelessWidget {
  final String name;
  final String id;
  final String image;
  final String about;
  final String email;
  final String social;

  const StudentDetailPage({
    required this.name,
    required this.id,
    required this.image,
    required this.about,
    required this.email,
    required this.social,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Color.fromARGB(255, 28, 0, 240),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(image),
                radius: 100,
              ),
              const SizedBox(height: 20),
              Text(
                name,
                style: const TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              Text(
                'ID: $id',
                style: const TextStyle(fontSize: 20),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                about,
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                'Email: $email',
                style: const TextStyle(fontSize: 18),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () {
                  _launchURL(social);
                },
                child: const Text(
                  'Link Facebook',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
