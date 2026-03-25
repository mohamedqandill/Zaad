import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_strings.dart';
import '../widgets/auth_toggle_tab.dart';
import 'login_page.dart';
import 'signup_page.dart';

class AuthPage extends StatefulWidget {
  final bool isInitialSignUp;
  const AuthPage({super.key, this.isInitialSignUp = false});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  late bool isSignUp;

  @override
  void initState() {
    super.initState();
    isSignUp = widget.isInitialSignUp;
  }

  void _toggle() {
    setState(() {
      isSignUp = !isSignUp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: Stack(
                children: [
                  Image.asset(
                    AppAssets.topBg,
                    width: double.infinity,
                    height: 276.h,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 27.6.h,
                    child: Column(
                      children: [
                        Image.asset(
                          AppAssets.splashLogo,
                          height: 145.h,
                          fit: BoxFit.cover,
                        ),
                        Text(
                          isSignUp
                              ? AppStrings.fillInformation
                              : AppStrings.createAccountToReachApp,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 13.sp,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SafeArea(
              top: false,
              child: Padding(
                padding: EdgeInsets.only(top: 193.h),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(28.r),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                          left: 20.w, right: 20.w, top: 10.h),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: EdgeInsets.all(4.w),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF7F7F7),
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () =>
                                        setState(() => isSignUp = false),
                                    borderRadius: BorderRadius.circular(12.r),
                                    child: AuthToggleTab(
                                        label: AppStrings.loginHeader,
                                        isActive: !isSignUp),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () =>
                                        setState(() => isSignUp = true),
                                    borderRadius: BorderRadius.circular(12.r),
                                    child: AuthToggleTab(
                                        label: AppStrings.signUpLink,
                                        isActive: isSignUp),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 24.h),
                          Expanded(
                            child: isSignUp
                                ? SignupBody(onToggle: _toggle)
                                : LoginBody(onToggle: _toggle),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
