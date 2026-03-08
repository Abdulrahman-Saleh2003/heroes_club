// import 'package:flutter/material.dart';
// import 'package:heroes_club/core/constant/image_asset.dart';
// import 'package:heroes_club/screens/Authentication/SignUp/AlreadyHaveAccount.dart';
// import 'package:heroes_club/screens/Authentication/SignUp/CreateAccountSection.dart';
// import 'package:heroes_club/screens/Authentication/SignUp/SignUpButton.dart';
// import 'package:heroes_club/screens/Authentication/SignUp/TermsAndConditionsPage.dart';
// import 'package:heroes_club/screens/Authentication/SignUp/headSignUp.dart';
// import 'package:heroes_club/screens/Authentication/SignUp/informationUser.dart';
// import 'package:heroes_club/screens/Authentication/SignUp/widget/widgetSignUp.dart';
//
// class SignUpScreen extends StatefulWidget {
//   const SignUpScreen({super.key});
//
//   @override
//   State<SignUpScreen> createState() => _SignUpScreenState();
// }
//
// class _SignUpScreenState extends State<SignUpScreen> {
//   final _formKey = GlobalKey<FormState>();
//
//   final _nameController = TextEditingController();
//   final _ageController = TextEditingController();
//   final _weightController = TextEditingController();
//   final _phoneController = TextEditingController();
//   final _passwordController = TextEditingController();
//   final _confirmPasswordController = TextEditingController();
//
//   bool _obscurePassword = true;
//   bool _obscureConfirm = true;
//   bool _agreeToTerms = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           // الخلفية
//           Positioned.fill(
//             child: Image.asset(
//               AppImageAsset.backgroundAuthentication, // ← المتغير اللي عندك
//               fit: BoxFit.cover,
//             ),
//           ),
//
//           Positioned.fill(
//             child: Container(
//               color: Colors.black.withOpacity(0.65),
//             ),
//           ),
//
//           SafeArea(
//             child: SingleChildScrollView(
//               padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.center,
//                   children: [
//                     const SizedBox(height: 20),
//                     HeadsignUp()
//                   ,
//                     const SizedBox(height: 40),
//                     CreateAccountSection(),
//                     const SizedBox(height: 48),
//                     buildTextFormField(
//                       label: 'اسم اللاعب',
//                       hint: 'أدخل اسمك الكامل',
//                       controller: _nameController,
//                       icon: Icons.person_outline,
//                       keyboardType: TextInputType.name,
//                     ),
//                     const SizedBox(height: 28),
//                     InformationUser(
//
//                       ageController:_ageController ,
//                       weightController: _weightController,
//
//
//                     ),
//
//                     const SizedBox(height: 28),
//
//                     // رقم الهاتف
//                     buildTextFormField(
//                       label: 'رقم الهاتف',
//                       hint: '05XXXXXXXX',
//                       controller: _phoneController,
//                       icon: Icons.phone_android,
//                       keyboardType: TextInputType.phone,
//                       prefixText: '+966 ',
//                     ),
//
//                     const SizedBox(height: 28),
//
//                     // كلمة المرور
//                     buildPasswordTextFormField(
//                       label: 'كلمة السر',
//                       controller: _passwordController,
//                       passwordController: _passwordController,
//
//                       obscure: _obscurePassword,
//                       onToggle: () => setState(() => _obscurePassword = !_obscurePassword),
//                     ),
//
//                     const SizedBox(height: 28),
//
//                     buildPasswordTextFormField(
//                       label: 'تأكيد كلمة السر',
//                       passwordController: _passwordController,
//                       controller: _confirmPasswordController,
//                       obscure: _obscureConfirm,
//                       onToggle: () => setState(() => _obscureConfirm = !_obscureConfirm),
//                     ),
//
//                     const SizedBox(height: 32),
//
//
//
//
//                     TermsAndConditionsPage(
//                       agreeToTerms: _agreeToTerms,
//                       onChanged: (v) => setState(() => _agreeToTerms = v ?? false),
//                     ),
//                     // checkbox الشروط
//
//
//                     const SizedBox(height: 40),
//
//
//                     SignUpButton(
//                       isEnabled: _agreeToTerms,
//                       onPressed: () {
//                         if (_formKey.currentState!.validate()) {
//                           // منطق التسجيل هنا
//                         }
//                       },
//                     ),
//                     // زر التسجيل
//
//                     const SizedBox(height: 32),
//
//
//                     AlreadyHaveAccount(
//                       onTap: () {
//                         // Navigator.push(
//                         //   context,
//                         //   MaterialPageRoute(builder: (_) => const LoginScreen()),
//                         // );
//                       },
//                     ),
//
//                     const SizedBox(height: 40),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//
//
//
//
//   @override
//   void dispose() {
//     _nameController.dispose();
//     _ageController.dispose();
//     _weightController.dispose();
//     _phoneController.dispose();
//     _passwordController.dispose();
//     _confirmPasswordController.dispose();
//     super.dispose();
//   }
// }
//
//





