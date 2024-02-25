import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:googleapis/dialogflow/v2.dart';

// Replace these values with your Dialogflow credentials
const _projectId = 'your_project_id';
const _languageCodeEnglish = 'en';
const _languageCodeHindi = 'hi';

void main() {
  runApp(SaakhiChatbotApp());
}

class SaakhiChatbotApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SaakhiChatScreen(),
    );
  }
}

class SaakhiChatScreen extends StatefulWidget {
  @override
  _SaakhiChatScreenState createState() => _SaakhiChatScreenState();
}

class _SaakhiChatScreenState extends State<SaakhiChatScreen> {
  final TextEditingController _controller = TextEditingController();
  final FlutterTts flutterTts = FlutterTts();

  @override
  void initState() {
    super.initState();
    _speak('Hello! How can I assist you today?');
  }

  Future<void> _speak(String message) async {
    await flutterTts.setLanguage(_languageCodeEnglish);
    await flutterTts.speak(message);
  }

  Future<void> _sendQuery(String query) async {
    final dialogflow = DialogflowApi();
    final response = await dialogflow.detectIntent(
      projectId: _projectId,
      queryInput: QueryInput(
        text: TextInput(text: query, languageCode: _languageCodeEnglish),
      ),
    );

    String fulfillmentText = response.queryResult.fulfillmentText;
    String detectedLanguage = response.queryResult.languageCode;

    if (detectedLanguage == _languageCodeHindi) {
      await flutterTts.setLanguage(_languageCodeHindi);
    } else {
      await flutterTts.setLanguage(_languageCodeEnglish);
    }

    setState(() {
      _controller.text = '';
      _speak(fulfillmentText);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SaakhiChatbot'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                // Chat history widget
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Enter your message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    String message = _controller.text.trim();
                    if (message.isNotEmpty) {
                      _sendQuery(message);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
