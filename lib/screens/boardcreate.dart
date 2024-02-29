import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:greencraft/screens/main_screen.dart';

class BoardCreateScreen extends StatefulWidget {
  @override
  _BoardCreateScreenState createState() => _BoardCreateScreenState();
}

class _BoardCreateScreenState extends State<BoardCreateScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  Future<void> createPost() async {
    final String title = _titleController.text;
    final String content = _contentController.text;
    final String username = _usernameController.text;
    final String password = _passwordController.text;
    // 게시글 생성 API 엔드포인트에 대한 URL을 설정하세요
    final Uri url = Uri.parse('http://10.0.2.2:8080/boards');

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({
        'title': title,
        'content': content,
        'username': username,
        'password': password
      }),
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      // 성공적으로 게시글이 생성되었을 때 처리
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                MainScreen()), // `HomeScreen`은 홈 화면 위젯의 클래스명으로 가정
      );
    } else {
      // 게시글 생성에 실패했을 때 처리
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Failed to create a post.'),
            actions: <Widget>[
              TextButton(
                child: Text(
                  'Close',
                  style: TextStyle(
                    color: Colors.black, // 텍스트 색상을 검정으로 설정
                    fontSize: 16.0, // 폰트 크기 설정
                    fontWeight: FontWeight.bold, // 폰트 두께를 굵게 설정
                  ),
                ),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            MainScreen()), // `HomeScreen`은 홈 화면 위젯의 클래스명으로 가정
                  );
                },
              ),
            ],
          );
        },
      );
    }
  }

  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(), // 테두리 추가
      contentPadding:
          EdgeInsets.symmetric(horizontal: 10, vertical: 10), // 패딩 설정
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create a Post'),
      ),
      body: SingleChildScrollView(
        // 스크롤 가능하도록 SingleChildScrollView 추가
        padding: EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            TextField(
              cursorColor: Colors.black,
              controller: _titleController,
              decoration: _inputDecoration('Title'),
            ),
            SizedBox(height: 12), // 여백 추가
            TextField(
              cursorColor: Colors.black,
              controller: _usernameController,
              decoration: _inputDecoration('Username'),
            ),
            SizedBox(height: 12), // 여백 추가
            TextField(
              cursorColor: Colors.black,
              controller: _contentController,
              decoration: _inputDecoration('Content'),
              keyboardType: TextInputType.multiline,
              minLines: 5, // 최소 높이 설정
              maxLines: null, // 무한으로 늘어날 수 있게 설정
            ),
            SizedBox(height: 12), // 여백 추가
            TextField(
              cursorColor: Colors.black,
              controller: _passwordController,
              decoration: _inputDecoration('Password'),
              obscureText: true,
            ),
            SizedBox(height: 24),
            ElevatedButton(
              onPressed: createPost,
              child: Text('Save',
                  style: TextStyle(
                    color: Colors.black, // 텍스트 색상을 검정으로 설정
                    fontSize: 16.0, // 폰트 크기 설정
                    fontWeight: FontWeight.bold, // 폰트 두께를 굵게 설정
                  ),),
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).primaryColor, // 버튼 색상
                padding:
                    EdgeInsets.symmetric(horizontal: 50, vertical: 20), // 버튼 패딩
                textStyle: TextStyle(fontSize: 16), // 텍스트 스타일
              ),
            ),
          ],
        ),
      ),
    );
  }
}
