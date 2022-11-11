import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:new_project/UI/Screens/Character.dart';
import 'package:new_project/UI/Screens/bottomnavigation.dart';
import 'package:new_project/Data/Provider/data_length_provider.dart';
import 'package:new_project/Data/Provider/data_provider.dart';

class PhoneAuthForm extends StatefulWidget {
  PhoneAuthForm({Key? key}) : super(key: key);

  @override
  _PhoneAuthFormState createState() => _PhoneAuthFormState();
}

class _PhoneAuthFormState extends State<PhoneAuthForm> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController otpCode = TextEditingController();
  TextEditingController _codeController = TextEditingController();

  Signinanonymous() async {
    try {
      final userCredential = await FirebaseAuth.instance.signInAnonymously();
      print("Signed in with temporary account.");
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
      print(userCredential.toString());
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "operation-not-allowed":
          print("Anonymous auth hasn't been enabled for this project.");
          break;
        default:
          print("Unknown error.");
      }
    }
  }

  Future<void> phoneSignIn({required String phoneNumber}) async {
    _auth.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        verificationCompleted: _onVerificationCompleted,
        verificationFailed: _onVerificationFailed,
        codeSent: _onCodeSent,
        codeAutoRetrievalTimeout: _onCodeTimeout);
  }

  _onVerificationCompleted(PhoneAuthCredential authCredential) async {
    print("verification completed ${authCredential.smsCode}");
    User? user = FirebaseAuth.instance.currentUser;

    if (authCredential.smsCode != null) {
      try {
        UserCredential credential =
            await user!.linkWithCredential(authCredential);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'provider-already-linked') {
          await _auth.signInWithCredential(authCredential);
        }
      }
      setState(() {
        isLoading = false;
      });
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    }
  }

  _onVerificationFailed(FirebaseAuthException exception) {
    if (exception.code == 'invalid-phone-number') {
      showMessage("The phone number entered is invalid!");
    }
  }

  _onCodeSent(String verificationId, int? forceResendingToken) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => AlertDialog(
              title: Text("Enter SMS Code"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    controller: _codeController,
                  ),
                ],
              ),
              actions: <Widget>[
                OutlinedButton(
                  child: Text("Done"),
                  //   textColor: Colors.white,
                  // color: Colors.redAccent,
                  onPressed: () {
                    FirebaseAuth auth = FirebaseAuth.instance;

                    String smsCode = _codeController.text.trim();

                    PhoneAuthCredential _credential =
                        PhoneAuthProvider.credential(
                            verificationId: verificationId, smsCode: smsCode);
                    auth.signInWithCredential(_credential).then((result) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => BottomNav()));
                    }).catchError((e) {
                      print(e);
                    });
                  },
                )
              ],
            ));
    // this.verificationId = verificationId;
    // print(forceResendingToken);
    // print("code sent");
  }

  _onCodeTimeout(String timeout) {
    return null;
  }

  void showMessage(String errorMessage) {
    showDialog(
        context: context,
        builder: (BuildContext builderContext) {
          return AlertDialog(
            title: Text("Error"),
            content: Text(errorMessage),
            actions: [
              TextButton(
                child: Text("Ok"),
                onPressed: () async {
                  Navigator.of(builderContext).pop();
                },
              )
            ],
          );
        }).then((value) {
      setState(() {
        isLoading = false;
      });
    });
  }

  OutlineInputBorder border = OutlineInputBorder(
      borderSide: BorderSide(color: Colors.orange, width: 3.0));

  bool isLoading = false;

  String? verificationId;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text("Verify OTP"),
          backwardsCompatibility: false,
          systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Color.fromARGB(255, 243, 166, 33)),
        ),
        backgroundColor: Color.fromARGB(255, 204, 201, 196),
        body: Center(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: size.width * 0.8,
                  child: TextFormField(
                      keyboardType: TextInputType.phone,
                      controller: phoneNumber,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.orange, width: 2.0)),
                        hintText: '+251911570652',
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 10.0),
                      )),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Padding(padding: EdgeInsets.only(bottom: size.height * 0.05)),
                !isLoading
                    ? SizedBox(
                        width: size.width * 0.8,
                        child: OutlinedButton(
                          onPressed: () async {
                            //  FirebaseService service = new FirebaseService();
                            if (_formKey.currentState!.validate()) {
                              setState(() {
                                isLoading = true;
                              });
                              await phoneSignIn(phoneNumber: phoneNumber.text);
                            }
                          },
                          child: Text(' Send Code'),
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Color.fromARGB(255, 234, 232, 230)),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.orange.withOpacity(0.6)),
                              side: MaterialStateProperty.all<BorderSide>(
                                  BorderSide.none)),
                        ),
                      )
                    : CircularProgressIndicator(),
                Container(
                  child: Text(
                    'or',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.8,
                  child: OutlinedButton(
                    onPressed: () async {
                      //  FirebaseService service = new FirebaseService();
                      if (_formKey.currentState!.validate()) {
                        setState(() {
                          isLoading = true;
                        });
                        await Signinanonymous();
                      }
                    },
                    child: Text('Sign in Anonymous'),
                    style: ButtonStyle(
                        foregroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 234, 232, 230)),
                        backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.orange.withOpacity(0.6)),
                        side: MaterialStateProperty.all<BorderSide>(
                            BorderSide.none)),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
