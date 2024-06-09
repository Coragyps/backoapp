import 'package:flutter/material.dart';

class FeedScreen extends StatefulWidget {
  final int type;
  const FeedScreen({super.key, this.type = 1});

  @override
  State<FeedScreen> createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}