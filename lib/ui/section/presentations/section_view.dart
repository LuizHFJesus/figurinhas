import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sticker_manager_wc22/ui/section/controllers/section_container_controller.dart';
import 'package:sticker_manager_wc22/ui/section/controllers/section_controller.dart';
import 'package:sticker_manager_wc22/ui/section/presentations/section_page.dart';

class SectionView extends GetView<SectionContainerController> {
  const SectionView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          if (controller.sections.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }

          return PageView.builder(
            controller: controller.pageController,
            itemCount: controller.sections.length,
            onPageChanged: controller.onPageChanged,
            itemBuilder: (context, index) {
              final section = controller.sections[index];
              // Ensure the controller for this section is initialized
              SectionController.put(section.sectionId);
              return SectionPage(sectionId: section.sectionId);
            },
          );
        },
      ),
    );
  }
}
