import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:flutterfirsttest/widgets/themeColor.dart';

class ChatMessage {
  final String role;
  final String content;
  final DateTime timestamp;

  ChatMessage({required this.role, required this.content, DateTime? timestamp})
    : timestamp = timestamp ?? DateTime.now();
}

class Server {
  final Uri baseUrl = Uri.parse(
    'https://hf-proxy.parrytube.workers.dev',
  );

  Future<String> askWithHistory(List<ChatMessage> history) async {
    final messages = _buildMessages(history);

    final response = await http.post(
      baseUrl,
      headers: {
        'Content-Type': 'application/json',
      },
      body: convert.jsonEncode({
        'model': 'deepseek-ai/DeepSeek-V3-0324',
        'messages': messages,
        'temperature': 0.5,
        'max_tokens': 500,
      }),
    );

    if (response.statusCode == 401 || response.statusCode == 403) {
      return 'Authentication failed. Check your Hugging Face API key.';
    }

    if (response.statusCode == 404) {
      return 'Model not available via Hugging Face Inference Providers.';
    }

    if (response.statusCode == 503) {
      return 'Model is loading, please try again in a moment.';
    }

    if (response.statusCode != 200) {
      return 'Request failed (${response.statusCode}): ${response.body}';
    }

    final data = convert.jsonDecode(response.body);

    return data['choices']?[0]?['message']?['content'] ??
        'No response from model.';
  }

  List<Map<String, String>> _buildMessages(List<ChatMessage> history) {
    final messages = <Map<String, String>>[];

    messages.add({
      'role': 'system',
      'content':
          'You are a medical information assistant. Provide general health information only. '
          'Do not give personalized medical advice. Always recommend consulting a doctor. '
          'IMPORTANT: Format your response as plain text only. Do NOT use any markdown symbols including: '
          '# (hash), * (asterisk), _ (underscore), ` (backtick), [ ], ( ), **bold**, *italic*, lists, or any formatting. '
          'Write simple, clear sentences without any special characters.',
    });

    for (final msg in history) {
      messages.add({
        'role': msg.role == 'user' ? 'user' : 'assistant',
        'content': msg.content,
      });
    }

    return messages;
  }
}

class PersistentChatWidget extends StatefulWidget {
  const PersistentChatWidget({super.key});

  @override
  State<PersistentChatWidget> createState() => _PersistentChatWidgetState();
}

