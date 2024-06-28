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
        title: const Text("My Big Data",
            style: TextStyle(
                fontSize: 40, color: Color.fromARGB(255, 255, 255, 255))),
        backgroundColor: Color.fromARGB(255, 28, 0, 240),
      ),
      body: MyContent(),
    );
  }

  Widget MyContent() {
    final List<Map<String, String>> students = [
      {
        'name': 'นาย เกรียงศักดิ์ หมู่เมืองสอง 643450322-0',
        'image': 'assets/s.jpg'
      },
      {'name': 'นายเจษฎา ลีรัตน์ 643450067-0', 'image': 'assets/pa.jpg'},
      {'name': 'นายณัฐกานต์ อินทรพานิชย์ 643450072-7', 'image': 'assets/w.jpg'},
      {'name': 'นายธนาธิป เตชะ  643450076-9', 'image': 'assets/jjj.jpg'},
      {'name': 'นายพีระเดช โพธิ์หล้า 643450082-4', 'image': 'assets/p.jpg'},
      {'name': 'นายวิญญู พรมภิภักดิ์ 643450084-0', 'image': 'assets/m.jpg'},
      {'name': 'นายเทวารัณย์ ชัยกิจ 643450324-6', 'image': 'assets/pr.jpg'},
      {'name': 'นายศุภชัย แสนประสิทธิ์  643450332-7', 'image': 'assets/b.jpg'},
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
                final isHighlighted = studentName ==
                    'นาย เกรียงศักดิ์ หมู่เมืองสอง 643450322-0'; /////////////////////////////////////////////////////////////////////////////
                return Padding(
                  padding: const EdgeInsets.all(8.0),
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
