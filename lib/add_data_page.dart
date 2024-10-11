import 'package:flutter/material.dart';

class AddDataPage extends StatefulWidget {
  const AddDataPage({super.key});

  @override
  State<AddDataPage> createState() => _AddDataPageState();
}

class _AddDataPageState extends State<AddDataPage> {
  final _formKey = GlobalKey<FormState>();

  String _name = '';
  String _school = '';
  String _about = '';
  String _history = '';
  String _skills = '';
  String? _imagePath; // Placeholder for image path

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Data'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Input for Name
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Name'),
                  onSaved: (value) {
                    _name = value!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Input for School
                TextFormField(
                  decoration: const InputDecoration(labelText: 'School'),
                  onSaved: (value) {
                    _school = value!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your school name';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 16),

                // Input for About
                TextFormField(
                  decoration: const InputDecoration(labelText: 'About'),
                  onSaved: (value) {
                    _about = value!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter about information';
                    }
                    return null;
                  },
                  maxLines: 3,
                ),
                const SizedBox(height: 16),

                // Input for History
                TextFormField(
                  decoration: const InputDecoration(labelText: 'History'),
                  onSaved: (value) {
                    _history = value!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter history information';
                    }
                    return null;
                  },
                  maxLines: 3,
                ),
                const SizedBox(height: 16),

                // Input for Skills
                TextFormField(
                  decoration: const InputDecoration(labelText: 'Skills'),
                  onSaved: (value) {
                    _skills = value!;
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter skills';
                    }
                    return null;
                  },
                  maxLines: 3,
                ),
                const SizedBox(height: 16),

                // Save Button
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        Navigator.pop(context, {
                          'name': _name,
                          'school': _school,
                          'about': _about,
                          'history': _history,
                          'skills': _skills,
                          'image':
                              _imagePath, // We can handle the image picker later
                        });
                      }
                    },
                    child: const Text('Save'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
