import 'package:flutter/material.dart';
import 'package:play_store_app/Components/Acoount_widgets.dart';
import 'package:play_store_app/Components/notification.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:flutter_search_bar/flutter_search_bar.dart'
    as search_bar_package;

class SearchBarWidget extends StatefulWidget implements PreferredSizeWidget {
  final Function(String) onSearchSubmitted;

  const SearchBarWidget({
    Key? key,
    required this.onSearchSubmitted,
  }) : super(key: key);

  @override
  _SearchBarWidgetState createState() => _SearchBarWidgetState();

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  late final search_bar_package.SearchBar searchBar;
  final stt.SpeechToText speechToText = stt.SpeechToText();

  @override
  void initState() {
    super.initState();
    searchBar = search_bar_package.SearchBar(
      inBar: false,
      setState: setState,
      onSubmitted: widget.onSearchSubmitted,
      buildDefaultAppBar: _buildAppBar,
    );
    _initSpeechToText();
  }

  void _initSpeechToText() async {
    await speechToText.initialize();
    if (mounted) setState(() {});
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('Your App Name'),
      actions: [
        Flexible(
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 6.0),
            child: TextButton(
              onPressed: () {
                searchBar.beginSearch(context);
              },
              child: Ink(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      const Color.fromARGB(255, 47, 153, 240),
                      const Color.fromARGB(255, 172, 61, 192),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(30), // Border radius
                ),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: const Color.fromARGB(255, 219, 214, 214),
                      ),
                      const SizedBox(width: 5),
                      Expanded(
                        child: Text(
                          'Search for app & games',
                          style: TextStyle(
                            color: Color.fromARGB(255, 253, 244, 244),
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          _startListening();
                          searchBar.beginSearch(context);
                        },
                        icon: Icon(
                          Icons.mic,
                          color: Color.fromARGB(255, 231, 230, 230),
                        ),
                        padding: EdgeInsets.zero, // Remove extra padding
                        constraints:
                            BoxConstraints(), // Remove default constraints
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileSettingsPage()),
              );
            },
            icon: const Icon(Icons.account_circle),
            color: Colors.white),
        IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationPage()),
              );
            },
            icon: const Icon(Icons.notifications),
            color: Colors.white),
      ],
      backgroundColor: Colors.transparent,
    );
  }

  void _startListening() {
    if (!speechToText.isListening) {
      speechToText.listen(
        onResult: (result) {
          setState(() {
            searchBar.controller.text = result.recognizedWords;
          });
          if (result.finalResult) {
            speechToText.stop();
            widget.onSearchSubmitted(result.recognizedWords);
            searchBar.beginSearch(context);
          }
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return searchBar.build(context);
  }
}
