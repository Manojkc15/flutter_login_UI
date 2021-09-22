import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _hideText = true;
  final _textEditControlEmail = TextEditingController();
  final _textEditControlPassword = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Form(
          key: _formKey,
          child: Center(
            child: Stack(
              children: [
                Image.asset(
                  'assets/peakpx.jpg',
                  fit: BoxFit.cover,
                  width: 450.0,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.lock_outline,
                      size: 150.0,
                      color: Colors.cyan,
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                      child: TextFormField(
                        cursorHeight: 25.0,
                        controller: _textEditControlEmail,
                        autocorrect: false,
                        autofocus: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return '*Please Enter your Email ';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.cyan, width: 1.75),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          hintText: 'EMAIL',
                          contentPadding: EdgeInsets.all(20.0),
                          suffixIcon: Icon(
                            Icons.email,
                            color: Colors.cyan,
                          ),
                        ),
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(
                          letterSpacing: 1.5,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 10.0),
                      child: TextFormField(
                        cursorHeight: 25.0,
                        controller: _textEditControlPassword,
                        autocorrect: false,
                        autofocus: false,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Incorrect Password! Try again';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.cyan, width: 1.75),
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(50.0),
                          ),
                          hintText: 'PASSWORD',
                          contentPadding: EdgeInsets.all(20.0),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _hideText ? Icons.vpn_key : Icons.remove_red_eye,
                              color: Colors.cyan,
                            ),
                            onPressed: () {
                              setState(() {
                                _hideText = !_hideText;
                              });
                            },
                          ),
                        ),
                        obscureText: _hideText,
                        style: TextStyle(
                          letterSpacing: 1.5,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 250.0),
                      child: InkWell(
                        child: Text(
                          'forgot password?',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.cyan[200],
                          ),
                        ),
                        onTap: () {},
                      ),
                    ),
                    SizedBox(height: 20.0),
                    Container(
                      height: 50.0,
                      width: 300.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Colors.cyan,
                        ),
                        onPressed: () {
                          FocusScope.of(context).unfocus();
                          final snackBar = SnackBar(
                            content: Text(
                              'Processing Data',
                              style: TextStyle(
                                fontSize: 18.0,
                                color: Colors.black,
                              ),
                            ),
                            backgroundColor: Colors.cyan,
                          );
                          if (_formKey.currentState!.validate()) {
                            ScaffoldMessenger.of(context).showSnackBar(snackBar);
                          }
                          _textEditControlEmail.clear();
                          _textEditControlPassword.clear();
                        },
                        child: Text(
                          'LOGIN',
                          style: TextStyle(
                            fontSize: 20.0,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

