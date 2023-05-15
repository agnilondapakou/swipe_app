import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../models/api_response.dart';
import '../../services/auth/auth_service.dart';
import '../../utils/constants.dart';
import '../home/farmers/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  void loginUser() async{
    ApiResponse response = await login(_userNameController.text.trim(), _passwordController.text.trim());
    if(response.data != null){
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>const FarmersHomePage()), (route) => false);
    }
    else {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Connexion échouée"),)
      );
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>const LoginPage()), (route) => false);
    }
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
                  const SizedBox(height: 18),
                  Text(
                    "Connectez-vous à votre compte",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      color: GlobalColors.textColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 20),
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
                        loginUser();

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
                      'Connexion',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  TextButton(
                    onPressed: () {},
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Vous n\'avez pas de compte ? ',
                              style: GoogleFonts.poppins(
                                color: GlobalColors.primaryColor,
                                fontSize: 12,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacementNamed(
                                    context, '/register');
                              },
                              child: Text(
                                'Créez-en un !',
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
