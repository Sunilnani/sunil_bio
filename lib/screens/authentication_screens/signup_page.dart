import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sunil_bio/components/colors.dart';
import 'package:sunil_bio/components/custom_text_form_field.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

String  p = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";

RegExp reg = RegExp(p);

class _SignUpPageState extends State<SignUpPage> {

  final _formKey = GlobalKey<FormState>();

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();


  late String email;
  late String password;

void validation()async{
  //final FormData _form = _formKey.currentState;
  final _formKey = GlobalKey<FormState>();
  if (!_formKey.currentState!.validate()){
    try{
      UserCredential result = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      print(result.user!.uid);
    } on PlatformException catch(e){
      print(e.message.toString());
    }
  }
  else {
    print("No");
  }

}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundGreyColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [

                const SizedBox(height: 100,),
                const Text("SignUp",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
                const SizedBox(height: 60,),

                Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,

                    children: [


                      AppTextFormField(


                        title: "UserName",
                        // inputFormatters: [
                        //   LengthLimitingTextInputFormatter(10),
                        // ],
                        // readOnly: true,
                        hintText:  'UserName',
                       // controller: _passwordController,
                        textInputType: TextInputType.text,

                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Please enter username";
                          }
                          return null;
                        },

                      ),



                      AppTextFormField(
                        onChanged: (value){
                          setState(() {
                            email = value;
                            print(email);
                          });

                        },

                        title: "Email Address",
                        // readOnly: true,
                        hintText:  'Email',
                        textInputType: TextInputType.emailAddress,
                        controller: _usernameController,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Please enter Email Address";
                          }
                          else if(!reg.hasMatch(value)) {
                            return "email is invalid";
                          }
                          return "";
                        },
                      ),

                      SizedBox(height: 10,),



                      Container(
                        decoration: BoxDecoration(
                          color: CustomColors.cardBgColor,
                          borderRadius:  BorderRadius.circular(8),
                        ),
                        child: TextFormField(
                          onChanged: (value){
                            setState(() {
                              password = value;
                              print(password);
                            });
                          },
                          controller: _passwordController,
                          style: TextStyle(fontWeight: FontWeight.w600,fontSize: 14),
                          //inputFormatters: inputFormatters ?? [],
                          validator: (String? value) {
                            if (value!.isEmpty) {
                              return "Please enter password";
                            }
                            else if (value.length <8){
                              return "password is too short";
                            }
                            return "";
                          },
                          keyboardType:  TextInputType.text,
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: (){
                                FocusScope.of(context).unfocus();
                              },
                              child: Icon(Icons.visibility),
                            ),
                            hintStyle: TextStyle(fontSize: 14,color: CustomColors.textDarkColor),
                            labelText:"Password",
                            labelStyle: TextStyle(fontSize: 12,color: CustomColors.textLightColor),
                            hintText:  "password",
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.fromLTRB(20, 10, 24, 10),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),


                      AppTextFormField(
                        title: "Phone Number",
                        // readOnly: true,
                        hintText:  'Phone Number',
                        textInputType: TextInputType.emailAddress,
                        //controller: _usernameController,
                        validator: (String? value) {
                          if (value!.isEmpty) {
                            return "Please enter Email Address";
                          }
                          else if (value.length < 10){
                            return "phone number must be 10 letters";
                          }
                          return "";
                        },
                      ),




                      SizedBox(height: 60,),

                      ElevatedButton(
                        onPressed: (){

                          validation();
                        },
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
                        child: const SizedBox(
                            width: double.infinity,
                            child: Text(
                              'SignUp',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500),
                              textAlign: TextAlign.center,
                            )),
                      ),



                    ],
                  ),
                ),


                SizedBox(height: 16.0),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
