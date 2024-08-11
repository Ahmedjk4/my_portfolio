import 'package:flutter/material.dart';
import 'package:my_portfolio/constants/app_colors.dart';
import 'package:my_portfolio/constants/shoruh_colors.dart';
import 'package:my_portfolio/constants/size.dart';
import 'package:my_portfolio/models/message_model.dart';
import 'package:my_portfolio/services/firestore_service.dart';
import 'package:my_portfolio/utils/contact_links.dart';
import 'package:my_portfolio/widgets/custom_text_field.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final TextEditingController nameController = TextEditingController(),
      emailController = TextEditingController(),
      messageController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Container(
        color: AppColors.primaryColor,
        width: MediaQuery.sizeOf(context).width,
        padding: const EdgeInsets.fromLTRB(25, 20, 25, 60),
        child: Column(
          children: [
            const Text(
              'Get In Touch',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: CustomColor.whitePrimary,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            ConstrainedBox(
                constraints: const BoxConstraints(
                  maxWidth: 700,
                  maxHeight: 100,
                ),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    if (constraints.maxWidth >= kMinDesktopWidth) {
                      return buildNameEmailFieldDesktop();
                    }
                    return buildNameEmailFieldMobile();
                  },
                )),
            const SizedBox(height: 20),
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 700,
              ),
              child: CustomTextField(
                controller: messageController,
                hintText: "Your Message",
                type: TextInputType.multiline,
                maxLines: 20,
                action: TextInputAction.newline,
              ),
            ),
            const SizedBox(height: 20),
            ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 700,
              ),
              child: SizedBox(
                height: 50,
                width: double.maxFinite,
                child: MaterialButton(
                  color: CustomColor.yellowPrimary,
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100)),
                  onPressed: () async {
                    if (!formKey.currentState!.validate()) {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                      return;
                    }
                    try {
                      await FirestoreService.addMessage(MessageModel(
                          name: nameController.text,
                          message: messageController.text,
                          email: emailController.text));
                      nameController.clear();
                      messageController.clear();
                      emailController.clear();
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            backgroundColor: AppColors.tertiaryColor,
                            content: const Text(
                              "Message sent successfully",
                              style: TextStyle(
                                  color: CustomColor.whitePrimary,
                                  fontSize: 16),
                            ),
                          ),
                        );
                      }
                    } catch (e) {
                      debugPrint(e.toString());
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: AppColors.tertiaryColor,
                            content: Text(
                              "Failed to send message",
                              style: TextStyle(
                                  color: CustomColor.whitePrimary,
                                  fontSize: 16),
                            ),
                          ),
                        );
                      }
                    }
                  },
                  child: const Text("Get in touch"),
                ),
              ),
            ),
            const SizedBox(height: 30),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 300),
              child: const Divider(),
            ),
            const SizedBox(height: 15),
            Wrap(
              spacing: 12,
              runSpacing: 12,
              alignment: WrapAlignment.center,
              children: [
                for (var i = 0; i < kContactLinks.length; i++)
                  InkWell(
                    onTap: () async {
                      try {
                        await launchUrl(Uri.parse(kContactLinks[i].link));
                      } catch (_) {}
                    },
                    child: Image.asset(kContactLinks[i].icon, width: 28),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Row buildNameEmailFieldDesktop() {
    return Row(
      children: [
        Flexible(
          child: CustomTextField(
            controller: nameController,
            hintText: "Name",
            type: TextInputType.name,
          ),
        ),
        const SizedBox(width: 15),
        Flexible(
          child: CustomTextField(
            controller: emailController,
            hintText: "Email",
            type: TextInputType.emailAddress,
          ),
        ),
      ],
    );
  }

  Column buildNameEmailFieldMobile() {
    return Column(
      children: [
        Flexible(
          child: CustomTextField(
            controller: nameController,
            hintText: "Name",
            type: TextInputType.name,
          ),
        ),
        const SizedBox(height: 15),
        Flexible(
          child: CustomTextField(
            controller: emailController,
            hintText: "Email",
            type: TextInputType.emailAddress,
          ),
        ),
      ],
    );
  }
}
