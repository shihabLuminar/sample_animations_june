import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double height = 100;
  double width = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            if (height == 100) {
              height = 300;
              width = 300;
            } else {
              height = 100;
              width = 100;
            }
            setState(() {});
          },
          child: AnimatedOpacity(
            opacity: height == 100 ? .2 : 1,
            duration: Duration(seconds: 2),
            child: AnimatedContainer(
              duration: Duration(seconds: 3),
              decoration: BoxDecoration(
                  color: height == 100 ? Colors.red : Colors.yellow,
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(height == 100
                          ? "https://images.pexels.com/photos/14448240/pexels-photo-14448240.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"
                          : "https://images.pexels.com/photos/29319438/pexels-photo-29319438/free-photo-of-scenic-view-of-venice-s-grand-canal-with-gondolas.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1"))),
              curve: Curves.easeInOutCubicEmphasized,
              height: height,
              width: width,
            ),
          ),
        ),
      ),
    );
  }
}
