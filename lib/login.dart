import 'package:flutter/material.dart';

import 'home.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  //captura de los inputs
  final user = TextEditingController();
  final pwd = TextEditingController();
  bool bandError = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body:Stack( //muchos widwets
        children: [
          Padding(
              padding:  EdgeInsets.only(left: (size.width * 0.1), top: (size.width * 0.1), right: (size.width * 0.1), bottom: (size.width * 0.1)),
            child: Column(
              children: [
                Text(
                  'LOGIN',
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 30,
                  ),
                ),
                TextFormField(
                  controller: user,
                  obscureText: false, //de contraseña
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.2),
                        borderSide: const BorderSide(
                          width: 1,
                          style: BorderStyle.none,
                        )
                    ),
                    filled: true,
                    fillColor: Colors.grey,
                    labelText: 'Usuario o correo electronico',
                    prefixIcon: const Icon(Icons.person, color: Colors.white,),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                TextFormField(
                  controller: pwd,
                  obscureText: true, //de contraseña
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.2),
                        borderSide: const BorderSide(
                          width: 1,
                          style: BorderStyle.none,
                        )
                    ),
                    filled: true,
                    fillColor: Colors.grey,
                    labelText: 'Contraseña',
                    prefixIcon: const Icon(Icons.person, color: Colors.white,),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                ElevatedButton(
                    onPressed: (){
                      setState(() {
                        print('USER: ${user.text}');
                        print('PASSWORD: ${pwd.text}');

                        if(user.text == 'admin' && pwd.text == '123'){
                          bandError = false;
                          Navigator.of(context).push(
                            MaterialPageRoute(builder: (context)=>Home()));
                        }else{
                          bandError = true;
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.cyan,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      fixedSize: Size(
                        size.width * 0.6, 40
                      ),
                    ),
                    child: const Text('INGRESAR', style: TextStyle(
                        color: Colors.white,
                      ),
                    )
                ),
                bandError ? Text(
                  'Usuario y/o contraseña incorrectos',
                  style: TextStyle(color:Colors.red),
                )  : Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
