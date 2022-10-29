import 'package:flutter/cupertino.dart';
import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/form/NXFormInput.dart';

class MyProfile extends StatefulWidget {
  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(169, 26, 25, 1),
      body: Column(
        children: [
          Container(
              width: double.infinity,
              height: 73,
              color: Colors.transparent,
              child: Stack(alignment: Alignment.center, children: [
                Positioned(
                    right: 0,
                    top: 38,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        width: 100,
                        child: Positioned(
                          child: Row(
                            children: [
                              SizedBox(
                                width: 60,
                              ),
                              Icon(
                                Icons.close,
                                size: 28,
                                color: Colors.white.withOpacity(0.95),
                              )
                            ],
                          ),
                        ),
                      ),
                    )),
                Positioned(
                  top: 44,
                  child: Text("My profile",
                      style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                )
              ])),
          Expanded(
            child: Container(
                color: Colors.white,
                child: CustomScrollView(
                  slivers: [
                    SliverFillRemaining(
                      child: Column(
                        children: [
                          Container(
                            height: 50,
                            color: Color.fromRGBO(139, 0, 8, 1),
                            child: Row(
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isLogin = true;
                                      });
                                    },
                                    child: Container(
                                      child: Center(
                                        child: Text(
                                          "Log in",
                                          style: GoogleFonts.roboto(
                                              fontWeight: FontWeight.w500,
                                              color: isLogin == false
                                                  ? Colors.white
                                                  : Colors.black),
                                        ),
                                      ),
                                      decoration: BoxDecoration(
                                          color: isLogin == false
                                              ? Color.fromRGBO(139, 0, 8, 1)
                                              : Colors.white,
                                          borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(5),
                                          )),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isLogin = false;
                                      });
                                    },
                                    child: Container(
                                      child: Center(
                                        child: Text(
                                          "New Account",
                                          style: GoogleFonts.roboto(
                                              fontWeight: FontWeight.w500,
                                              color: isLogin == true
                                                  ? Colors.white
                                                  : Colors.black),
                                        ),
                                      ),
                                      color: isLogin == true
                                          ? Color.fromRGBO(139, 0, 8, 1)
                                          : Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                          isLogin == true ? LoginForm() :SignUpPage()
                        ],
                      ),
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({
    Key key,
  }) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

    TextEditingController email;
    TextEditingController password;

    bool shouldAllowLogin = false;



    @override
  void initState() {
    super.initState();

    email = TextEditingController();
    password = TextEditingController();


    email.addListener(() { 
      //todo validate email"
      if(email.text.contains("@")){
        setState(() {
          shouldAllowLogin = true;
        });
        print("should allow");
      }else{
        setState(() {
          shouldAllowLogin = false;
        });
      }
      print(email.text);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          NXFormInputComponent(
            label: "Email",
            controller: email,
            tip: "",
            validator: (String val) {
              if (val.length <= 5) {
                return "Please enter a valid email";
              }
              return null;
            },
          ),
          SizedBox(
            height: 10,
          ),
          NXFormInputComponent(
            label: "Password",
            controller: password,
            tip: "",
            validator: (String val) {
              if (val.length <= 5) {
                return "Please enter a valid password";
              }
              return null;
            },
          ),
          SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: (){

              if(shouldAllowLogin){

                showCupertinoDialog(context: context, builder: (ctx)=> CupertinoAlertDialog(
                  content: FutureBuilder(
                    future: Future.delayed(Duration(seconds: 1)),
                    builder: ((context, snapshot) {
                      
                      if(snapshot.connectionState == ConnectionState.done){
                        return Container(
                          child: Column(
                            children: [
                              Text("Log in",
                              style: GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                              ),
                              ),
                              SizedBox(height: 7,),
                              Text("Tickets already purchased on this device will now be transferred to your account. Continue?",
                              style: GoogleFonts.roboto(
                              ),
                              )
                            ],
                          ),
                        );
                      }

                      return Container(child: Center(child: CupertinoActivityIndicator()));                      
                    }),
                  ),

                  actions: [
                    CupertinoButton(onPressed: (){
                      Navigator.pop(context);
                    }, child: Text("Cancel",
                    style: GoogleFonts.roboto(
                      color: Color.fromRGBO(112, 26, 25, 1)
                    ),
                    )),

                    CupertinoButton(
                    
                      onPressed: (){
                      Navigator.pop(context);
                      
                    }, child: Text("OK",
                    style: GoogleFonts.roboto(
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                    ),
                    ),
                    
                    )
                  

                  ],
                ));

              }

            },
            child: Container(
              child: Center(
                child: Text("Log in",
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500
                ),
                ),
              ),
              margin: EdgeInsets.only(left: 20, right: 20),
              height: 50,
              decoration: BoxDecoration(
                color: shouldAllowLogin == false ? Color.fromRGBO(107, 107, 107, 1):Color.fromRGBO(188, 156, 107, 1),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
          
                ]
              ),
            ),
          ),
          SizedBox(height: 30,),
          Container(
            child: Center(
              child: Text("Forgot my password",
              style: GoogleFonts.roboto(
                fontWeight: FontWeight.bold,
                fontSize: 17
              ),
              ),
            ),
          )
        ],
      ),
    );
  }
}



class SignUpPage extends StatelessWidget {
  const SignUpPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          NXFormInputComponent(
            label: "Email",
            tip: "",
            validator: (String val) {
              if (val.length <= 5) {
                return "Please enter a valid email";
              }
              return null;
            },
          ),
          SizedBox(
            height: 10,
          ),
          NXFormInputComponent(
            label: "New Password",
            tip: "Passwords should be at least 8 characters long and include a number, a lowercase and an uppercase letter.",
            validator: (String val) {
              if (val.length <= 5) {
                return "Please enter a valid password";
              }
              return null;
            },
          ),
           SizedBox(
            height: 10,
          ),
          NXFormInputComponent(
            label: "Confirm new password",
            tip: "",
            validator: (String val) {
              if (val.length <= 5) {
                return "Please enter a valid password";
              }
              return null;
            },
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            child: Center(
              child: Text("Create new account",
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500
              ),
              ),
            ),
            margin: EdgeInsets.only(left: 20, right: 20),
            height: 50,
            decoration: BoxDecoration(
              color: Color.fromRGBO(107, 107, 107, 1),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [

              ]
            ),
          ),
         
        ],
      ),
    );
  }
}