class _PersistentChatWidgetState extends State<PersistentChatWidget> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final Server _server = Server();

  final List<ChatMessage> _messages = [
    ChatMessage(
      role: 'assistant',
      content:
          "Hello! I'm your MediInfo health assistant. I can help answer questions about your medications, symptoms, or general wellness. How can I help you today?",
    ),
  ];
  bool _loading = false;

  final List<String> _suggestions = [
    'Side effects of Lisinopril?',
    'Best time to take Albuterol?',
    'How to improve sleep?',
    'Dietary restrictions?',
  ];

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _sendSuggestion(String suggestion) {
    _controller.text = suggestion;
    _sendMessage();
  }

  Future<void> _sendMessage() async {
    final text = _controller.text.trim();
    if (text.isEmpty || _loading) return;

    setState(() {
      _messages.add(ChatMessage(role: 'user', content: text));
      _loading = true;
      _controller.clear();
    });
    _scrollToBottom();

    try {
      final reply = await _server.askWithHistory(_messages);

      setState(() {
        _messages.add(ChatMessage(role: 'assistant', content: reply));
      });
      _scrollToBottom();
    } catch (_) {
      setState(() {
        _messages.add(
          ChatMessage(
            role: 'assistant',
            content: 'Sorry, something went wrong.',
          ),
        );
      });
      _scrollToBottom();
    } finally {
      setState(() {
        _loading = false;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            controller: _scrollController,
            padding: const EdgeInsets.all(12),
            itemCount: _messages.length,
            itemBuilder: (context, index) {
              final msg = _messages[index];
              final isUser = msg.role == 'user';

              return Align(
                alignment: isUser
                    ? Alignment.centerRight
                    : Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: isUser
                      ? CrossAxisAlignment.end
                      : CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      padding: const EdgeInsets.all(12),
                      constraints: BoxConstraints(
                        maxWidth: isUser
                            ? screenWidth * 0.75
                            : screenWidth * 0.95,
                      ),
                      decoration: BoxDecoration(
                        color: isUser ? themeColor.blue500 : Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SelectableText(
                            msg.content,
                            style: TextStyle(
                              color: themeColor.hsl_textDark.toColor(),
                              fontFamily: "Sora",
                              fontSize: 16,
                            ),
                          ),
                          if (!isUser)
                            Padding(
                              padding: const EdgeInsets.only(top: 7),
                              child: MouseRegion(
                                cursor: SystemMouseCursors.click,
                                child: GestureDetector(
                                  onTap: () {
                                    Clipboard.setData(
                                      ClipboardData(text: msg.content),
                                    );
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text(
                                          'Copied to clipboard',
                                          style: TextStyle(
                                            color: themeColor.hsl_textDark
                                                .toColor(),
                                          ),
                                        ),
                                        backgroundColor: themeColor
                                            .hsl_layoutDark1
                                            .toColor(),
                                        duration: const Duration(
                                          milliseconds: 1500,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.copy,
                                        size: 14,
                                        color: themeColor.hsl_MutedTextDark
                                            .toColor(),
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        'Copy',
                                        style: TextStyle(
                                          color: themeColor.hsl_MutedTextDark
                                              .toColor(),
                                          fontSize: 12,
                                          fontFamily: "Sora",
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 12,
                        right: 12,
                        bottom: 4,
                      ),
                      child: Text(
                        '${msg.timestamp.hour.toString().padLeft(2, '0')}:${msg.timestamp.minute.toString().padLeft(2, '0')}',
                        style: TextStyle(
                          color: themeColor.hsl_MutedTextDark.toColor(),
                          fontSize: 10,
                          fontFamily: "Sora",
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Divider(color: themeColor.hsl_LabelDark2.toColor()),
        SizedBox(height: 11),
        if (_loading)
          LinearProgressIndicator(
            color: themeColor.hsl_plusDark.toColor(),
            backgroundColor: themeColor.hsl_LabelDark2.toColor(),
          ),
        if (_messages.length == 1)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              alignment: WrapAlignment.center,
              children: _suggestions.map((suggestion) {
                return InkWell(
                  onTap: () => _sendSuggestion(suggestion),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: themeColor.hsl_layoutDark1.toColor(),
                      borderRadius: BorderRadius.circular(19),
                      border: Border.all(
                        color: themeColor.hsl_buttonDark3.toColor(),
                        width: 1,
                      ),
                    ),
                    child: Text(
                      suggestion,
                      style: TextStyle(
                        color: themeColor.hsl_textDark.toColor(),
                        fontSize: 13,
                        fontFamily: "Sora",
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        Padding(
          padding: const EdgeInsets.all(7),
          child: TextField(
            controller: _controller,
            minLines: 1,
            maxLines: 5,
            textInputAction: TextInputAction.send,
            onSubmitted: (_) => _sendMessage(),
            style: TextStyle(
              color: themeColor.hsl_textDark.toColor(),
              fontFamily: "Sora",
            ),
            decoration: InputDecoration(
              hintText: 'Ask a question…',
              hintStyle: TextStyle(
                color: themeColor.hsl_MutedTextDark.toColor(),
                fontFamily: "Sora",
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(19),
                borderSide: BorderSide(
                  color: themeColor.hsl_buttonDark3.toColor(),
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(19),
                borderSide: BorderSide(
                  color: themeColor.hsl_buttonDark3.toColor(),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(19),
                borderSide: BorderSide(
                  color: themeColor.hsl_plusDark.toColor(),
                  width: 3,
                ),
              ),
              suffixIcon: Padding(
                padding: EdgeInsets.only(right: 10, left: 10, bottom: 3),
                child: Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: themeColor.hsl_LabelDark2.toColor(),
                        blurRadius: 3,
                        spreadRadius: 0.5,
                        offset: Offset(0, 3),
                      ),
                    ],
                    gradient: LinearGradient(
                      colors: [themeColor.cyan600, Color(0xFF7C3AED)],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      transform: GradientRotation(45 * 3.141592653589793 / 180),
                    ),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: _loading ? null : _sendMessage,
                      child: Align(
                        alignment: Alignment(0.1, -0.1),
                        child: Transform.rotate(
                          angle: -45 * 3.141592653589793 / 180,
                          child: Icon(
                            Icons.send,
                            color: Colors.white,
                            size: 22,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 7),
          child: Text(
            'This is general information only — not a substitute for medical advice.',
            style: TextStyle(
              fontSize: 12,
              color: themeColor.hsl_MutedTextDark.toColor(),
              fontFamily: "Sora",
            ),
          ),
        ),
      ],
    );
  }
}
