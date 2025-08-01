import 'package:apple_invites/core/common/app_scaffold.dart';
import 'package:apple_invites/core/common/app_textfield.dart';
import 'package:apple_invites/core/components/components.dart';
import 'package:apple_invites/core/constants/string_constant.dart';
import 'package:apple_invites/screens/models/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FriendMessages extends StatefulWidget {
  final ContactModel friend;

  const FriendMessages({super.key, required this.friend});

  @override
  State<FriendMessages> createState() => _FriendMessagesState();
}

class _FriendMessagesState extends State<FriendMessages> {
  late List<Map<String, dynamic>> _messages;
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  @override
  void initState() {
    super.initState();
    _messages = [
      {
        'text': 'Hey there!',
        'sender': widget.friend.name,
        'timestamp': DateTime.now(),
      },
      {'text': 'Hi!', 'sender': 'You', 'timestamp': DateTime.now()},
      {
        'text': "How are you?.",
        'sender': widget.friend.name,
        'timestamp': DateTime.now(),
      },
      {'text': 'I am fine!', 'sender': 'You', 'timestamp': DateTime.now()},
    ];
    // WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(child: _buildFriendMessages(context));
  }

  void sendMessage() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _messages.add({
        'text': text,
        'sender': 'You',
        'timestamp': DateTime.now(),
      });
    });
    _controller.clear();
    //this is for keyboard hide
    //FocusScope.of(context).unfocus();

    // 👇 Scroll to bottom after slight delay
    _scrollToBottom();
  }

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

  _buildFriendMessages(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 48),
          child: Column(
            children: [
              loadDivider(),
              Expanded(
                child: ListView.builder(
                  controller: _scrollController,
                  itemCount: _messages.length,
                  reverse: false,
                  itemBuilder: (context, index) {
                    return _buildMessage(_messages[index]);
                  },
                ),
              ),
              loadDivider(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
                child: Row(
                  spacing: 8,
                  children: [
                    Expanded(
                      child: AppTextfield(
                        hintText: "type a message..",
                        textController: _controller,
                      ),
                    ),

                    loadCircleIcon(
                      borderColor: Colors.transparent,
                      icon: Icons.send,
                      onTap: sendMessage,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Positioned(
          left: 0,
          top: 0,
          right: 0,
          child: _buildTopBar(
            onTapped: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildMessage(Map<String, dynamic> message) {
    final isMe = message['sender'] == 'You';
    final timestamp = message['timestamp'] as DateTime?;
    final timeString =
        timestamp != null ? DateFormat('hh:mm:a').format(timestamp) : '';

    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: loadGlassBackground(
        borderRadius: 12,
        topPadding: 0,
        bottomPadding: 0,
        rightPadding: 0,
        leftPadding: 0,
        topMargin: 4,
        bottomMargin: 4,
        leftMargin: 12,
        rightMargin: 12,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          // margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
          decoration: BoxDecoration(
            color:
                isMe
                    ? Colors.white.withValues(alpha: 0.02)
                    : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            crossAxisAlignment:
                isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              if (!isMe)
                Text(
                  message['sender'],
                  style: const TextStyle(fontSize: 12, color: Colors.white70),
                ),
              Text(
                message['text'],
                style: const TextStyle(fontSize: 16, color: Colors.white),
              ),
              if (timeString.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    timeString,
                    style: TextStyle(
                      fontFamily: fontRoboto,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      color: Colors.white38,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTopBar({required VoidCallback onTapped}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      // height: 40, // Optional
      child: Row(
        children: [
          loadCircleIcon(
            icon: Icons.arrow_back,
            iconSize: 20,
            radius: 18,
            onTap: onTapped,
          ),
          const SizedBox(width: 12),

          // Title with image
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                loadCircleImage(radius: 18, imageUrl: widget.friend.imageUrl),
                const SizedBox(width: 8),
                Flexible(
                  // Use Flexible inside to ellipsize text
                  child: loadTitleText(
                    textOverflow: TextOverflow.ellipsis,
                    title: widget.friend.name,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(width: 44), // Match the size of back icon for symmetry
        ],
      ),
    );
  }
}
