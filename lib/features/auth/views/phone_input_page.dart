// lib/features/auth/views/phone_input_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_form_field/phone_form_field.dart';

import '../cubit/auth_cubit.dart';
import '../cubit/auth_state.dart';
import 'otp_page.dart';

class PhoneInputPage extends StatefulWidget {
  const PhoneInputPage({super.key});

  @override
  State<PhoneInputPage> createState() => _PhoneInputPageState();
}

class _PhoneInputPageState extends State<PhoneInputPage> {
  final _formKey = GlobalKey<FormState>();
  // مبدئيًا الإمارات AE، غيّرها حسب ما تحب
  final _controller = PhoneController(
    initialValue: const PhoneNumber(isoCode: IsoCode.AE, nsn: ''),
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  String _toE164(PhoneNumber number) {
    final intl = number.international;
    return intl.replaceAll(' ', '');
  }

  void _onSend() {
    final value = _controller.value;
    if (!_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid phone number')),
      );
      return;
    }
    final e164 = _toE164(value);
    context.read<AuthCubit>().sendOtp(e164);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sign in')),
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state.verificationId != null) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => OtpPage(verificationId: state.verificationId!),
              ),
            );
          }
          if (state.error != null && state.error!.isNotEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error!)),
            );
          }
        },
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  PhoneFormField(
                    controller: _controller,
                    // لو حابب الـ bottom sheet:
                    countrySelectorNavigator:
                        const CountrySelectorNavigator.bottomSheet(),
                    // فالياديتور جاهز للموبايل:
                    validator: PhoneValidator.validMobile(context),
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    isCountryButtonPersistent: true,
                    decoration: const InputDecoration(
                      labelText: 'Phone number',
                      border: OutlineInputBorder(),
                      hintText: 'e.g. 50 123 4567',
                    ),
                    // اختياري: لمنع إدخال غير أرقام في الجزء المحلي
                    // shouldFormat: true,
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: state.loading ? null : _onSend,
                      child: state.loading
                          ? const SizedBox(
                              height: 18, width: 18, child: CircularProgressIndicator(strokeWidth: 2))
                          : const Text('Send OTP'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
