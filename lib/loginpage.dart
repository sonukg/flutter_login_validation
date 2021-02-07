import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'input_dec.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
String name, email,phoneno;
TextEditingController password=TextEditingController();
TextEditingController confirmPassword=TextEditingController();
final GlobalKey<FormState> _formKey=GlobalKey<FormState>();
void showToast(String s) {
  Fluttertoast.showToast(
      msg: s,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.deepOrangeAccent,
      textColor: Colors.white
  );
}
@override
  void initState() {
    SystemChrome.setEnabledSystemUIOverlays([]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  child:Align(
                    alignment: Alignment.center,
                    child: Icon(Icons.person,
                      size: 90,
                      color: Colors.deepOrangeAccent,
                    ),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height/1.2,
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.only(top: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(bottom: 4,left: 16,right: 16),
                        child: TextFormField(
                          decoration:buildInputDecoration(Icons.person,"Name"),
                          keyboardType: TextInputType.text,
                          validator: (String value){
                            if(value.isEmpty){
                              return 'Please enter name';
                            }
                            return null;
                          },
                          onSaved: (String value){
                            name=value;
                          },
                        ),
                        ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 4,left: 16,right: 16),
                        child: TextFormField(
                          decoration: buildInputDecoration(Icons.email,"Email"),
                          keyboardType: TextInputType.text,
                          validator: (String value){
                            if(value.isEmpty){
                              return 'Please enter email';
                            }if(!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)){
                              return 'Please a valid Email';
                            }
                            return null;
                          },
                          onSaved: (String value){
                            email=value;
                          },
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 4,left: 16,right: 16),
                        child: TextFormField(
                          decoration: buildInputDecoration(Icons.phone, "Phon"
                              "e No"),
                          keyboardType: TextInputType.text,
                          validator: (String value){
                            if(value.isEmpty){
                              return 'Please enter phone no';
                            }
                            return null;
                          },
                          onSaved: (String value){
                            phoneno=value;
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            top: 4,left: 16, right: 16, bottom: 4
                        ),
                        child: TextFormField(
                          decoration: buildInputDecoration(Icons.vpn_key, "Pa"
                              "ssword"),
                          controller: password,
                          keyboardType: TextInputType.text,
                          validator: (String value){
                            if(value.isEmpty){
                              return 'Please enter password';
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            top: 4,left: 16, right: 16, bottom: 4
                        ),

                        child: TextFormField(
                          decoration: buildInputDecoration(Icons.lock, "Confirm"
                            " Password"),
                          keyboardType: TextInputType.text,
                          controller: confirmPassword,
                          validator: (String value){
                            if(value.isEmpty){
                              return 'Please enter re-enter password';
                            }
                            print(password.text);
                            print(confirmPassword.text);
                            if(password.text!=confirmPassword.text){
                              return 'Password does not match';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width/3,
                        child: Center(
                          child: RaisedButton(
                            color: Colors.deepOrangeAccent,
                            onPressed: (){
                              if(_formKey.currentState.validate())
                              {
                                showToast("Login is Successful");
                                return;
                              }else{
                                showToast("Login is Unsuccessful");
                              }
                            },
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50.0),
                                side: BorderSide(color: Colors.red,width: 0)
                            ),
                            textColor:Colors.white,child: Text("Submit"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        )
      ),
    );
  }
}