import 'package:flutter/material.dart';
import 'detail_page.dart';
import 'add_data_page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? name;
  String? school;
  String? about;
  String? history;
  String? skills;
  String? imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          // Background image from assets
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.jpeg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Card with profile picture and information
                Card(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        // Profile picture in a circle from assets or placeholder
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: imagePath != null
                              ? AssetImage(imagePath!) // Load selected image
                              : const AssetImage(
                                  'assets/mee.jpg'), // Placeholder
                        ),
                        const SizedBox(height: 16),
                        // Name
                        Text(
                          name ?? 'Muhammad Khairul Kholqi',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 8),
                        // School name
                        Text(
                          school ?? 'SMK Wikrama Bogor',
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 16),
                        // Buttons: View Details and Add Data
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                // Navigate to another page (Details)
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SecondPage(
                                      about: about,
                                      history: history,
                                      skills: skills,
                                    ),
                                  ),
                                );
                              },
                              child: const Text('View Details'),
                            ),
                            const SizedBox(width: 8),
                            ElevatedButton(
                              onPressed: () async {
                                // Navigate to Add Data page
                                final result = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const AddDataPage(),
                                  ),
                                );
                                if (result != null) {
                                  setState(() {
                                    name = result['name'];
                                    school = result['school'];
                                    about = result['about'];
                                    history = result['history'];
                                    skills = result['skills'];
                                    imagePath = result[
                                        'image']; // Placeholder for image
                                  });
                                }
                              },
                              child: const Text('Add Data'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
