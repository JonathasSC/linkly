import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:linkly/auth.dart';

class Login extends StatefulWidget {
  // ignore: use_super_parameters
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool entrar = true;

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  final TextEditingController _nomeController = TextEditingController();

  final AuthService _authServ = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (entrar) ? const Color.fromRGBO(58, 109, 140, 1) : Colors.brown[900],
      // appBar: AppBar(
      //   centerTitle: true,
      //   backgroundColor: (entrar) ? Colors.red : Colors.deepOrangeAccent,
      //   title: Text(
      //     (entrar) ? "Tela de Login" : "Tela de Cadastro",
      //     style: const TextStyle(
      //       color: Colors.white,
      //       fontSize: 18,
      //       fontWeight: FontWeight.w500,
      //     ),
      //   ),
      // ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(60, 0, 60, 0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Icon(
                  (entrar)
                      ? Icons.account_circle_rounded
                      : Icons.account_circle_outlined,
                  color: const Color.fromRGBO(234, 216, 177, 1),
                  size: 110,
                ),
                const SizedBox(height: 20),
                Visibility(
                  visible: !entrar,
                  child: TextFormField(
                    controller: _nomeController,
                    validator: (String? value) {
                      if (value == null) {
                        return "O campo Nome precisa ser preenchido!";
                      } else if (value.length < 3) {
                        return "O campo Nome precisa ter o mínimo de 3 caracteres!";
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: "Nome",
                      fillColor: Colors.white,
                      filled: true,
                      hintStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w200,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w200,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: _emailController,
                  validator: (String? value) {
                    if (value == null) {
                      return "O campo E-mail precisa ser preenchido!";
                    } else if (value.length < 5) {
                      return "O campo E-mail precisa ter o mínimo de 5 caracteres!";
                    } else if (!value.contains("@")) {
                      return "O campo E-mail precisa ter o arroba ( @ )!";
                    } else if (!value.contains(".")) {
                      return "O campor E-mail precisa ter o ponto ( . )!";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "E-mail",
                    fillColor: const Color.fromRGBO(234, 216, 177, 1),
                    
                    filled: true,
                    hintStyle: const TextStyle(
                      color: Color.fromRGBO(0, 31, 63, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w200,
                  ),
                ),
                const SizedBox(height: 14),
                TextFormField(
                  controller: _senhaController,
                  validator: (String? value) {
                    if (value == null) {
                      return "O campo Senha precisa ser preenchido!";
                    } else if (value.length < 8) {
                      return "O campo Senha precisa ter o mínimo de 8 caracteres!";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    hintText: "Senha",
                    fillColor:const Color.fromRGBO(234, 216, 177, 1),
                    filled: true,
                    hintStyle: const TextStyle(
                      color: Color.fromRGBO(0, 31, 63, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w200,
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                Visibility(
                    visible: !entrar,
                    child: Column(
                      children: [
                        const SizedBox(height: 5),
                      ],
                    )),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  child: SizedBox(
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () {
                        botaoEntrar();
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              (entrar) ? const Color.fromRGBO(106, 154, 176, 1) : Colors.deepOrangeAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          )),
                      child: Text(
                        (entrar) ? "Entrar" : "Cadastrar",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      entrar = !entrar;
                    });
                  },
                  child: Text((entrar) ? "Cadastre-se" : "Entre",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  botaoEntrar() {
    String email = _emailController.text;
    String senha = _senhaController.text;
    String nome = _nomeController.text;

    if (_formKey.currentState!.validate()) {
      if(entrar) {
        print("Entrada validada!");
      }
      else{
        print("Cadastro validado!");
        print("${_emailController.text}");
        print("${_senhaController.text}");
        print("${_nomeController.text}");
        _authServ.cadUser(email: email, senha: senha, nome: nome);
      }
    } else {
      print("Formulário não funcionando!");
    }
  }
}