import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:heroes_club/controller/Authentication/sign_up/SignUpProvider.dart';
import 'package:heroes_club/controller/Authentication/sign_up/signup_state.dart';
import 'package:heroes_club/core/constant/image_asset.dart';
import 'package:heroes_club/screens/Authentication/SignUp/AlreadyHaveAccount.dart';
import 'package:heroes_club/screens/Authentication/SignUp/CreateAccountSection.dart';
import 'package:heroes_club/screens/Authentication/SignUp/SignUpButton.dart';
import 'package:heroes_club/screens/Authentication/SignUp/TermsAndConditionsPage.dart';
import 'package:heroes_club/screens/Authentication/SignUp/headSignUp.dart';
import 'package:heroes_club/screens/Authentication/SignUp/informationUser.dart';
import 'package:heroes_club/screens/Authentication/SignUp/widget/widgetSignUp.dart';

class SignUpScreen extends ConsumerStatefulWidget {
  const SignUpScreen({super.key});

  @override
  ConsumerState<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends ConsumerState<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(signUpControllerProvider);
    final controller = ref.read(signUpControllerProvider.notifier);

    final isLoading = state.status == SignUpStatus.loading;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              AppImageAsset.backgroundAuthentication,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: Container(color: Colors.black.withOpacity(0.65)),
          ),
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 16),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 20),
                    const HeadsignUp(),
                    const SizedBox(height: 40),
                    const CreateAccountSection(),
                    const SizedBox(height: 48),

                    // الاسم
                    buildTextFormField(
                      label: 'اسم اللاعب',
                      hint: 'أدخل اسمك الكامل',
                      initialValue: state.name,
                      onChanged: controller.updateName,
                      icon: Icons.person_outline,
                      validator: (v) =>
                      v?.trim().isEmpty ?? true ? 'مطلوب' : null,
                    ),
                    const SizedBox(height: 28),

                    // العمر + الوزن
                    InformationUser(
                      initialAge: state.age,
                      initialWeight: state.weight,
                      onAgeChanged: controller.updateAge,
                      onWeightChanged: controller.updateWeight,
                    ),
                    const SizedBox(height: 28),

                    // رقم الجوال
                    buildTextFormField(
                      label: 'رقم الهاتف',
                      hint: '05XXXXXXXX',
                      initialValue: state.phone,
                      onChanged: controller.updatePhone,
                      icon: Icons.phone_android,
                      keyboardType: TextInputType.phone,
                      prefixText: '+966 ',
                      validator: (v) {
                        if (v == null || v.trim().length < 9) {
                          return 'رقم غير صالح (9 أرقام على الأقل)';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 28),

                    // كلمة المرور
                    buildPasswordTextFormField(
                      label: 'كلمة السر',
                      initialValue: state.password,
                      onChanged: controller.updatePassword,
                      obscureText: _obscurePassword,
                      onToggleVisibility: () =>
                          setState(() => _obscurePassword = !_obscurePassword),
                    ),
                    const SizedBox(height: 28),

                    // تأكيد كلمة المرور
                    buildPasswordTextFormField(
                      label: 'تأكيد كلمة السر',
                      initialValue: state.confirmPassword,
                      onChanged: controller.updateConfirmPassword,
                      obscureText: _obscureConfirmPassword,
                      onToggleVisibility: () => setState(
                              () => _obscureConfirmPassword = !_obscureConfirmPassword),
                    ),
                    const SizedBox(height: 32),

                    TermsAndConditions(
                      value: state.isTermsAccepted,
                      onChanged: controller.toggleTerms,
                      // onTapTerms: () => Navigator.push(context, MaterialPageRoute(builder: (_) => TermsPage())),
                    ),
                    const SizedBox(height: 40),

                    SignUpButton(
                      isEnabled: state.isFormValid && !isLoading,
                      isLoading: isLoading,
                      onPressed: () async {
                        if (!_formKey.currentState!.validate()) return;

                        await controller.signUp();

                        if (!context.mounted) return;

                        if (state.status == SignUpStatus.success) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("تم التسجيل بنجاح!"),
                            ),
                          );
                          // Navigator.pushReplacement(...);
                        }
                      },
                    ),

                    if (state.errorMessage != null) ...[
                      const SizedBox(height: 16),
                      Text(
                        state.errorMessage!,
                        style: const TextStyle(color: Colors.redAccent),
                        textAlign: TextAlign.center,
                      ),
                    ],

                    const SizedBox(height: 32),
                    AlreadyHaveAccount(
                      onTap: () {
                        // Navigator.pop() أو push Login
                      },
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}