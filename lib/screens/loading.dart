import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:swipe_app/models/api_response.dart';
import 'package:swipe_app/screens/login/login_page.dart';
import 'package:swipe_app/services/auth/auth_service.dart';

import 'home/farmers/home_page.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  Future<void> loadUserInfo() async {
    String? token = await isLoggedIn();
    if(token == ''){
      Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>const LoginPage()), (route) => false);
    }
    else {
      ApiResponse response = await getUser();
      if(response.error == null){
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context)=>const FarmersHomePage()), (route) => false);
      }
      else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Connexion échouée"),)
        );
      }
    }
  }

  @override
void initState(){
    loadUserInfo();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SpinKitChasingDots(
        color: Colors.green,
        size: 60.0,
      ),
    );
  }
}
