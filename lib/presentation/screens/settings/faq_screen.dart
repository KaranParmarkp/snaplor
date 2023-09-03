import 'package:flutter/material.dart';
import 'package:jyotishee/app/utils/constants/app_strings.dart';
import 'package:jyotishee/app/utils/constants/app_style.dart';
import 'package:jyotishee/app/utils/utils.dart';

import '../../widgets/widgets.dart';

class faqScreen extends StatefulWidget {
  const faqScreen({super.key});

  @override
  State<faqScreen> createState() => _faqScreenState();
}

class _faqScreenState extends State<faqScreen> {
  List<Map<String,String>> faqList = [
    {"How does the Jyotishee App work for astrologers?" : "The Jyotishee App allows astrologers to connect with users seeking astrological consultations. Astrologers can offer their insights and guidance through phone calls and chat within the app."},
    {"How do I get paid for my consultations?":"Astrologers on the Jyotishee platform are compensated for their services based on the total number of minutes they spend in consultation with users. Your earnings for each month will be accumulated and paid out to you monthly."},
    {"What is the rate I will be paid per minute?":"The rate per minute is mentioned in your dashboard and subject to change based on our internal guidelines and will be displayed in your dashboard."},
    {"How do users book a consultation with me?":"Users can browse through astrologer profiles and select the astrologer they wish to consult with. They can then initiate a call or chat depending on your availability."},
    {"What if a user is dissatisfied with my consultation?":"Users have the right to provide feedback. If a user is dissatisfied due to technical issues, they might be eligible for a refund. However, the platform doesn’t guarantee refunds based on dissatisfaction with astrological advice."},
    {"How do I set my availability on the app?":"Within the astrologer dashboard, there's an option to set your online status. Adjust this as per your availability to take calls or chats."},
    {"What kind of content can I post on the app?":"You can post astrology-related content for users to interact with. All content should be respectful, accurate, and not violate any platform guidelines."},
    {"How do I handle technical issues or glitches during consultations?":"If you encounter any technical issues, please report them immediately via the 'Help' or 'Support' section in the app. Our team will work to resolve them promptly."},
    {"How can I ensure a smooth and professional consultation":"Ensure you are in a quiet environment, use a good-quality microphone and headphones, and maintain a steady internet connection. It’s also essential to be respectful and understanding of the user's concerns."},
    {"Can users see my personal information?":" No. Only the details you choose to display on your profile will be visible to users. Your personal contact information and other sensitive details are kept confidential."},
    {"Who do I contact for further queries or support?":"For any additional questions or support, please reach out to admin@jyotishee.com."},
    {"How does the rating system work?":"Users have the opportunity to rate and review your services after each consultation. A higher rating can enhance your visibility on the platform, leading to more consultation opportunities."},
    {"Can I set a specific topic or specialization for consultations?":"Yes, you can specify areas of expertise in your profile, such as Vedic astrology, Tarot readings, or Numerology, allowing users to select astrologers based on their unique needs."},
    {"How do I handle difficult or sensitive questions from users?":"We advise maintaining professionalism, empathy, and discretion. If a query is outside your area of expertise or comfort, kindly inform the user and guide them to seek help elsewhere if necessary."},
    {"How is the privacy of my consultations maintained?":"All consultations are protected, and we ensure that no third party has access to the conversations. Protecting both the astrologer's and user's privacy is a top priority."},
    {"Can I offer promotional rates or discounts?":"Yes, from time to time, you can set promotional rates to attract more users. This can be managed through your dashboard settings."},
    {"How often is the app updated, and how will I be informed?":"We regularly update the app to improve features and security. All updates are communicated via in-app notifications or email."},
    {"Can I offer both voice and chat consultations, or do I have to choose one?":"You have the flexibility to offer both or choose the mode you're most comfortable with. Adjust your preferences in the settings."},
    {"What happens if a user disputes a charge or consultation?":"In case of a dispute, our support team will review the case, considering both the user's and astrologer's perspectives. We aim for a fair resolution in every situation."},
    {"How can I improve my visibility and get more consultations?":"Regularly updating your profile, sharing insightful content on Jyotishee social, and maintaining high ratings can increase your visibility on the platform."},
    {"Do I need any specific technical equipment or software to use the Jyotishee App?":"No specialized equipment is required. However, a stable internet connection, a device with the latest version of the app, and good-quality headphones can enhance the consultation experience."},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.faqs,
      ),
      body: Container(
        height: context.screenHeight,
        padding: const EdgeInsets.all(15.0),
        child: Expanded(
          child: ListView.builder(
            itemCount: faqList.length,
            clipBehavior: Clip.none,
            itemBuilder: (context, index) => TitleDropdownFAQ(header: faqList[index].keys.first, text: faqList[index].values.first),),
        )
      ),
    );
  }
}

