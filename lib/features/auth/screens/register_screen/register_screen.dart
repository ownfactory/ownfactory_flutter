import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ownfactory_flutter/features/auth/screens/register_screen/register_screen_wm.dart';
import 'package:ownfactory_flutter/ui/res/assets.dart';

class RegisterScreen extends ElementaryWidget<RegisterScreenWM> {
  const RegisterScreen({
    Key? key,
    WidgetModelFactory wmFactory = createRegisterScreenWM,
  }) : super(wmFactory, key: key);

  @override
  Widget build(RegisterScreenWM wm) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 64),
                SvgPicture.asset(
                  AssetsIcons.icEcoFactory,
                  height: 100,
                  color: Colors.indigo,
                ),
                const SizedBox(height: 64),
                TextFormField(
                  controller: wm.emailTextController,
                  decoration: const InputDecoration(hintText: 'Email'),
                  autofillHints: const [AutofillHints.email],
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 32),
                TextFormField(
                  controller: wm.passwordTextController,
                  decoration: const InputDecoration(hintText: 'Password'),
                  keyboardType: TextInputType.visiblePassword,
                  autofillHints: const [AutofillHints.password],
                  obscureText: true,
                ),
                const SizedBox(height: 64),
                SizedBox(
                  width: double.infinity,
                  child: StateNotifierBuilder<bool>(
                    listenableState: wm.loadingState,
                    builder: (context, isLoading) {
                      return ElevatedButton(
                        onPressed: wm.sendData,
                        child: isLoading ?? true ? const CircularProgressIndicator() : const Text('Registration'),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 64),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
