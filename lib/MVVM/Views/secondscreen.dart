import "package:flutter/material.dart";

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 360,
          height: 600,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(color: Color.fromARGB(255, 229, 225, 212)),
          child: Stack( // Needed to overlap background
            children: [
              Positioned(
                left: 80,
                top: 80,
                child: Container(
                  width: 200,
                  height: 100,
                  decoration: const BoxDecoration(color: Color.fromARGB(255, 109, 202, 169)),
                  child: const Center(
                    child: Text(
                      'Goodddtyyy',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        height: 0,
                      ),
                    )
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}