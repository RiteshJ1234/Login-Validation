import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/provider/signup_provider.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});
  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.blue[50],
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Signup",
                style: TextStyle(
                    color: Colors.blue[300],
                    fontSize: 40,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: context
                    .watch<SignupProvider>()
                    .userNameTextEditingController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  hintText: "Enter Username",
                  label: const Text("Enter Username"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  prefixIcon: const Icon(
                    Icons.person,
                  ),
                ),
                validator: (value) =>
                    context.read<SignupProvider>().userNameValidator(value),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller:
                    context.watch<SignupProvider>().emailTextEditingController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  hintText: "Enter email",
                  label: const Text("Enter email"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  prefixIcon: const Icon(
                    Icons.email,
                  ),
                ),
                validator: (value) =>
                    context.read<SignupProvider>().emailValidator(value),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: context
                    .watch<SignupProvider>()
                    .passwordTextEditingController,
                obscureText: context.watch<SignupProvider>().passwordFlag,
                obscuringCharacter: "*",
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  hintText: "Enter password",
                  label: const Text("Enter password"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  prefixIcon: const Icon(
                    Icons.lock,
                  ),
                  suffixIcon: IconButton(
                    onPressed: context.read<SignupProvider>().setPasswordFlag,
                    icon: Icon((context.watch<SignupProvider>().passwordFlag)
                        ? Icons.visibility_off_rounded
                        : Icons.visibility_rounded),
                  ),
                ),
                validator: (value) =>
                    context.read<SignupProvider>().passwordValidator(value),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: context
                    .watch<SignupProvider>()
                    .confirmPasswordTextEditingController,
                obscureText: context.watch<SignupProvider>().confirmFlag,
                obscuringCharacter: "*",
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  hintText: "Confirm password",
                  label: const Text("Confirm password"),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  prefixIcon: const Icon(
                    Icons.lock,
                  ),
                  suffixIcon: IconButton(
                    onPressed: context.read<SignupProvider>().setConfirmFlag,
                    icon: Icon((context.watch<SignupProvider>().confirmFlag)
                        ? Icons.visibility_off_rounded
                        : Icons.visibility_rounded),
                  ),
                ),
                validator: (value) => context
                    .read<SignupProvider>()
                    .confirmPasswordValidator(value),
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: SizedBox(
                  width: 300,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      bool isValidate = formKey.currentState!.validate();
                      if (isValidate) {
                        Navigator.pop(context);
                        context.read<SignupProvider>().clearTextController();
                      }
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            WidgetStatePropertyAll(Colors.blue[200])),
                    child: const Text(
                      "Signup",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "lib/assets/google.png",
                        height: 35,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "lib/assets/facebook1.png",
                        height: 35,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        "lib/assets/instagram.png",
                        height: 40,
                      ),
                    ),
                  ),
                ],
              ),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Already have an account?",
                    textAlign: TextAlign.center,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
