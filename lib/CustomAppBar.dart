// CustomAppBar.dart
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize; // Define o tamanho do AppBar

  CustomAppBar({Key? key})
      : preferredSize = const Size.fromHeight(56.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF0D2838),
      title: Image.asset(
        'assets/queijos-finos.png',
        height: 45,
      ),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              // Defina uma ação se necessário
            },
          ),
        ),
      ],
    );
  }
}
