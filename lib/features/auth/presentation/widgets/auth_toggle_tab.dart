import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthToggleTab extends StatelessWidget {
  final String label;
  final bool isActive;
  const AuthToggleTab({super.key, required this.label, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            color: isActive
                ? const Color(0xFF1C1B1F)
                : const Color(0xFF1C1B1F).withOpacity(0.35),
            fontWeight: FontWeight.w700,
            fontSize: 16.sp,
          ),
        ),
      ),
    );
  }
}
