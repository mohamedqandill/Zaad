import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
import 'widgets/welcome_mode_card.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  int? _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7FF),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
          child: Column(
            children: [
              SizedBox(height: 20.h),
              Center(
                child: ShaderMask(
                  shaderCallback: (bounds) => const LinearGradient(
                    colors: [Color(0xFF3B82F6), Color(0xFFC54EEC)],
                  ).createShader(bounds),
                  child: Text(
                    AppStrings.chooseUsageStyle,
                    style: TextStyle(
                      fontSize: 27.sp,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40.h),
              WelcomeModeCard(
                title: AppStrings.youngExplorer,
                subtitle: AppStrings.kidsMode,
                description: AppStrings.kidsDescription,
                iconAsset: AppAssets.starPng,
                onTap: () => setState(() => _selectedIndex = 0),
                backgroundGradient: AppColors.cardGradient,
                titleColor: Colors.black,
                subtitleColor: AppColors.primary,
                descriptionColor: Colors.black,
                borderColor: _selectedIndex == 0
                    ? AppColors.primary
                    : Colors.transparent,
              ),
              SizedBox(height: 20.h),
              WelcomeModeCard(
                title: AppStrings.knowledgeSeeker,
                subtitle: AppStrings.advancedMode,
                description: AppStrings.advancedDescription,
                iconAsset: AppAssets.book,
                onTap: () => setState(() => _selectedIndex = 1),
                backgroundGradient: AppColors.primaryGradient,
                titleColor: Colors.white,
                subtitleColor: Colors.grey,
                descriptionColor: Colors.white,
                borderColor:
                    _selectedIndex == 1 ? Colors.white : Colors.transparent,
              ),
              SizedBox(height: 40.h),
              Container(
                width: double.infinity,
                height: 67.h,
                decoration: BoxDecoration(
                  color: _selectedIndex == null ? Colors.grey : null,
                  gradient:
                      _selectedIndex != null ? AppColors.primaryGradient : null,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(16.r),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        AppStrings.startJourney,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}
