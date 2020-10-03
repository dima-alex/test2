import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Hero(
          tag: 'logo',
          child: Image.asset('images/cat.png'),
        ),
      ),
    );
  }
}
/////////////////////////////////////////////////
