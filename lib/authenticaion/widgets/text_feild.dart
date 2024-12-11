// import 'package:flutter/material.dart';

// class TextFIEID extends StatelessWidget {
//   const TextFIEID({
//     super.key,
//     required this.headtex,
//     required this.hintText,
//   });
//   final String headtex;
//   final String hintText;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.start,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           headtex,
//           style: const TextStyle(fontSize: 13),
//         ),
//         const SizedBox(
//           height: 8,
//         ),
//         TextFormField(
//           decoration: InputDecoration(
//             hintStyle: const TextStyle(
//               fontSize: 13,
//               color: Color.fromARGB(255, 160, 160, 166),
//             ),
//             hintText: hintText,
//             border: OutlineInputBorder(
//               borderSide: const BorderSide(
//                 color: Color.fromARGB(255, 160, 160, 166),
//                 width: 1,
//               ),
//               borderRadius: BorderRadius.circular(25),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderSide: const BorderSide(
//                 color: Color.fromARGB(255, 160, 160, 166),
//                 width: 1,
//               ),
//               borderRadius: BorderRadius.circular(25),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderSide: const BorderSide(
//                 color: Color.fromARGB(255, 160, 160, 166),
//                 width: 2,
//               ),
//               borderRadius: BorderRadius.circular(25),
//             ),
//             errorBorder: OutlineInputBorder(
//               borderSide: const BorderSide(
//                 color: Colors.red, // Error border color
//                 width: 2,
//               ),
//               borderRadius: BorderRadius.circular(25),
//             ),
//             focusedErrorBorder: OutlineInputBorder(
//               borderSide: const BorderSide(
//                 color: Colors.red, // Error border color when focused
//                 width: 2,
//               ),
//               borderRadius: BorderRadius.circular(25),
//             ),
//           ),
//         ),
//         const SizedBox(
//           height: 20,
//         ),
//       ],
//     );
//   }
// }
import 'package:flutter/material.dart';

class TextFIEID extends StatelessWidget {
  const TextFIEID({
    super.key,
    required this.headtex,
    required this.hintText,
    required this.controller,
    required this.validator,
  });

  final String headtex;
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?) validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          headtex,
          style: const TextStyle(fontSize: 13),
        ),
        const SizedBox(
          height: 8,
        ),
        TextFormField(
          controller: controller,
          validator: validator,
          decoration: InputDecoration(
            hintStyle: const TextStyle(
              fontSize: 13,
              color: Color.fromARGB(255, 160, 160, 166),
            ),
            hintText: hintText,
            border: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 160, 160, 166),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 160, 160, 166),
                width: 1,
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 160, 160, 166),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.red, // Error border color
                width: 2,
              ),
              borderRadius: BorderRadius.circular(25),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.red, // Error border color when focused
                width: 2,
              ),
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
