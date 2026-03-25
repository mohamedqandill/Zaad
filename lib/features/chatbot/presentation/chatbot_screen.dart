import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/utils/app_assets.dart';
import '../../../core/utils/app_colors/app_colors.dart';
import '../../../core/utils/app_strings.dart';
import '../domain/models/field_option.dart';
import 'widgets/chat_input_field.dart';
import 'widgets/chatbot_app_bar.dart';
import 'widgets/chatbot_drawer.dart';
import 'widgets/field_selection_bottom_sheet.dart';
import 'widgets/selected_field_indicator.dart';
import 'widgets/suggested_questions_list.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  State<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  int? selectedFieldIndex;

  final List<FieldOption> fields = [
    FieldOption(AppStrings.fiqh, AppAssets.feqh),
    FieldOption(AppStrings.aqidah, AppAssets.aqeda),
    FieldOption(AppStrings.sirah, AppAssets.sera),
    FieldOption(AppStrings.history, AppAssets.tarej),
    FieldOption(AppStrings.language, AppAssets.luja),
    FieldOption(AppStrings.quranicSciences, AppAssets.olomQuran),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const ChatbotAppBar(),
      drawer: const ChatbotDrawer(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.chatBg.withOpacity(0.3),
              Colors.white,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(height: 5.h),
              if (selectedFieldIndex != null)
                SelectedFieldIndicator(title: fields[selectedFieldIndex!].title),
              const Expanded(
                child: Center(
                  child: SuggestedQuestionsList(),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ChatInputField(
        onGridTap: () => _showFieldSelectionBottomSheet(context),
      ),
    );
  }

  void _showFieldSelectionBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) {
        return FieldSelectionBottomSheet(
          fields: fields,
          initialSelectedIndex: selectedFieldIndex,
          onSelected: (index) {
            setState(() {
              selectedFieldIndex = index;
            });
          },
        );
      },
    );
  }
}
