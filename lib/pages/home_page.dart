import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? _image; // To store the captured image
  final picker = ImagePicker(); // Image picker instance

  // Method to pick an image from the camera
  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path); // Set the captured image
      });

      // Upload the image to the Flask API
      await _uploadImage(_image!);
    }
  }

  // Method to upload the image to the Flask API
  Future<void> _uploadImage(File image) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(
          'http://<your-ec2-public-ip>:5000/predict'), // Update with your EC2 public IP
    );

    request.files.add(await http.MultipartFile.fromPath('file', image.path));

    try {
      var response = await request.send();

      if (response.statusCode == 200) {
        final responseBody = await response.stream.bytesToString();
        _showResponseDialog(
            'Response', responseBody); // Show the response in an alert dialog
      } else {
        _showResponseDialog('Error',
            'Failed to upload image. Status code: ${response.statusCode}');
      }
    } catch (e) {
      _showResponseDialog('Error',
          'Error uploading image: $e'); // Show error in an alert dialog
    }
  }

  // Method to show the response in an alert dialog
  void _showResponseDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.white,
              Color(0xffec8677),
            ],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _image == null
                  ? const Text(
                      'No image selected.',
                      style: TextStyle(fontSize: 30),
                    )
                  : Image.file(_image!),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.greenAccent,
        onPressed: _pickImage,
        child: const Icon(Icons.camera),
      ),
    );
  }
}
