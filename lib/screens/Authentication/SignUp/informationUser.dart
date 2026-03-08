// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:heroes_club/screens/Authentication/SignUp/widget/widgetSignUp.dart';
//
// class InformationUser extends StatelessWidget {
//   const InformationUser({super.key, required this.ageController, required this.weightController});
//   final TextEditingController ageController;
//   final TextEditingController weightController;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return     Row(
//       children: [
//         Expanded(
//           child: buildTextFormField(
//             label: 'عمر اللاعب',
//             hint: 'العمر',
//             controller: ageController,
//             icon: Icons.calendar_today_outlined,
//             keyboardType: TextInputType.number,
//           ),
//         ),
//         const SizedBox(width: 16),
//         Expanded(
//           child: buildTextFormField(
//             label: 'وزن اللاعب (كجم)',
//             hint: 'الوزن',
//             controller: weightController,
//             icon: Icons.fitness_center,
//             keyboardType: TextInputType.number,
//           ),
//         ),
//       ],
//     );
//   }
// }
//

import 'package:flutter/material.dart';
import 'package:heroes_club/screens/Authentication/SignUp/widget/widgetSignUp.dart';

class InformationUser extends StatelessWidget {
  const InformationUser({
    super.key,
    required this.initialAge,
    required this.initialWeight,
    required this.onAgeChanged,
    required this.onWeightChanged,
  });

  final String initialAge;
  final String initialWeight;
  final ValueChanged<String> onAgeChanged;
  final ValueChanged<String> onWeightChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: buildTextFormField(
            label: 'عمر اللاعب',
            hint: 'العمر',
            initialValue: initialAge,
            onChanged: onAgeChanged,
            icon: Icons.calendar_today_outlined,
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'مطلوب';
              }
              final age = int.tryParse(value.trim());
              if (age == null || age < 5 || age > 120) {
                return 'عمر غير صالح';
              }
              return null;
            },
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: buildTextFormField(
            label: 'وزن اللاعب (كجم)',
            hint: 'الوزن',
            initialValue: initialWeight,
            onChanged: onWeightChanged,
            icon: Icons.fitness_center,
            keyboardType: TextInputType.number,
            validator: (value) {
              if (value == null || value.trim().isEmpty) {
                return 'مطلوب';
              }
              final weight = double.tryParse(value.trim());
              if (weight == null || weight < 20 || weight > 300) {
                return 'وزن غير صالح';
              }
              return null;
            },
          ),
        ),
      ],
    );
  }
}