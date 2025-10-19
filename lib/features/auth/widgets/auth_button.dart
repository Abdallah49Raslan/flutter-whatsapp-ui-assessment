import 'package:flutter/material.dart';


class AuthButton extends StatelessWidget {
final String text;
final bool loading;
final VoidCallback? onPressed;
const AuthButton({super.key, required this.text, this.loading=false, this.onPressed});


@override
Widget build(BuildContext context) {
return SizedBox(
width: double.infinity,
child: ElevatedButton(
onPressed: loading ? null : onPressed,
child: loading
? const SizedBox(height: 18, width: 18, child: CircularProgressIndicator(strokeWidth: 2))
: Text(text),
),
);
}
}