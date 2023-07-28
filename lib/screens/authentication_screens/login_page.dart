import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sunil_bio/components/colors.dart';
import 'package:sunil_bio/components/custom_text_form_field.dart';
import 'package:sunil_bio/components/navigation_service.dart';
import 'package:sunil_bio/main.dart';
import 'package:sunil_bio/screens/authentication_screens/signup_page.dart';
import 'package:sunil_bio/screens/dash_board_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  Future<void> storeCredentials(String username, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('username', username);
    prefs.setString('password', password);
  }

  Future<bool> checkCredentials(String username, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? storedUsername = prefs.getString('username');
    String? storedPassword = prefs.getString('password');
    if (username == storedUsername && password == storedPassword) {
      return true;
    }
    return false;
  }


  Future<Firebase> _initializeFirebase() async{
    Firebase firebase= (await Firebase.initializeApp()) as Firebase;
    return firebase;
  }

  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final bool _isLoading = false;

  // static Future<User?> _login({required String email, required String password, required BuildContext context})async{
  //   FirebaseAuth auth = FirebaseAuth.instance;
  //   User? user;
  //   try{
  //     UserCredential userCredentials = await auth.signInWithEmailAndPassword(email: email, password: password);
  //     user = userCredentials.user;
  //   } on FirebaseAuthException catch(e){
  //     if(e.code == "user-not-found"){
  //       print("no user found for that email");
  //     }
  //   }
  //   return user;
  // }

  Future<void> submitData(String username, String password) async {
    username = _usernameController.text.trim().toString();
    password = _passwordController.text.trim().toString();
   // await Supabase.instance.client.from("users").insert({
   //   "username": username,
   //   "password": password
   // });
    await Supabase.instance.client.from("notes").insert({
      "body": username,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundGreyColor,
        body: FutureBuilder(
          future: _initializeFirebase(),
          builder: (context, snapshot){
            if(snapshot.connectionState == ConnectionState.done){
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "LoginPage",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          //ThemeConfig.defaultSizedBox,
                          // Text("User Name",style: ThemeConfig.Medium14,),

                          AppTextFormField(
                            title: "Email Address",
                            // readOnly: true,
                            hintText: 'Email',
                            textInputType: TextInputType.emailAddress,
                            controller: _usernameController,
                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return "Please enter Email Address";
                              }
                              return null;
                            },
                          ),

                          AppTextFormField(
                            title: "Password",
                            // inputFormatters: [
                            //   LengthLimitingTextInputFormatter(10),
                            // ],
                            // readOnly: true,
                            hintText: 'Password',
                            controller: _passwordController,
                            textInputType: TextInputType.text,

                            validator: (String? value) {
                              if (value!.isEmpty) {
                                return "Please enter phone number";
                              }
                              return null;
                            },
                          ),

                          SizedBox(
                            height: 20,
                          ),
                          // SubmitButton(
                          //   title: "Submit",
                          //   height: 42,
                          // )
                        ],
                      ),
                    ),


                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Forgot your password?",style: CustomColors.Medium12textLightColor,),

                      ],
                    ),



                    SizedBox(height: 50.0),
                    _isLoading
                        ? const CircularProgressIndicator()
                        : ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: CustomColors.textLightColor,
                              // background color
                              foregroundColor: Colors.white,
                              // foreground color
                              elevation: 5,
                              // elevation
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    10.0), // rounded corners
                              ),
                            ),
                            onPressed: () async {

                              submitData(_usernameController.text.trim().toString(),
                                  _passwordController.text.trim().toString()
                              );
                              NavigationService().navigatePage(DashBoardPage());
                              // User? user = await _login(
                              //     email: _usernameController.text,
                              //     password: _passwordController.text,
                              //     context: context);
                              // print(user);
                              // if (user != null) {
                              //   Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             const DashBoardPage()),
                              //   );
                              //}
                            },
                            child: const SizedBox(
                                width: double.infinity,
                                child: Text(
                                  'Login',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),
                                  textAlign: TextAlign.center,
                                )),
                          ),
                    SizedBox(height: 20,),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an Account?",style: CustomColors.Medium12textLightColor,),
                        SizedBox(width: 10,),
                        InkWell(
                          onTap: (){
                           // Navigator.push(context, MaterialPageRoute(builder: (context) => SignUpPage()));

                            NavigationService().navigatePage(SignUpPage());

                          },
                            child: Text("SignUp",style: CustomColors.Medium14textDarkColor,))
                      ],
                    )
                  ],
                ),
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );

          },

        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(context: context,
              builder: ((context)  {
                return SimpleDialog(
                  children: [
                    TextFormField(
                      onFieldSubmitted: (value) async {
                        await Supabase.instance.client.from("notes").insert({
                          "body": value,
                        });

                      },
                    )
                  ]
                );
              })
          );
        },
        child: Icon(Icons.add),
      ),
    );

  }
}