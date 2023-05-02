import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/constants.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _userMailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();

  @override
  void dispose() {
    _userNameController.dispose();
    _userMailController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
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
            margin: const EdgeInsets.only(top: 50),
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
                  const SizedBox(height: 18),
                  Text(
                    "Créer un compte",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: GlobalColors.textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 18),
                  TextFormField(
                    controller: _userNameController,
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'Nom d\'utilisateur',
                      filled: true,
                      fillColor: GlobalColors.tertiaryColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Entrer votre nom d\'utilisateur';
                      }
                      return null;
                    },
                    style: GoogleFonts.poppins(
                        color: GlobalColors.textColor,
                        fontSize: 15 // set the text color
                        ),
                  ),
                  const SizedBox(height: 18),
                  TextFormField(
                    controller: _userMailController,
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
                    style: GoogleFonts.poppins(
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
                    style: GoogleFonts.poppins(
                        color: GlobalColors.textColor,
                        fontSize: 15 // set the text color
                        ),
                  ),
                  const SizedBox(height: 18),
                  TextFormField(
                    controller: _passwordConfirmController,
                    textAlign: TextAlign.center,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Confirmation mot de passe',
                      filled: true,
                      fillColor: GlobalColors.tertiaryColor,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Confirmer votre mot de passe';
                      }
                      return null;
                    },
                    style: GoogleFonts.poppins(
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
                        Navigator.pushReplacementNamed(
                            context, '/farmers/home');
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: GlobalColors.primaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      minimumSize: const Size(double.infinity, 55),
                    ),
                    child: Text(
                      'Enregistrer',
                      style: GoogleFonts.poppins(
                        color: GlobalColors.whiteColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(height: 18),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.info_outline_rounded,
                        color: Colors.red,
                        size: 15,
                      ),
                      Text(
                        " Cette parte est reservée aux agriculteurs",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          color: Colors.red,
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  TextButton(
                    onPressed: () {},
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Vous avez déjà un compte ? ',
                              style: GoogleFonts.poppins(
                                color: GlobalColors.primaryColor,
                                fontSize: 12,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                    context, '/login');
                              },
                              child: Text(
                                'Se connecter !',
                                style: GoogleFonts.poppins(
                                  color: GlobalColors.notificationColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 60),
                        // powered by GEEKS CODE
                        Text(
                          'Powered by GEEKS CODE',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: const Color.fromARGB(101, 77, 99, 70),
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
