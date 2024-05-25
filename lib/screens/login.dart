import 'package:billminder/screens/signup.dart';
import 'package:billminder/utils/color_pallette.dart';
import 'package:billminder/utils/size_utils.dart';
import 'package:flutter/material.dart';
import 'package:billminder/components/textfield.dart';
import 'package:flutter/gestures.dart';

import 'dashboard.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Pallette.billminder_primary,
      body: SingleChildScrollView(
        child: Container(
        width: pw(context, 100),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: ph(context, 12),
            ),
            Container(
              height: ph(context, 15),
              child: ClipRRect(
                child: Image.asset('assets/icons/icon.png'),
              ),
            ),
            Container(
              height: ph(context, 2),
            ),
            Container(
              height: ph(context, 5),
              child: const Text("Bill Minder",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 32
                ),
              ),
            ),
            SizedBox(
              height: ph(context, 4),
            ),
            Container(
              height: ph(context, 62),
              decoration: BoxDecoration(
                  color: Pallette.billminder_secondary,
                borderRadius: BorderRadius.circular(35)
              ),
              child: Container(
                margin: EdgeInsets.symmetric(
                  horizontal: pw(context, 5)
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: ph(context, 7),
                    ),
                    CustomTextField(
                      controllerName: emailController,
                      textInputAction: TextInputAction.next,
                      hintText: '', label: 'Email',
                    ),
                    SizedBox(
                      height: ph(context, 2),
                    ),
                    CustomTextField(
                      controllerName: passwordController,
                      textInputAction: TextInputAction.next,
                      hintText: '', label: 'Password',
                      isPassword: true,
                    ),
                    SizedBox(
                      height: ph(context, 5),
                    ),
                    InkWell(
                      onTap: (){
                        Navigator.push(
                            context, MaterialPageRoute(builder: (context) => const Dashboard()));
                      },
                      child: Container(
                        width: pw(context, 28),
                        height: ph(context, 6),
                        decoration: BoxDecoration(
                          color: Pallette.billminder_secondary_two,
                          borderRadius: BorderRadius.circular(4),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2), // Adjust the opacity as needed
                              spreadRadius: 2,
                              blurRadius: 4,
                              offset: Offset(0, 2), // changes position of shadow
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Text(
                            'Login',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: pw(context, 5), vertical: pw(context,5)
                      ),
                      
                      child: RichText(
                        text: TextSpan(
                          style: const TextStyle(
                            color: Colors.black, fontSize: 18.0, fontWeight: FontWeight.bold
                          ),
                          children: <TextSpan>[
                            TextSpan(
                                text: 'Sign Up?',
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Navigator.push(
                                      context, MaterialPageRoute(builder: (context) => const Signup()));
                                  }),
                          ],
                        )
                      )
                    )
                  ],
                ),

              ),
            )
          ],
        ),
        
      ),
      )

    );
  }
}
