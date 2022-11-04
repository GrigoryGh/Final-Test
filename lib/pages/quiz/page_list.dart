import 'package:final_test/pages/quiz/questions.dart';
import 'package:flutter/material.dart';



final List<Widget> myList = [
  Container(
    color: Colors.orange,
    child: const Center(
      child: Text(
        'Get Ready',
        style: TextStyle(fontSize: 80, color: Colors.white),
      ),
    ),
  ),
  Container(
    color: Colors.blue,
    child: const Center(
      child: Text(
        '5',
        style: TextStyle(fontSize: 80, color: Colors.white),
      ),
    ),
  ),
  Container(
    color: const Color.fromARGB(255, 255, 230, 0),
    child: const Center(
      child: Text(
        '4',
        style: TextStyle(fontSize: 80, color: Colors.white),
      ),
    ),
  ),
  Container(
    color: const Color.fromARGB(255, 24, 201, 29),
    child: const Center(
      child: Text(
        '3',
        style: TextStyle(fontSize: 80, color: Colors.white),
      ),
    ),
  ),
  Container(
    color: Colors.orange,
    child: const Center(
      child: Text(
        '2',
        style: TextStyle(fontSize: 80, color: Colors.white),
      ),
    ),
  ),
  Container(
    color: Colors.purple,
    child: const Center(
      child: Text(
        '1',
        style: TextStyle(fontSize: 80, color: Colors.white),
      ),
    ),
  ),
  Container(
    color: const Color.fromARGB(255, 12, 195, 18),
    child: const Center(
      child: Text(
        'GO!',
        style: TextStyle(fontSize: 80, color: Colors.white),
      ),
    ),
  ),
  quizQuestions(),
];

