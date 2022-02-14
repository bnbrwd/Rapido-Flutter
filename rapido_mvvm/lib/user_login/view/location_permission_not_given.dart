import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'location_permission_given.dart';

class LocationPermissionNotGiven extends StatefulWidget {
  static const routeName = '/locationpermissionnotgiven';
  @override
  State<LocationPermissionNotGiven> createState() =>
      _LocationPermissionNotGivenState();
}

class _LocationPermissionNotGivenState
    extends State<LocationPermissionNotGiven> {
  final _cityFocusNode =
      FocusNode(); //used to jump to next input form by pressing nextButton from keypad.
  var size, height, width, statusBarHeight;

  var _formKey = GlobalKey<FormState>();

  void validate() {
    if (_formKey.currentState.validate()) {
      // Navigator.of(context).pushNamed(OnboardingScreen.routeName);
      print('validated');
    } else {
      print('Not Validated');
    }
  }

  // used node to be sure that clear up that memory, free up memory that they have occupied.
  @override
  void dispose() {
    _cityFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    statusBarHeight = MediaQuery.of(context).viewPadding.top;
    // getting the size of the window
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    Widget _getiOSFormForName() {
      return Container(
        child: CupertinoTextFormFieldRow(
          // prefix: Text('Hello'),
          padding: EdgeInsets.only(
            left: width * 0.005,
            right: width * 0.005,
          ),
          // decoration: BoxDecoration(
          //   border: Border.all(),
          //   borderRadius: BorderRadius.circular(5),
          // ),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 1, color: Colors.black54)),
            // borderRadius: BorderRadius.circular(5),
          ),
          textInputAction: TextInputAction.done,
          onFieldSubmitted: (_) {
            FocusScope.of(context).requestFocus(_cityFocusNode);
            //jump to next form from title for focus when we click next from kaypad. i.e price form field
          },
          validator: (value) {
            if (value.isEmpty) {
              return 'Required';
            }
            if (value.startsWith(RegExp(r'[A-Z][a-z]'))) {
              return null;
            }
            if (value.startsWith(RegExp(r'[0-9]'))) {
              return 'please enter valid name';
            } else {
              return null;
            }
          },
        ),
      );
    }

    Widget _getiOSForm() {
      return Container(
        child: CupertinoTextFormFieldRow(
          // prefix: Text('Hello'),
          padding: EdgeInsets.only(
            left: width * 0.005,
            right: width * 0.005,
          ),

          // decoration: BoxDecoration(
          //   border: Border.all(),
          //   borderRadius: BorderRadius.circular(5),
          // ),
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 1, color: Colors.black54)),
            // borderRadius: BorderRadius.circular(5),
          ),

          // textInputAction: TextInputAction.done,
          // onFieldSubmitted: (_) {
          //   FocusScope.of(context).requestFocus(_cityFocusNode);
          //   //jump to next form from title for focus when we click next from kaypad. i.e price form field
          // },
          validator: (value) {
            if (value.isEmpty) {
              return 'Required';
            }
            if (value.startsWith(RegExp(r'[A-Z][a-z]'))) {
              return null;
            }
            if (value.startsWith(RegExp(r'[0-9]'))) {
              return 'select a valid city';
            } else {
              return null;
            }
          },
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(
            left: width * 0.044,
            right: width * 0.044,
            top: height * 0.056,
          ),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      // child: GestureDetector(
                      //   child: Image.asset('assets/image/eclipse.png'),
                      //   onTap: () {},
                      // ),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              child: Image.asset('assets/image/eclipse.png'),
                              onTap: () {},
                            ),
                          ),
                          Platform.isIOS
                              ? Positioned(
                                  top: height * 0.015,
                                  left: width * 0.036,
                                  child: GestureDetector(
                                    child:
                                        Image.asset('assets/image/Vector.png'),
                                    onTap: () {
                                      Navigator.of(context).pushNamed(
                                          LocationPermissionGiven.routeName);
                                    },
                                  ),
                                )
                              : Positioned(
                                  top: height * 0.02,
                                  left: width * 0.04,
                                  child: GestureDetector(
                                    child:
                                        Image.asset('assets/image/Vector.png'),
                                    onTap: () {
                                      Navigator.of(context).pushNamed(
                                          LocationPermissionGiven.routeName);
                                    },
                                  ),
                                ),
                        ],
                      ),
                    ),
                    Container(
                      // child: GestureDetector(
                      //   child: Image.asset('assets/image/eclipse.png'),
                      //   onTap: () {},
                      // ),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              child: Image.asset('assets/image/eclipse.png'),
                              onTap: () {},
                            ),
                          ),
                          Platform.isIOS
                              ? Positioned(
                                  top: height * 0.012,
                                  left: width * 0.035,
                                  child: GestureDetector(
                                    child: Image.asset(
                                      'assets/image/drawer.png',
                                      height: height * 0.023,
                                      width: width * 0.051,
                                    ),
                                    onTap: () {},
                                  ),
                                )
                              : Positioned(
                                  top: height * 0.02,
                                  left: width * 0.04,
                                  child: GestureDetector(
                                    child: Image.asset(
                                      'assets/image/drawer.png',
                                      height: height * 0.023,
                                      width: width * 0.051,
                                    ),
                                    onTap: () {},
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: height * (24 / 640)),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Let\'s get to know',
                    style: TextStyle(
                      color: Color.fromRGBO(32, 33, 34, 1),
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.0375),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'What\'s your name',
                    style: TextStyle(
                      color: Color.fromRGBO(32, 33, 34, 1),
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.012),
                // TextFormField(
                //   // onChanged: (_) => _checkValidation(),
                //   // controller: _textEditController,
                //   // maxLength: 10,
                //   decoration: InputDecoration(
                //     // labelText: 'Phone number',
                //     border: OutlineInputBorder(),
                //   ),
                //   keyboardType: TextInputType.name,
                // ),
                Platform.isIOS
                    ? _getiOSFormForName()
                    : TextFormField(
                        // maxLength: 10,
                        decoration: InputDecoration(
                          counter: SizedBox.shrink(),
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        onFieldSubmitted: (_) {
                          FocusScope.of(context).requestFocus(_cityFocusNode);
                          //jump to next form from title for focus when we click next from kaypad. i.e price form field
                        },
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Required';
                          }
                          if (value.startsWith(RegExp(r'[A-Z][a-z]'))) {
                            return null;
                          }
                          if (value.startsWith(RegExp(r'[0-9]'))) {
                            return 'please enter valid name';
                          } else {
                            return null;
                          }
                        },
                      ),
                SizedBox(height: height * 0.025),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'What\'s your city',
                    style: TextStyle(
                      color: Color.fromRGBO(32, 33, 34, 1),
                      fontSize: 16,
                    ),
                  ),
                ),
                SizedBox(height: height * 0.012),
                // TextFormField(
                //   // onChanged: (_) => _checkValidation(),
                //   // controller: _textEditController,
                //   // maxLength: 10,
                //   decoration: InputDecoration(
                //     // labelText: 'Phone number',
                //     border: OutlineInputBorder(),
                //   ),
                //   keyboardType: TextInputType.name,
                // ),
                Platform.isIOS
                    ? _getiOSForm()
                    : TextFormField(
                        // maxLength: 10,
                        decoration: InputDecoration(
                          counter: SizedBox.shrink(),
                          border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.name,
                        textInputAction: TextInputAction.next,
                        focusNode: _cityFocusNode, //focus register
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Required';
                          }
                          if (value.startsWith(RegExp(r'[A-Z][a-z]'))) {
                            return null;
                          }
                          if (value.startsWith(RegExp(r'[0-9]'))) {
                            return 'select a valid city';
                          } else {
                            return null;
                          }
                        },
                      ),
                SizedBox(height: height * (31 / 640)),
                SizedBox(
                  width: double.infinity,
                  height: height * (48 / 640),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                        Color.fromRGBO(249, 216, 21, 1),
                      ),
                      foregroundColor: MaterialStateProperty.all(
                          Color.fromRGBO(32, 33, 34, 1)),
                    ),
                    child: Text(
                      'Next',
                      style: TextStyle(fontSize: 16),
                    ),
                    onPressed: () {
                      validate();
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
