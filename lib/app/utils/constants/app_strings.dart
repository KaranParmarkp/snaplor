import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jyotishee/main.dart';
class AppStrings {
  static String appName = "Jyotishee";
  static String yes = AppLocalizations.of(MyApp.appContext)!.yes;
  static String no = AppLocalizations.of(MyApp.appContext)!.no;

  ///Exceptions Strings
  static const String networkException  = "No internet connection";
  static const String noBodyException  = "No response body was received";
  static const String timeOutException  = "Connection timeout";
  static const String socketException  = "Socket Exception";
  ///Dio Client Exception
  static const String clientConnectionException  = "Failed to establish a connection with the server";
  static const String clientNoResponseException  = "No response from the server was received";
  static const String clientSendReqException  = "Timeout before the request could be sent";
  static const String clientReqCancelException  = "Request was cancelled";
  static const String unexpectedException  = "An unexpected response was received from the server";

  static String letStarted =AppLocalizations.of(MyApp.appContext)!.letStarted;
  static String connectUser =AppLocalizations.of(MyApp.appContext)!.connectUser;
  static String phoneNumber =AppLocalizations.of(MyApp.appContext)!.phoneNumber;
  static String enterPhoneNumber =AppLocalizations.of(MyApp.appContext)!.enterPhoneNumber;
  static String hiWelcome =AppLocalizations.of(MyApp.appContext)!.hiWelcome;
  static String enterNumber4VerCode =AppLocalizations.of(MyApp.appContext)!.enterNumber4VerCode;
  static String getOtp = AppLocalizations.of(MyApp.appContext)!.getOtp;
  static String enterCode=AppLocalizations.of(MyApp.appContext)!.enterCode;
  static String weSentSMS=AppLocalizations.of(MyApp.appContext)!.weSentSMS;
  static String resentOTP=AppLocalizations.of(MyApp.appContext)!.resentOTP;
  static String enteredWrongNumber=AppLocalizations.of(MyApp.appContext)!.enteredWrongNumber;
  static String verify=AppLocalizations.of(MyApp.appContext)!.verify;
  static String hi=AppLocalizations.of(MyApp.appContext)!.hi;
  static String importantPolices=AppLocalizations.of(MyApp.appContext)!.importantPolices;
  static String neverBeRude=AppLocalizations.of(MyApp.appContext)!.neverBeRude;
  static String neverShare=AppLocalizations.of(MyApp.appContext)!.neverShare;
  static String showMore=AppLocalizations.of(MyApp.appContext)!.showMore;
  static String totalEarnings=AppLocalizations.of(MyApp.appContext)!.totalEarnings;
  static String lifetimeEarnings=AppLocalizations.of(MyApp.appContext)!.lifetimeEarnings;
  static String recentAct=AppLocalizations.of(MyApp.appContext)!.recentAct;
  static String walletBalance=AppLocalizations.of(MyApp.appContext)!.walletBalance;
  static String calls=AppLocalizations.of(MyApp.appContext)!.calls;
  static String chat=AppLocalizations.of(MyApp.appContext)!.chat;
  static String type=AppLocalizations.of(MyApp.appContext)!.type;
  static String rate=AppLocalizations.of(MyApp.appContext)!.rate;
  static String rateWithout=AppLocalizations.of(MyApp.appContext)!.rateWithout;
  static String jsProfile=AppLocalizations.of(MyApp.appContext)!.jsProfile;
  static String orders =AppLocalizations.of(MyApp.appContext)!.orders;
  static String offers =AppLocalizations.of(MyApp.appContext)!.offers;
  static String waitList =AppLocalizations.of(MyApp.appContext)!.waitList;
  static String reviews =AppLocalizations.of(MyApp.appContext)!.reviews;
  static String supports= AppLocalizations.of(MyApp.appContext)!.supports;
  static String notification= AppLocalizations.of(MyApp.appContext)!.notification;
  static String accept =AppLocalizations.of(MyApp.appContext)!.accept;
  static String rejects =AppLocalizations.of(MyApp.appContext)!.rejects;
  static String search=AppLocalizations.of(MyApp.appContext)!.search;
  static String recentSearch=AppLocalizations.of(MyApp.appContext)!.recentSearch;
  static String searchHere=AppLocalizations.of(MyApp.appContext)!.searchHere;
  static String filters=AppLocalizations.of(MyApp.appContext)!.filters;
  static String proCat=AppLocalizations.of(MyApp.appContext)!.proCat;
  static String viewMore=AppLocalizations.of(MyApp.appContext)!.viewMore;
  static String filterByPrice=AppLocalizations.of(MyApp.appContext)!.filterByPrice;
  static String price=AppLocalizations.of(MyApp.appContext)!.price;
  static String filterByWeight=AppLocalizations.of(MyApp.appContext)!.filterByWeight;
  static String clearAll=AppLocalizations.of(MyApp.appContext)!.clearAll;
  static String applyFilters=AppLocalizations.of(MyApp.appContext)!.applyFilters;
  static String jyotisheeSocial=AppLocalizations.of(MyApp.appContext)!.jyotisheeSocial;
  static String posts=AppLocalizations.of(MyApp.appContext)!.posts;
  static String followers=AppLocalizations.of(MyApp.appContext)!.followers;
  static String comments=AppLocalizations.of(MyApp.appContext)!.comments;
  static String reply=AppLocalizations.of(MyApp.appContext)!.reply;
  static String likes=AppLocalizations.of(MyApp.appContext)!.likes;
  static String pinToTop=AppLocalizations.of(MyApp.appContext)!.pinToTop;
  static String hide=AppLocalizations.of(MyApp.appContext)!.hide;
  static String delete=AppLocalizations.of(MyApp.appContext)!.delete;
  static String editPost=AppLocalizations.of(MyApp.appContext)!.editPost;
  static String createPost=AppLocalizations.of(MyApp.appContext)!.createPost;
  static String addComment=AppLocalizations.of(MyApp.appContext)!.addComment;
  static String moreReplies=AppLocalizations.of(MyApp.appContext)!.moreReplies;
  static String view=AppLocalizations.of(MyApp.appContext)!.view;
  static String whatsHappening=AppLocalizations.of(MyApp.appContext)!.whatsHappening;
  static String name=AppLocalizations.of(MyApp.appContext)!.name;
  static String gender=AppLocalizations.of(MyApp.appContext)!.gender;
  static String dob=AppLocalizations.of(MyApp.appContext)!.dob;
  static String pob=AppLocalizations.of(MyApp.appContext)!.pob;
  static String problemArea=AppLocalizations.of(MyApp.appContext)!.problemArea;
  static String duration=AppLocalizations.of(MyApp.appContext)!.duration;
  static const String rupee="\u{20B9} ";
  static String refundAmount=AppLocalizations.of(MyApp.appContext)!.refundAmount;
  static String openKundli=AppLocalizations.of(MyApp.appContext)!.openKundli;
  static String completed=AppLocalizations.of(MyApp.appContext)!.completed;
  static String offerApplied=AppLocalizations.of(MyApp.appContext)!.offerApplied;
  static String rs=AppLocalizations.of(MyApp.appContext)!.rs;
  static String chatHistory=AppLocalizations.of(MyApp.appContext)!.chatHistory;
  static String callHistory=AppLocalizations.of(MyApp.appContext)!.callHistory;
  static String offerName=AppLocalizations.of(MyApp.appContext)!.offerName;
  static String displayName=AppLocalizations.of(MyApp.appContext)!.displayName;
  static String userType=AppLocalizations.of(MyApp.appContext)!.userType;
  static String myShare=AppLocalizations.of(MyApp.appContext)!.myShare;
  static String jyotisheeShare=AppLocalizations.of(MyApp.appContext)!.jyotisheeShare;
  static String customerPay=AppLocalizations.of(MyApp.appContext)!.customerPay;
  static String viewChat=AppLocalizations.of(MyApp.appContext)!.viewChat;
  static String messageHere=AppLocalizations.of(MyApp.appContext)!.messageHere;
  static String chatSupport=AppLocalizations.of(MyApp.appContext)!.chatSupport;
  static String genTerms=AppLocalizations.of(MyApp.appContext)!.genTerms;
  static String genTermsInfo=AppLocalizations.of(MyApp.appContext)!.genTermsInfo;
  static String license=AppLocalizations.of(MyApp.appContext)!.license;
  static String defKey=AppLocalizations.of(MyApp.appContext)!.defKey;
  static String restriction=AppLocalizations.of(MyApp.appContext)!.restriction;
  static String payment=AppLocalizations.of(MyApp.appContext)!.payment;
  static String profile=AppLocalizations.of(MyApp.appContext)!.profile;
  static String language=AppLocalizations.of(MyApp.appContext)!.language;
  static String faqs=AppLocalizations.of(MyApp.appContext)!.faqs;
  static String terms=AppLocalizations.of(MyApp.appContext)!.terms;
  static String privacy=AppLocalizations.of(MyApp.appContext)!.privacy;
  static String logOut=AppLocalizations.of(MyApp.appContext)!.logOut;
  static String instruction=AppLocalizations.of(MyApp.appContext)!.instruction;
  static String understandableInstruction=AppLocalizations.of(MyApp.appContext)!.understandableInstruction;
  static String contactSupport=AppLocalizations.of(MyApp.appContext)!.contactSupport;
  static String youNeedHelp=AppLocalizations.of(MyApp.appContext)!.youNeedHelp;
  static String personalDetails=AppLocalizations.of(MyApp.appContext)!.personalDetails;
  static String bankDetails=AppLocalizations.of(MyApp.appContext)!.bankDetails;
  static String callRate=AppLocalizations.of(MyApp.appContext)!.callRate;
  static String chatRate=AppLocalizations.of(MyApp.appContext)!.chatRate;
  static String email=AppLocalizations.of(MyApp.appContext)!.email;
  static String firstName=AppLocalizations.of(MyApp.appContext)!.firstName;
  static String middleName=AppLocalizations.of(MyApp.appContext)!.middleName;
  static String lastName=AppLocalizations.of(MyApp.appContext)!.lastName;
  static String mobileNumber=AppLocalizations.of(MyApp.appContext)!.mobileNumber;
  static String mobile=AppLocalizations.of(MyApp.appContext)!.mobile;
  static String country=AppLocalizations.of(MyApp.appContext)!.country;
  static String city=AppLocalizations.of(MyApp.appContext)!.city;
  static String state=AppLocalizations.of(MyApp.appContext)!.state;
  static String skills=AppLocalizations.of(MyApp.appContext)!.skills;
  static String specialisation=AppLocalizations.of(MyApp.appContext)!.specialisation;
  static String desc=AppLocalizations.of(MyApp.appContext)!.desc;
  static String saveChanges=AppLocalizations.of(MyApp.appContext)!.saveChanges;
  static String bankName=AppLocalizations.of(MyApp.appContext)!.bankName;
  static String ifsc=AppLocalizations.of(MyApp.appContext)!.ifsc;
  static String accountNum=AppLocalizations.of(MyApp.appContext)!.accountNum;
  static String nameOnAccount=AppLocalizations.of(MyApp.appContext)!.nameOnAccount;
  static String requestToChange=AppLocalizations.of(MyApp.appContext)!.requestToChange;
  static String notificationSettings=AppLocalizations.of(MyApp.appContext)!.notificationSettings;
  static String pushNotification=AppLocalizations.of(MyApp.appContext)!.pushNotification;
  static String smsNotification=AppLocalizations.of(MyApp.appContext)!.smsNotification;
  static String emailNotification=AppLocalizations.of(MyApp.appContext)!.emailNotification;
  static String version=AppLocalizations.of(MyApp.appContext)!.version;
  static String profileUpdated="Profile updated successfully";
  static String bankUpdated="Bank details successfully";
  static String post="Post";
  static String experience="Experience";
  static String add="Add";
  static String call="Call";
  static String login="Login";
  static String settings="Settings";
  static String askForReview="Ask for review";
  static String community="Community";
  static String snaplorCommunity="Snaplor Community";
  static String communityProfile="Community Profile";
  static String sessions="Sessions";
  static String sessionsPrice="Session Price";
  static String following="Following";
  static String yourPost="Your Post";
  static String astrologer="Astrologer";
  static String astrologerProfile="Astrologer Profile";
  static String shareThought="Share your thought!";
  static String replying="Replaying to";
  static String termsDesc='''<p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:3pt;"><span style="font-size:26pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Terms &amp; conditions</span></p>
<p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">By using the Jyotishee App, you agree to the following terms and conditions. Please read them carefully.</span></p>
<p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:700;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Scope of Service</span></p>
<p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">The App provides a platform for Users to connect with Astrologers for astrological consultations through phone calls and chat. Astrologers can also post content for User interaction.</span></p>
<p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:700;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Payments to Astrologers</span></p>
<ul style="margin-top:0;margin-bottom:0;padding-inline-start:48px;">
    <li dir="ltr" style="list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;" aria-level="1">
        <p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Astrologers will be paid by the platform based on the number of minutes they engage in consultations with Users.</span></p>
    </li>
    <li dir="ltr" style="list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;" aria-level="1">
        <p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">The rate per minute will be specified in the Astrologer&apos;s dashboard or otherwise communicated by the platform.</span></p>
    </li>
    <li dir="ltr" style="list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;" aria-level="1">
        <p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Payments will be processed on a periodic basis, as determined by the platform.</span></p>
    </li>
</ul>
<p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:700;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Refunds to Users</span></p>
<ul style="margin-top:0;margin-bottom:0;padding-inline-start:48px;">
    <li dir="ltr" style="list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;" aria-level="1">
        <p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Refunds are made at the sole discretion of the platform. If a User believes they are entitled to a refund, they must raise a complaint within 12 hours of the consultation.</span></p>
    </li>
    <li dir="ltr" style="list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;" aria-level="1">
        <p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Refunds will not be given for dissatisfaction with astrological advice, but may be considered for technical issues that hindered the consultation.</span></p>
    </li>
</ul>
<p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:700;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Content Posted by Astrologers</span></p>
<ul style="margin-top:0;margin-bottom:0;padding-inline-start:48px;">
    <li dir="ltr" style="list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;" aria-level="1">
        <p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Astrologers are responsible for the content they post. The platform does not endorse or guarantee the accuracy of any content posted by Astrologers.</span></p>
    </li>
    <li dir="ltr" style="list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;" aria-level="1">
        <p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Content that violates any laws, promotes hate, violence, or discriminates against any group is strictly prohibited. Such content will be removed, and the Astrologer may be banned from the platform.</span></p>
    </li>
    <li dir="ltr" style="list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;" aria-level="1">
        <p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Users can interact with content shared by Astrologers. However, any harassment or inappropriate behavior will lead to the User&apos;s suspension or removal from the platform.</span></p>
    </li>
</ul>
<p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:700;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Removal of Astrologers</span></p>
<ul style="margin-top:0;margin-bottom:0;padding-inline-start:48px;">
    <li dir="ltr" style="list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;" aria-level="1">
        <p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">The platform reserves the right to remove an Astrologer for any reason, including but not limited to misconduct, fraudulent behavior, receiving consistent negative feedback, or violating the terms of this agreement.</span></p>
    </li>
    <li dir="ltr" style="list-style-type:disc;font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;" aria-level="1">
        <p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">In the event of removal, the Astrologer will be paid for all completed consultations up to the date of removal, unless the removal was due to fraudulent behavior.</span></p>
    </li>
</ul>
<p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:700;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Disclaimer</span></p>
<p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Astrological consultations and advice are for entertainment purposes only. The platform is not responsible for decisions made based on these consultations. Users are encouraged to exercise their judgment and discretion.</span></p>
<p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:700;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Indemnification</span></p>
<p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Users and Astrologers agree to indemnify and hold the platform harmless from any claims, damages, liabilities, or expenses arising out of their use of the Platform, their content, or any violation of these terms.</span></p>
<p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:700;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Changes to Terms and Conditions</span></p>
<p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">The platform reserves the right to modify these terms and conditions at any time. Users and Astrologers will be notified of significant changes and are responsible for reviewing the updated terms.</span></p>
<p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:700;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Governing Law and Jurisdiction</span></p>
<p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">These terms and conditions are governed by India,Delhi. Any disputes arising out of or relating to the platform will be subject to the jurisdiction of courts in Delhi.</span></p>
<p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:700;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">Contact</span></p>
<p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">For any queries or clarifications, please contact - admin@jyotishee.com</span></p>
<p dir="ltr" style="line-height:1.38;margin-top:0pt;margin-bottom:0pt;"><span style="font-size:11pt;font-family:Arial,sans-serif;color:#000000;background-color:transparent;font-weight:400;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre;white-space:pre-wrap;">By continuing to use the Jyotishee App, you confirm your acceptance of these terms and conditions.</span></p>
<p><br></p>''';
  static String privacyDesc='''<p>Privacy Policy for Jyotishee<br><br>&nbsp;Introduction<br><br>Welcome to Jyotishee, an interactive platform that connects users with astrologers through phone call and chat services. Your privacy is of utmost importance to us, and this Privacy Policy outlines the types of personal information we gather when you use Jyotishee, as well as our practices for collecting, using, maintaining, protecting, and disclosing that information.<br><br>By using Jyotishee, you consent to the data practices described in this policy. If you do not agree with the terms outlined here, please do not use the Jyotishee application.<br><br>&nbsp;Information We Collect<br><br>&nbsp;Personal Identification Information<br><br>- Name, Email Address, Phone Number: These are used to facilitate your user profile for communication, support, and billing purposes.<br><br>&nbsp;Technical Data<br><br>- Device Information, Location, IP Address: Collected for analytical, security, and service optimization purposes.<br><br>&nbsp;User Content<br><br>- Chat and Call Details: Your communications with astrologers through Jyotishee are saved for future reference and quality assurance.<br><br>&nbsp;How We Use the Information<br><br>- To provide and maintain Jyotishee services<br>- To offer customer support<br>- For billing and account management<br>- To improve Jyotishee services<br><br>&nbsp;Storage of Information<br><br>All personal information and chat/call details are securely stored in our encrypted databases.<br><br>&nbsp;Disclosure of Information<br><br>We do not sell, trade, or transfer your personally identifiable information to third parties. Exceptions include compliance with legal obligations, protection of our rights, or in the event of a merger, acquisition, or sale of assets.<br><br>&nbsp;Cookies and Tracking Technologies<br><br>We employ cookies and similar technologies to understand how you use Jyotishee and improve your experience.<br><br>&nbsp;Data Security<br><br>We employ industry-standard security measures to protect your data. However, no method of transmission or storage is 100% secure. Thus, while we strive to protect your personal data, we cannot guarantee its absolute security.<br><br>&nbsp;Children&apos;s Privacy<br><br>Jyotishee is not intended for users under the age of 18. We do not knowingly collect information from children under 18 years of age.<br><br>&nbsp;Changes to this Privacy Policy<br><br>We may revise this Privacy Policy from time to time. The updated version will be indicated by an updated &quot;Last Updated&quot; date and will be effective as soon as it is accessible.<br><br>&nbsp;Contact Us<br><br>If you have any questions regarding this Privacy Policy, please contact us at <a data-fr-linked="true" href="mailto:admin@jyotishee.com">admin@jyotishee.com</a><br><br>---<br><br>*This Privacy Policy is intended to serve as a guide. Consult with legal advisors to ensure compliance with all applicable laws.*<br><br><br><br></p>''';




}
