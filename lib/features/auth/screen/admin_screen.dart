import 'package:flutter/material.dart';
// import 'package:honestpol/common_widgets/custom_button.dart';
import 'package:honestpol/common_widgets/custom_tfields.dart';
import 'package:honestpol/features/auth/service/auth_service.dart';

class AdminScreen extends StatefulWidget {
  static const String routeName = '/admin';
  const AdminScreen({super.key});

  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {

  final AuthService authService = AuthService();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController collegeController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final GlobalKey _authKey = GlobalKey<FormState>();

  bool rememberme = false;
  int _formfield = 0;


  @override
  void dispose() {
    emailController.dispose();
    collegeController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              height: 200,
              width: 300,
              fit: BoxFit.cover,
              'assets/images/vote.png'
            ),
            const Text(
              'Welcome Back',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const Text(
              'Discover The Power Of Your Vote',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 10,),
            if(_formfield==0)...[
              Form(
              key: _authKey,
              child: Column(
                children: [
                  CustomTextfield(
                    controller: nameController, 
                    hintext: 'Full-Name',
                    icondata: Icons.format_color_text_sharp,
                    ),
                  CustomTextfield(
                    controller: emailController, 
                    hintext: 'E-Mail',
                    icondata: Icons.mail,
                    ),
                  const SizedBox(height: 10,),
                  CustomTextfield(
                    controller: collegeController, 
                    hintext: 'College-Id',
                    icondata: Icons.house,
                    ),
                  const SizedBox(height: 10,),
                  CustomTextfield(
                    controller: passwordController, 
                    hintext: 'Password',
                    icondata: Icons.password,
                    ),
                  const SizedBox(height: 10,),
                ],
              )),
              SizedBox(
                height: 52,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){
                    if(emailController.text.isNotEmpty && 
                      passwordController.text.isNotEmpty && 
                      collegeController.text.isNotEmpty &&
                      nameController.text.isNotEmpty
                      ){
                        authService.CreateUser(
                        context: context, 
                        email: emailController.text, 
                        password: passwordController.text, 
                        cid: collegeController.text,
                        name: nameController.text
                        );
                    }
                  }, 
                  child: const Text('Press To Create Account')),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox(
                        value: rememberme, 
                        onChanged: (value){
                          setState(() {
                            rememberme = value!;
                          });
                        }),
                        const SizedBox(width: 10,),
                        const Text(
                          'Remember Me',
                          style: TextStyle(
                            color: Colors.black
                          ),
                          )
                    ],
                  ),
                  const Text(
                    'Forgot Password?',
                    style: TextStyle(
                      color: Colors.grey,
                      decoration: TextDecoration.underline
                    ),
                    )
                ],
              )
            ],
            if(_formfield==1)...[
              Form(
                key: _authKey,
                child: Column(
                  children: [
                    const SizedBox(height: 10,),
                    CustomTextfield(
                      controller: emailController, 
                      hintext: 'College-Id/Email-Id',
                      icondata: Icons.house,
                      ),
                    const SizedBox(height: 10,),
                    CustomTextfield(
                      controller: passwordController, 
                      hintext: 'Password',
                      icondata: Icons.password,
                      ),
                    const SizedBox(height: 10,),
                  ],
                )),
                SizedBox(
                height: 52,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (){
                    if( emailController.text.isNotEmpty  && 
                    passwordController.text.isNotEmpty){
                      authService.loginUser(
                        context: context, 
                        username: emailController.text, 
                        password: passwordController.text);
                    }
                  }, 
                  child: const Text('Press To Log In')),
              ),
            ],
            const SizedBox(height: 20,),
            InkWell(
              onTap: () {
                setState(() {
                  _formfield=0;
                });
              },
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Create Account',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                    Icon(Icons.arrow_forward)
                ],
              ),
            ),
            const SizedBox(height: 10,),
            InkWell(
              onTap: () {
                setState(() {
                    _formfield=1;
                });
              },
              child: const  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                    Icon(Icons.arrow_forward)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}