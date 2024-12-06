import 'package:flutter/material.dart';
import 'HomePage.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  final String correctUsername = "grupo3-queijaria";
  final String correctPassword = "bioparkeducacao";

  void _login() {
    setState(() {
      _isLoading = true;
    });

    if (_usernameController.text == correctUsername && _passwordController.text == correctPassword) {
   
      setState(() {
        _isLoading = false;
      });
      Navigator.pushReplacement(
  context,
  MaterialPageRoute(builder: (context) => HomePage()),
);

    } else {
      
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Usuário ou senha incorretos')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D2838), // Fundo azul escuro
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
        
              Image.asset(
                'assets/queijos-finos.png',
                height: 100,
              ),
              const SizedBox(height: 40),

             
              TextField(
                controller: _usernameController,
                decoration: InputDecoration(
                  hintText: 'Usuário',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 20),

            
              TextField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Senha',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: TextStyle(color: Colors.black),
              ),
              const SizedBox(height: 40),

           
              _isLoading
                  ? CircularProgressIndicator(color: Colors.white)
                  : ElevatedButton(
                      onPressed: _login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF9D8E61), // Cor do botão
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: Text(
                        'Entrar',
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
