import 'package:flutter/material.dart';

class Chatbox extends StatefulWidget {
  const Chatbox({super.key});

  @override
  State<Chatbox> createState() => _ChatboxState();
}

class _ChatboxState extends State<Chatbox> {
  final TextEditingController _controller = TextEditingController();
  bool _analyzed = false;

  // Mock analysis values (replace with actual AI model later)
  double toxicity = 0;
  double misinformation = 0;
  double hateSpeech = 0;
  double bullying = 0;

  void _analyzeText() {
    final input = _controller.text.trim();
    if (input.isEmpty) return;

    setState(() {
      _analyzed = true;

      // Mock result logic — replace with real AI model
      toxicity = (input.length * 3.1 % 100);
      misinformation = (input.length * 2.4 % 100);
      hateSpeech = (input.length * 2.8 % 100);
      bullying = (input.length * 1.9 % 100);
    });
  }

  Widget _buildResult(String label, double value, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label: ${value.toStringAsFixed(1)}%',
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        SizedBox(height: 5),
        LinearProgressIndicator(
          value: value / 100,
          backgroundColor: Colors.grey[300],
          valueColor: AlwaysStoppedAnimation<Color>(color),
        ),
        SizedBox(height: 15),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" Analyzer Chatbot"),
        centerTitle: true,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(2.0),
          child: Container(color: Colors.white, height: 2.0),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Intro Container
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Theme.of(
                    context,
                  ).colorScheme.secondary.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(color: Colors.black, width: 1.5),
                ),
                child: Text(
                  'Paste a post, comment, caption, or prompt of any photo or video and you will instantly get a '
                  'quantified view of toxicity, hate speech, cyberbullying risk, misinformation and sentiment.',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20),

              // Text Input
              TextField(
                controller: _controller,
                maxLines: 6,
                decoration: InputDecoration(
                  hintText: 'Paste the social post here...',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 30),

              // Analysis Results
              if (_analyzed) ...[
                _buildResult("Toxicity", toxicity, Colors.red),
                _buildResult("Misinformation", misinformation, Colors.orange),
                _buildResult("Hate Speech", hateSpeech, Colors.purple),
                _buildResult("Bullying Risk", bullying, Colors.blue),
              ],
            ],
          ),
        ),
      ),

      // Floating Analyze Button
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _analyzeText,
        icon: Icon(Icons.analytics, color: Colors.white), // icon color white
        label: Text(
          'Analyze Impact',
          style: TextStyle(color: Colors.white), // text color white
        ),
        backgroundColor: Colors.lightBlue, // sky blue background
      ),
    );
  }
}
