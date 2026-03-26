import 'package:app_register_camera/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';

class AccessCodeScreen extends StatefulWidget {
  const AccessCodeScreen({super.key});

  @override
  State<AccessCodeScreen> createState() => _AccessCodeScreenState();
}

class _AccessCodeScreenState extends State<AccessCodeScreen> {
  final TextEditingController codeController = TextEditingController();

  @override
  void dispose(){
    codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      backgroundColor: Colors.grey[200],

      body: Center(
        child: Container(
          width: 350,
          padding: const EdgeInsets.all(25),

          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const[
              BoxShadow(
                blurRadius: 10,
                color: Colors.black12,
                offset: Offset(0, 5),
              )
            ],
          ),

          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              const Text(
                "Acceso",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),
              TextField(
                controller: codeController,
                decoration: const InputDecoration(
                  labelText: "Codigo",
                  border:  OutlineInputBorder(), 
                ),
              ),

              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    
                    String code = codeController.text;
                    
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterScreen(),  
                      ), 
                    );
                  },
                  child: const Text("Validar codigo"),
                ),
              ),

              const SizedBox(height: 15),
              const Text("Si no cuentas con un codigo"),
              const SizedBox(height: 10),

              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LoginScreen(),
                    ),
                  );
                }, 
                child: const Text("Continuar"),
              ),

            ],
          ),
        ),
      ),
    );
  }

}