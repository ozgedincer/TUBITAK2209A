import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:deneme_a/kayitekrani.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


enum MobileVerificationState{
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class verifyPhone extends StatefulWidget {
  const verifyPhone({Key? key}) : super(key: key);

  @override
  State<verifyPhone> createState() => _verifyPhoneState();
}

class _verifyPhoneState extends State<verifyPhone> {

  final GlobalKey<ScaffoldState>_scaffoldKey=GlobalKey();

  MobileVerificationState currentState =MobileVerificationState.SHOW_MOBILE_FORM_STATE;

  final phoneController=TextEditingController();
  final otpController=TextEditingController();

  FirebaseAuth _auth=FirebaseAuth.instance;

  String verificationId="";
  bool showLoading=false;

  getMobileFormWidget(context){
    return Column(
      children: [
        Spacer(),
        TextField(
          controller: phoneController,
          decoration: InputDecoration(
            hintText: "telefon numarası",
          ),
        ),
        SizedBox(height: 15,),
        ElevatedButton(onPressed: ()async {

          setState(() {
            showLoading=true;
          });
          await _auth.verifyPhoneNumber(
              phoneNumber: phoneController.text,
              verificationCompleted: (phoneAuthCredential) async{
                setState(() {
                  showLoading=false;
                });
                //signInWithPhoneAuthCredential(phoneAuthCredential);
              },
              verificationFailed: (verificationFailed)async{
                setState(() {
                  showLoading=false;
                });
                ScaffoldMessenger.of(currentState as BuildContext).showSnackBar(SnackBar(content: Text(verificationFailed.toString())));
              },
              codeSent: (verificationId,resendingToken)async{
                setState(() {
                  showLoading=false;
                  currentState=MobileVerificationState.SHOW_MOBILE_FORM_STATE;
                  this.verificationId=verificationId;
                });
          },
              codeAutoRetrievalTimeout: (verificationId)async{},
          );
        },
        child: Text("GÖNDER"),
        ),
        Spacer(),
      ],
    );
  }

  getOtpFormWidget(context){
    return Column(
      children: [
        Spacer(),
        TextField(
          controller: otpController,
          decoration: InputDecoration(
            hintText: "Doğrulama Kodu",
          ),
        ),
        SizedBox(height: 15,),
        ElevatedButton(onPressed: ()async{
          PhoneAuthCredential phoneAuthCredential=PhoneAuthProvider.credential(verificationId: verificationId, smsCode: otpController.text);
          signInWithPhoneAuthCredential(phoneAuthCredential);
        },
          child: Text("DOĞRULA"),
        ),
        Spacer(),
      ],
    );

  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        child: showLoading
            ? Center (child: CircularProgressIndicator(),)
            : currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE
            ? getMobileFormWidget(context)
            : getOtpFormWidget(context),
        padding: const EdgeInsets.all(15),
      )
    );
  }


  void signInWithPhoneAuthCredential(PhoneAuthCredential phoneAuthCredential)async{

    setState(() {
      showLoading=true;
    });
    try{
     final authCredential=await _auth.signInWithCredential(phoneAuthCredential);
     setState(() {
       showLoading=false;
     });
     if(authCredential?.user != null){
       Navigator.push(context, MaterialPageRoute(builder: (context)=>KayitEkrani()));
     }
   }on FirebaseAuthException catch(e){
      setState(() {
        showLoading=false;
      });
      ScaffoldMessenger.of(currentState as BuildContext).showSnackBar(SnackBar(content: Text(e.toString())));
   }
  }
}
