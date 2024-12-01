import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  // ignore: use_super_parameters
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool entrar = true;

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: (entrar) ? Colors.black : Colors.brown[900],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: (entrar) ? Colors.red : Colors.deepOrangeAccent,
        title: Text(
          (entrar) ? "Tela de Login" : "Tela de Cadastro",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Icon(
                  (entrar)
                      ? Icons.account_circle_rounded
                      : Icons.account_circle_outlined,
                  color: Colors.white,
                  size: 110,
                ),
                const SizedBox(height: 20),
                Visibility(
                  visible: !entrar,
                  child: TextFormField(
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
                const SizedBox(height: 20),
                TextFormField(
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
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                Visibility(
                    visible: !entrar,
                    child: Column(
                      children: [
                        const SizedBox(height: 5),
                        TextFormField(
                          validator: (String? value) {
                            if (value == null) {
                              return "O campo de confirmar senha precisa ser preenchido!";
                            } else if (value.length < 8) {
                              return "O campo de confirmar senha precisa ter o mínimo de 8 caracteres!";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            hintText: "Confirmar senha",
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
                          obscureText: true,
                        ),
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
                              (entrar) ? Colors.red : Colors.deepOrangeAccent,
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
    if (_formKey.currentState!.validate()) {
      print("Formulário funcionando!");
    } else {
      print("Formulário não funcionando!");
    }
  }
}
