import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sikost/Screen/login.dart';

// void main() {
//   runApp(Profile());
// }

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final _formKey = GlobalKey<FormState>();
  bool isObsecureField = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 43, 50, 178),
                  Color.fromARGB(255, 20, 136, 204),
                  Colors.white,
                  Colors.white,
                  Colors.white,
                ],
              ),
            ),
          ),
          Center(
            child: ListView(children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Profil",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Stack(
                    children: [
                      Container(
                        height: 130,
                        width: 130,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 10,
                                  spreadRadius: 2,
                                  color: Colors.black.withOpacity(0.1))
                            ],
                            border: Border.all(width: 4, color: Colors.white),
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage(
                                  'img/foto.jpg',
                                ),
                                fit: BoxFit.cover)),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 4, color: Colors.white),
                              color: Colors.white),
                          child: Center(
                            child: IconButton(
                              iconSize: 20,
                              onPressed: () {
                                setState(() {
                                  SnackBar(content: Text("hai"));
                                });
                              },
                              icon: Icon(
                                Icons.edit,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(40),
                    child: Container(
                      // height: MediaQuery.of(context).size.height,
                      // width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(
                          const Radius.circular(10),
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromARGB(123, 0, 0, 0),
                            spreadRadius: 0,
                            blurRadius: 4,
                            offset: Offset(0, 2),
                          )
                        ],
                      ),
                      child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              buildTextForm("Nama", "Fagil Nuril Akbar", false),
                              buildTextForm(
                                  "Email", "fagilnuril18@gmail.com", false),
                              buildTextForm("No WA", "087855913391", false),
                              buildTextForm("Alamat", "Jember", false),
                              buildTextForm(
                                  "Kampus", "Politeknik Negeri Jember", false),
                              buildTextForm("Password", "********", true),
                              buildTextForm("New Password", "", true)
                            ],
                          )),
                    ),
                  ),
                  Container(
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                      content: Text("Berhasil Menyimpan")));
                            }
                          },
                          child: Text("Save"),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ElevatedButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => loginPage()));
                            },
                            child: Text("Keluar")),
                      ],
                    ),
                  )
                ],
              ),
            ]),
          )
        ],
      ),
    );
  }

  Widget buildTextForm(
    String label,
    String placeholder,
    bool isPassTextField,
  ) {
    return Padding(
      padding: EdgeInsets.only(bottom: 30),
      child: TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Field $label tidak boleh kosong";
            } else if (label == "email" || label == "Email") {
              return (value.contains("@")) ? null : "Masukkan email yang valid";
            }
            return null;
          },
          
          initialValue: placeholder,
          enabled: (label == "email" || label == "Email") ? false : true,
          obscureText: isPassTextField ? isObsecureField : false,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          decoration: InputDecoration(
              labelText: label,
              suffixIcon: isPassTextField
                  ?
                  // true
                  IconButton(
                      onPressed: () {
                        setState(() {
                          isObsecureField = !isObsecureField;
                        });
                      },
                      icon: Icon(
                        Icons.remove_red_eye,
                        color: Colors.grey,
                      ))
                  :
                  // false
                  null,
              contentPadding: EdgeInsets.only(bottom: 5),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              // hintText: placeholder,

              hintStyle: TextStyle(fontSize: 16, color: Colors.grey))),
    );
  }
}
