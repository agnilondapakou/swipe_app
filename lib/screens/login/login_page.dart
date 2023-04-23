import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../../utils/constants.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GlobalColors.whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 100),
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 120,
                    child: Image(
                        image: AssetImage("assets/icons/logo.png"), width: 200),
                  ),
                  const SizedBox(height: 50),
                  TextFormField(
                    controller: _userNameController,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Email ou téléphone',
                      filled: true,
                      fillColor: GlobalColors.tertiaryColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Entrer votre email ou téléphone';
                      }
                      return null;
                    },
                    style: TextStyle(
                        color: GlobalColors.textColor,
                        fontSize: 15 // set the text color
                        ),
                  ),
                  const SizedBox(height: 18),
                  TextFormField(
                    controller: _passwordController,
                    textAlign: TextAlign.center,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Mot de passe',
                      filled: true,
                      fillColor: GlobalColors.tertiaryColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Entrer votre mot de passe';
                      }
                      return null;
                    },
                    style: TextStyle(
                        color: GlobalColors.textColor,
                        fontSize: 15 // set the text color
                        ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        // Show loading indicator
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (BuildContext context) {
                            return const Center(
                                child: SpinKitChasingDots(
                              color: Colors.green,
                              size: 60.0,
                            ));
                          },
                        );

                        // Simulate login process
                        await Future.delayed(const Duration(seconds: 2));
                        // ignore: use_build_context_synchronously
                        Navigator.pushReplacementNamed(context, '/home');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: GlobalColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      minimumSize: const Size(double.infinity, 55),
                    ),
                    child: const Text(
                      'Connexion',
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  TextButton(
                    onPressed: () {},
                    child: Column(
                      children: [
                        Text(
                          'Vous n\'avez pas de compte ? ',
                          style: TextStyle(
                            color: GlobalColors.primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            // Navigate to create account page
                          },
                          child: Text(
                            'Créez-en un !',
                            style: TextStyle(
                              color: GlobalColors.quaternaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                        ),
                        const SizedBox(height: 60),
                        // powered by GEEKS CODE
                        const Text(
                          'Powered by GEEKS CODE',
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 12,
                            color: Color.fromARGB(101, 77, 99, 70),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
