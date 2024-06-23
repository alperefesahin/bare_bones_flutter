import 'package:bare_bones_flutter/core/design_system/components/bare_bones_loading_indicator.dart';
import 'package:bare_bones_flutter/core/design_system/components/bare_bones_scaffold.dart';
import 'package:bare_bones_flutter/features/auth/sign_up/sign_up_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpView extends ConsumerStatefulWidget {
  const SignUpView({super.key});

  @override
  ConsumerState<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends ConsumerState<SignUpView> {
  final _formKey = GlobalKey<FormState>();

  final String _emailPattern = r'^[^@]+@[^@]+\.[^@]+$';

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  bool _isButtonDisabled = true;

  void _validateForm() {
    final form = _formKey.currentState;

    if (form != null) {
      setState(() {
        _isButtonDisabled = !form.validate();
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _validateForm();
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(signUpViewModelProvider, (p, c) {
      if (p?.isLoading == false && c.isLoading == true) {
        BareBonesLoadingIndicator.of(context).show();
      }
      if (p?.isLoading == true && c.isLoading == false) {
        BareBonesLoadingIndicator.of(context).hide();
      }
    });

    return BareBonesScaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context)!.signUp,
          style: const TextStyle(fontSize: 20),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.disabled,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: AppLocalizations.of(context)!.email),
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppLocalizations.of(context)!.enterYourEmail;
                  } else if (!RegExp(_emailPattern).hasMatch(value)) {
                    return AppLocalizations.of(context)!.enterValidEmail;
                  }
                  return null;
                },
                onChanged: (_) => _validateForm(),
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: AppLocalizations.of(context)!.password),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppLocalizations.of(context)!.passwordRequired;
                  }
                  if (value.length < 8) {
                    return AppLocalizations.of(context)!.passwordMustBeAtLeast8CharactersLong;
                  }
                  if (!value.contains(RegExp(r'[A-Z]'))) {
                    return AppLocalizations.of(context)!.passwordMustContainAtLeastOneUppercaseLetter;
                  }
                  if (!value.contains(RegExp(r'[a-z]'))) {
                    return AppLocalizations.of(context)!.passwordMustContainAtLeastOneLowercaseLetter;
                  }
                  if (!value.contains(RegExp(r'[0-9]'))) {
                    return AppLocalizations.of(context)!.passwordMustContainAtLeastOneNumbericCharacter;
                  }
                  if (!value.contains(RegExp(r'[!@#$%^&*()<>?/|}{~:]'))) {
                    return AppLocalizations.of(context)!.passwordMustContainAtLeastOneSpecialCharacter;
                  }
                  return null; // Password is valid.
                },
                onChanged: (_) => _validateForm(),
              ),
              TextFormField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(labelText: AppLocalizations.of(context)!.confirmPassword),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppLocalizations.of(context)!.reEnterPassword;
                  }
                  if (value != _passwordController.text) {
                    return AppLocalizations.of(context)!.passwordsDoNotMatch;
                  }
                  return null; // Passwords match.
                },
                onChanged: (_) => _validateForm(),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _isButtonDisabled
                    ? null
                    : () {
                        ref.read(signUpViewModelProvider.notifier).createUserWithEmailAndPassword(
                            email: _emailController.text, password: _passwordController.text);
                      },
                child: Text(AppLocalizations.of(context)!.signUpExclamation),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
