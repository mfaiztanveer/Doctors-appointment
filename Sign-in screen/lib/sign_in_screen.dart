import 'package:flutter/material.dart';
import 'sign_in_button.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  String _password = '';
  bool _isPasswordVisible = false;
  bool _signInPressed = false; // Track if sign-in button has been pressed

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.blueGrey[50],
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Icon(
                    Icons.account_circle_outlined,
                    size: 80,
                    color: Colors.blue[800],
                  ),
                  SizedBox(height: 24),
                  Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Let\'s experience the joy of telecare Al.',
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 32),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        _buildTextField('Email:', Icons.email, false),
                        SizedBox(height: 16),
                        _buildTextField('Password:', Icons.lock, true),
                        SizedBox(height: 32),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              _signInPressed = true; // Set sign-in pressed to true
                            });
                            if (_formKey.currentState?.validate() ?? false) {
                              _formKey.currentState?.save();
                              // Handle sign-in logic here
                            }
                          },
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            elevation: 5,
                            backgroundColor: Colors.blue, // Change button color to blue
                            minimumSize: Size(double.infinity, 20), // Set button width to match text fields
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SignInButton(
                        icon: Icons.facebook,
                        onPressed: () {
                          // Handle Facebook login
                        },
                      ),
                      SizedBox(width: 16),
                      SignInButton(
                        icon: Icons.email,
                        onPressed: () {
                          // Handle Email login
                        },
                      ),
                      SizedBox(width: 16),
                      SignInButton(
                        icon: Icons.phone,
                        onPressed: () {
                          // Handle Phone login
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Handle sign up navigation
                        },
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: Colors.blue[800],
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 8),
                  GestureDetector(
                    onTap: () {
                      // Handle forgot password
                    },
                    child: Text(
                      'Forgot your password?',
                      style: TextStyle(
                        color: Colors.blue[800],
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign:TextAlign.center,
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

  Widget _buildTextField(String label, IconData icon, bool isPassword) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
          ),
          child: TextFormField(
            validator: (value) {
              if (_signInPressed && (value?.isEmpty ?? true)) {
                return isPassword ? 'Please enter your password' : 'Please enter your email';
              }
              return null;
            },
            onSaved: (value) => isPassword ? _password = value ?? '' : _email = value ?? '',
            obscureText: isPassword && !_isPasswordVisible,
            decoration: InputDecoration(
              hintText: isPassword ? 'Enter your password' : 'Enter your email',
              prefixIcon: Icon(
                icon,
                color: Colors.black,
              ),
              suffixIcon: isPassword
                  ? IconButton(
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Colors.black,
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              )
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Colors.red.shade900), // Set error border color to red
              ),
              focusedErrorBorder: OutlineInputBorder( // Define focused error border to handle focus state
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide(color: Colors.red.shade900),
              ),
              errorStyle: TextStyle(color: Colors.red.shade800, fontSize: 14,fontWeight: FontWeight.bold),
              errorMaxLines: 2,
            ),
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
