import 'package:flutter/material.dart';

class CustomRadioButton extends StatelessWidget {
  final bool isSelected;
  final void Function()? onChanged;
  final String label;
  final Color color;
  final Color radioButtonColor;

  const CustomRadioButton(
      {super.key,
      required this.isSelected,
      required this.onChanged,
      required this.label,
      required this.radioButtonColor,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onChanged,
      child: Row(
        children: [
          Container(
            width: isSelected ? 22 : 20,
            height: isSelected ? 22 : 20,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: isSelected ? const Color(0xFF365830) : radioButtonColor,
                width: isSelected ? 4 : 2,
              ),
              color: Colors.transparent,
            ),
            child: isSelected
                ? Center(
                    child: Container(
                      margin: const EdgeInsets.all(2),
                      width: 12,
                      height: 12,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF365830),
                      ),
                    ),
                  )
                : null,
          ),
          const SizedBox(width: 5),
          Text(
            label,
            style: TextStyle(
                color: color,
                fontSize: 12,
                fontWeight: FontWeight.bold,
                fontFamily: "Montserrat"),
          ),
        ],
      ),
    );
  }
}
