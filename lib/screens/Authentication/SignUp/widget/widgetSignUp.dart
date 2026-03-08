
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildTextFormField1({
  required String label,
  required String hint,
  required TextEditingController controller,
  required IconData icon,
  TextInputType keyboardType = TextInputType.text,
  String? prefixText,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: const TextStyle(color: Colors.white70, fontSize: 15),
      ),
      const SizedBox(height: 8),
      TextFormField(
        controller: controller,
        keyboardType: keyboardType,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey[600]),
          prefixIcon: Icon(icon, color: const Color(0xFFFFD700)),
          prefixText: prefixText,
          prefixStyle: const TextStyle(color: Color(0xFFFFD700)),
          filled: true,
          fillColor: Colors.black38,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            // borderSide: BorderSide.none,
            borderSide: const BorderSide(color: Color(0xFFFFD700), width: 1.8),

          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.grey[800]!, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Color(0xFFFFD700), width: 1.8),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        ),
        validator: (v) => v?.trim().isEmpty ?? true ? 'مطلوب' : null,
      ),
    ],
  );
}


Widget buildPasswordTextFormField1({
  required String label,
  required TextEditingController controller,
  required TextEditingController passwordController,

  required bool obscure,
  required VoidCallback onToggle,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: const TextStyle(color: Colors.white70, fontSize: 15),
      ),
      const SizedBox(height: 8),
      TextFormField(
        controller: controller,
        obscureText: obscure,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: '••••••••••',
          hintStyle: TextStyle(color: Colors.grey[600]),
          prefixIcon: const Icon(Icons.lock_outline, color: Color(0xFFFFD700)),
          suffixIcon: IconButton(
            icon: Icon(
              obscure ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey[400],
            ),
            onPressed: onToggle,
          ),
          filled: true,
          fillColor: Colors.black38,
          border: OutlineInputBorder(

            borderRadius: BorderRadius.circular(30),
          //  borderSide: BorderSide.none,
            borderSide: const BorderSide(color: Color(0xFFFFD700), width: 1.8),

            // borderSide: BorderSide(color: Colors.red, width: 1),

          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.grey[800]!, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Color(0xFFFFD700), width: 1.8),
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        ),
        validator: (v) {
          if (v?.trim().isEmpty ?? true) return 'مطلوب';
          if (label.contains('تأكيد') && v != passwordController.text) {
            return 'كلمتا المرور غير متطابقتين';
          }
          return null;
        },
      ),
    ],
  );
}




Widget buildTextFormField({
  required String label,
  required String hint,
  String? initialValue,
  required ValueChanged<String> onChanged,
  required IconData icon,
  TextInputType keyboardType = TextInputType.text,
  String? prefixText,
  String? Function(String?)? validator,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: const TextStyle(color: Colors.white70, fontSize: 15),
      ),
      const SizedBox(height: 8),
      TextFormField(
        initialValue: initialValue,
        onChanged: onChanged,
        keyboardType: keyboardType,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey[600]),
          prefixIcon: Icon(icon, color: const Color(0xFFFFD700)),
          prefixText: prefixText,
          prefixStyle: const TextStyle(color: Color(0xFFFFD700)),
          filled: true,
          fillColor: Colors.black38,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.grey[800]!, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Color(0xFFFFD700), width: 1.8),
          ),
          contentPadding:
          const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        ),
        validator: validator,
      ),
    ],
  );
}

Widget buildPasswordTextFormField({
  required String label,
  String? initialValue,
  required ValueChanged<String> onChanged,
  required bool obscureText,
  required VoidCallback onToggleVisibility,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: const TextStyle(color: Colors.white70, fontSize: 15),
      ),
      const SizedBox(height: 8),
      TextFormField(
        initialValue: initialValue,
        onChanged: onChanged,
        obscureText: obscureText,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          hintText: '••••••••••',
          hintStyle: TextStyle(color: Colors.grey[600]),
          prefixIcon: const Icon(Icons.lock_outline, color: Color(0xFFFFD700)),
          suffixIcon: IconButton(
            icon: Icon(
              obscureText ? Icons.visibility_off : Icons.visibility,
              color: Colors.grey[400],
            ),
            onPressed: onToggleVisibility,
          ),
          filled: true,
          fillColor: Colors.black38,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(color: Colors.grey[800]!, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: const BorderSide(color: Color(0xFFFFD700), width: 1.8),
          ),
          contentPadding:
          const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        ),
        validator: (v) {
          if (v == null || v.trim().isEmpty) return 'مطلوب';
          return null;
        },
      ),
    ],
  );
}



