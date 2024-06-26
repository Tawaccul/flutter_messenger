import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:messenger/components/consts.dart';
import 'package:messenger/components/my_button.dart';
import 'package:messenger/components/text_field.dart';
import 'package:messenger/services/auth/auth_service.dart';
import 'package:provider/provider.dart';


class LoginPage extends StatefulWidget{
  final void Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  void signIn() async {
      final authService = Provider.of<AuthService>(context, listen: false);  

      try{
        await authService.signInWithEmailAndPassword(
          emailController.text, 
          passwordController.text);
      } catch(e){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString(),
        ),
      ),
    );
   }
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: bgColor,
        body: SafeArea(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  const SizedBox( height: 30),

                    const Icon(
                    Icons.message,
                    size: 100,
                    color: Colors.grey,
                    ) ,
                    
                  const SizedBox( height: 30),
    
                    
                    const Text(
                      'Welcome to Messenger',
                      style: 
                      TextStyle(
                        fontSize: 16,
                      ),
                    ),

                  const SizedBox( height: 30),

                    MyTextField(
                      controller: emailController, 
                      hintText: 'Email', 
                      obscureText: false),

                  const SizedBox( height: 10),

                    MyTextField(
                      controller: passwordController, 
                      hintText: 'Password', 
                      obscureText: true), 

                  const SizedBox( height: 25),

                    MyButton(
                      onTap: signIn,
                      text: 'Sign in',
                    ),

                  const SizedBox( height: 15),

                   Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       const Text('Not a member?'),
                       const SizedBox(
                          width: 4,
                        ),
                        GestureDetector(
                          onTap: widget.onTap,
                          child: const Text('Register now',
                            style: TextStyle(
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    )

                ],
              ),
            ),
          ),
        )
    );
  }
}