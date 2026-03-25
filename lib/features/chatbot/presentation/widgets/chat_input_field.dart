import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors/app_colors.dart';
import '../../../../core/utils/app_strings.dart';

class ChatInputField extends StatelessWidget {
  final VoidCallback onGridTap;

  const ChatInputField({
    super.key,
    required this.onGridTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 30.h),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: TextField(
            textAlign: TextAlign.right,
            decoration: InputDecoration(
              hintText: AppStrings.writeQuestion,
              hintStyle: TextStyle(
                color: Colors.grey[400],
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
              filled: true,
              fillColor: Colors.white,
              isDense: true,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 17.w, vertical: 15.h),
              prefixIcon: Padding(
                padding: EdgeInsets.only(left: 10.w, right: 10.w),
                child: Container(
                  width: 40.w,
                  height: 40.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: AppColors.textGradient,
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF3B82F6).withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(12.w),
                    child: SvgPicture.asset(
                      AppAssets.send,
                      colorFilter:
                          const ColorFilter.mode(Colors.white, BlendMode.srcIn),
                    ),
                  ),
                ),
              ),
              prefixIconConstraints: BoxConstraints(
                minWidth: 64.w,
                minHeight: 48.w,
              ),
              suffixIcon: Padding(
                padding: EdgeInsets.only(right: 12.w, left: 8.w),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    InkWell(
                      onTap: onGridTap,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          SvgPicture.asset(
                            AppAssets.grid,
                            width: 22.w,
                            height: 22.w,
                            colorFilter: const ColorFilter.mode(
                                Color(0xFFBA68C8), BlendMode.srcIn),
                          ),
                          Positioned(
                            top: -2,
                            right: -2,
                            child: Container(
                              width: 6.w,
                              height: 6.w,
                              decoration: const BoxDecoration(
                                color: Color(0xFFBA68C8),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 16.w),
                    SvgPicture.asset(
                      AppAssets.mic,
                      width: 22.w,
                      height: 22.w,
                      colorFilter: const ColorFilter.mode(
                          Color(0xFFBA68C8), BlendMode.srcIn),
                    ),
                    SizedBox(width: 8.w),
                  ],
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.r),
                borderSide: BorderSide(
                  color: const Color(0xFFC54EEC).withOpacity(0.4),
                  width: 1.5,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30.r),
                borderSide: const BorderSide(
                  color: AppColors.primary,
                  width: 1.5,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
