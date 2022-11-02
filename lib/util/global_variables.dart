import 'package:flutter/material.dart';
import 'package:proper_project/screens/add_post_screen.dart';
import 'package:proper_project/screens/feed_screen.dart';

const webScreenSize = 600;

const homeScreenItem = [
  FeedScreen(),
  Text("Search"),
  AddPostScreen(),
  Text("Favorite"),
  Text("Person"),
];