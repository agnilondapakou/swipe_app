import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:swipe_app/models/api_response.dart';
import 'package:swipe_app/screens/login/login_page.dart';
import 'package:swipe_app/services/auth/auth_service.dart';
import '../../utils/constants.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _userInfoController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();
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
                  SizedBox(
                    height: 120,
                    child: Image.asset("assets/icons/logo.png", width: 200),
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
                  buildTextFormField(
                    controller: _userNameController,
                    hintText: 'Nom d\'utilisateur',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Entrer votre nom d\'utilisateur';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 18),
                  buildTextFormField(
                    controller: _userInfoController,
                    hintText: 'Email ou téléphone',
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Entrer votre email ou téléphone';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 18),
                  buildTextFormField(
                    controller: _passwordController,
                    hintText: 'Mot de passe',
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Entrer votre mot de passe';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 18),
                  buildTextFormField(
                    controller: _passwordConfirmController,
                    hintText: 'Confirmation mot de passe',
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Confirmer votre mot de passe';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate() &&
                          _passwordController.text.trim() ==
                              _passwordConfirmController.text.trim()) {
                        registerUser();
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
                        " Cette partie est réservée aux agriculteurs",
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
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/login');
                    },
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
                            Text(
                              'Se connecter !',
                              style: GoogleFonts.poppins(
                                color: GlobalColors.notificationColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 60),
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

  TextFormField buildTextFormField({
    required TextEditingController controller,
    required String hintText,
    bool obscureText = false,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      textAlign: TextAlign.center,
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: GlobalColors.tertiaryColor,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
      validator: validator,
      style: GoogleFonts.poppins(
        color: GlobalColors.textColor,
        fontSize: 15,
      ),
    );
  }

  void registerUser() async {
    ApiResponse response = await register(
      _userNameController.text.trim(),
      _userInfoController.text.trim(),
      'farmer',
      _passwordController.text.trim(),
      '0',
    );

    print(response.data);
    if (response.data != null) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const LoginPage()),
        (route) => false,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Compte créé ! Veuillez vous connecter"),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Création échouée"),
        ),
      );
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const RegisterPage()),
        (route) => false,
      );
    }
  }
}



