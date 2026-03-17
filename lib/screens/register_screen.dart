import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget{
  final String? role;
  const RegisterScreen({super.key, this.role});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  late String selectedRole;

  final List<String> roles = [
    "Administrador",
    "Supervisor",
    "Maestro",
    "Alumno",
  ];

  @override
  void initState() {
    super.initState();
    selectedRole = widget.role ?? "Alumno";
  }

  @override
  Widget build(BuildContext context){
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
              offset: Offset(0,5),
            )
          ],
        ),

        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Crear cuenta",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),
            widget.role == null
            ? DropdownButtonFormField<String>(
                initialValue: selectedRole, 
                decoration: const InputDecoration(
                  labelText: "Rol",
                  border: OutlineInputBorder(),
                ),
                items: roles.map((role){
                  return DropdownMenuItem<String>(
                  value: role,
                  child: Text(role),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedRole = value!;
                });
              },
            )
            : Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10)
              ),
              child: Text(
                "Rol: $selectedRole",
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
            ),

            const SizedBox(height: 15),
            TextField(
              decoration: InputDecoration(
                labelText: "Correo electronico",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 15),
            TextField(
              obscureText: true,
              decoration: InputDecoration(
                labelText: "Contraseña",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),

            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text("Crear"),
              ),
            ),

          ],
        ),

      ),
    ),
   );

  }
}