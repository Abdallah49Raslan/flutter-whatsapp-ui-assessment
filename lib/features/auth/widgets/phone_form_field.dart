import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_form_field/phone_form_field.dart';
import 'package:whatsapp_clone/features/auth/cubit/auth_cubit.dart';

class PhonePickerField extends StatefulWidget {
  const PhonePickerField({super.key});

  @override
  State<PhonePickerField> createState() => _PhonePickerFieldState();
}

class _PhonePickerFieldState extends State<PhonePickerField> {
  final _controller = PhoneController(
    initialValue: const PhoneNumber(isoCode: IsoCode.AE, nsn: ''),
  );

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _send() {
    final parsed = _controller.value;
    if (parsed == null || !parsed.isValid()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid phone number')),
      );
      return;
    }
    // يفضّل لو عندك method e164 استخدمها، وإلا امسح المسافات من international
    final e164 = parsed.international.replaceAll(' ', '');
    context.read<AuthCubit>().sendOtp(e164);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PhoneFormField(
          controller: _controller,
        
          countrySelectorNavigator: const CountrySelectorNavigator.bottomSheet(),
          decoration: const InputDecoration(
            labelText: 'Phone number',
            border: OutlineInputBorder(),
          ),
          isCountryButtonPersistent: true,
          validator: PhoneValidator.validMobile(context),
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
        const SizedBox(height: 12),
        ElevatedButton(onPressed: _send, child: const Text('Send OTP')),
      ],
    );
  }
}
