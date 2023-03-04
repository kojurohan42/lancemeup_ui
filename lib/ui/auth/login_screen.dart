import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lanceme_up/ui/auth/forgot_password_screen.dart';
import 'package:lanceme_up/ui/auth/signup_screen.dart';
import 'package:lanceme_up/ui/home_page.dart';
import 'package:lanceme_up/utils/utils.dart';
import 'package:lanceme_up/widgets/round_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool loading = false;
  bool _isChecked = false;
  bool _passwordVisible = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadUserEmailPassword();
    _passwordVisible = false;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void login() {
    setState(() {
      loading = true;
    });
    _auth
        .signInWithEmailAndPassword(
            email: emailController.text,
            password: passwordController.text.toString())
        .then((value) {
      Utils().toastMessage(value.user!.email.toString());
      Navigator.push(
          context, MaterialPageRoute(builder: ((context) => const HomePage())));
      setState(() {
        loading = false;
      });
    }).onError((error, stackTrace) {
      debugPrint(error.toString());
      Utils().toastMessage(error.toString());
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        SystemNavigator.pop();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(98, 178, 70, 1),
          title: const Text(
            'Sign in',
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      'Welcome Back!',
                      style: TextStyle(
                          color: Color.fromRGBO(15, 14, 19, 1),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Text(
                    'Login to you account',
                    style: TextStyle(
                      color: Color.fromRGBO(136, 150, 171, 1),
                      fontSize: 16,
                    ),
                  ),
                  Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              'Email',
                              style: TextStyle(
                                color: Color.fromRGBO(15, 14, 19, 1),
                                fontSize: 16,
                              ),
                            ),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            controller: emailController,
                            decoration: const InputDecoration(
                              hintText: 'Enter Email',
                              prefixIcon: Icon(Icons.alternate_email),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter Email';
                              }
                              return null;
                            },
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              'Password',
                              style: TextStyle(
                                color: Color.fromRGBO(15, 14, 19, 1),
                                fontSize: 16,
                              ),
                            ),
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            controller: passwordController,
                            obscureText: !_passwordVisible,
                            decoration: InputDecoration(
                              hintText: 'Enter Password',
                              prefixIcon: const Icon(Icons.lock_open),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  // Based on passwordVisible state choose the icon
                                  _passwordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                  color: Theme.of(context).primaryColorDark,
                                ),
                                onPressed: () {
                                  // Update the state i.e. toogle the state of passwordVisible variable
                                  setState(() {
                                    _passwordVisible = !_passwordVisible;
                                  });
                                },
                              ),
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter Password';
                              }
                              return null;
                            },
                          ),
                        ],
                      )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                            SizedBox(
                                height: 24.0,
                                width: 24.0,
                                child: Theme(
                                  data: ThemeData(
                                      unselectedWidgetColor:
                                          const Color.fromRGBO(
                                              98, 178, 70, 1) // Your color
                                      ),
                                  child: Checkbox(
                                      activeColor:
                                          const Color.fromRGBO(98, 178, 70, 1),
                                      value: _isChecked,
                                      onChanged: _handleRemeberme),
                                )),
                            const SizedBox(width: 10.0),
                            const Text("Remember Me",
                                style: TextStyle(
                                    fontSize: 14, fontFamily: 'Urbanist'))
                          ])),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ForgotPassWordScreen()));
                        },
                        child: const Text('Forgot Password?'),
                      ),
                    ],
                  ),
                ],
              ),
              Column(
                children: [
                  RoundButton(
                    title: 'Login',
                    loading: loading,
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        login();
                      }
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't have an account?"),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SignUpScreen()));
                          },
                          child: const Text('Sign Up'))
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleRemeberme(bool? value) {
    _isChecked = value!;
    SharedPreferences.getInstance().then(
      (prefs) {
        prefs.setBool("remember_me", value);
        prefs.setString('email', emailController.text);
        prefs.setString('password', passwordController.text);
      },
    );
    setState(() {
      _isChecked = value;
    });
  }

  void _loadUserEmailPassword() async {
    try {
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      var _email = _prefs.getString("email") ?? "";
      var _password = _prefs.getString("password") ?? "";
      var _remeberMe = _prefs.getBool("remember_me") ?? false;
      if (_remeberMe) {
        setState(() {
          _isChecked = true;
        });
        emailController.text = _email;
        passwordController.text = _password;
      }
    } catch (e) {}
  }
}
