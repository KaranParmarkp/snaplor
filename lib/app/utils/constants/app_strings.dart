import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jyotishee/main.dart';
class AppStrings {
  static String appName = "Jyotishee";
  static String appPrefName = "Jyotishee";
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


  static const String enterPass= "Enter Password";
  static const String enterAddress= "Enter Address";
  static const String welcomeBack= "Welcome back!";
  static const String loginTojyotishee= "Log in to your Quinable account";
  static const String emailMobileNumber= "Email/Mobile Number";
  static const String password= "Password";
  static const String forgotPassword= "Forgot Password?";
  static const String signIn= "SIGN IN";
  static const String login= "Log In";
  static const String signUp= "SIGN UP";
  static const String orUseTouchId= "Or Use Touch Id";
  static const String touchId= "Touch ID";
  static const String loginViaSMS= "Login in via SMS verification code";
  static const String loginViaPassword= "Login in via Quinable password";
  static const String dontHaveAccount= "Don't have an account?";
  static const String newToQuinable= "New to Quinable";
  static const String haveAnAccount= "Have an account";
  static const String submit= "SUBMIT";
  static const String verificationCode= "Verification Code";
  static const String verification= "Verification";
  static const String newPassword= "New Password";
  static const String confirmNewPassword= "Confirm New Password";
  static const String confirmPassword= "Confirm Password";
  static const String createAcc= "Create Account";
  static const String fillBasicInfo= "Fill in your basic information";
  static const String next= "NEXT";
  static const String notFoundCompany= "Not found your company? Click here to input your company info.";

  static const String providerName= "Provider's Name/Email";
  static const String company= "Company";
  static const String inputCompany= "Input Your\nCompany Info";
  static const String companyName= "Company Name";
  static const String facilityType= "Facility Type";
  static const String industry= "Industry";
  static const String timezone= "Timezone";
  static const String location= "Location";
  static const String addressLine1= "Address Line 1";
  static const String addressLine2= "Address Line 2 (Optional)";
  static const String zipCode= "Zipcode";
  static const String companyPhone = "Company Phone";
  static const String phone = "Company Phone";
  static const String compEmail = "Company Email";
  static const String websiteURL = "Website URL";
  static const String logo = "Logo";
  static const String companyPhoto = "Company photo";
  static const String byChecking = "By checking this box, I confirm I have read and agree the";
  static const String serviceAgreement = " Service Agreement";
  static const String registerSuccessfully = "Registered Successfully！";
  static const String yourAccountSuccessfully = "Your account has been successfully registered, Our staff will contact you for verification";
  static const String finish = "FINISH";
  static const String camera = "Camera";
  static const String gallery = "Gallery";
  static const String reviewed = "I REVIEWED AND AGREE";
  static const String dashboard = "Dashboard";
  static const String monitor = "Monitor";
  static const String schedule = "Schedule";
  static const String provider = "Provider";
  static const String todo = "To Do";
  static const String acceptBids = "Accept\nBids";
  static const String approveTimes = "Approve\nTimes";
  static const String callOff = "Call Off\n";
  static const String todayShifts = "Today's Shifts";
  static const String totalShifts = "Total Shifts";
  static const String unfilledShifts = "Unfilled Shifts";
  static const String filledShifts = "Filled Shifts";
  static const String completedShifts = "Completed Shifts";
  static const String openShifts = "Open Shifts";
  static const String missedShifts = "Missed Shifts";
  static const String tommShifts = "Tomorrow's Shifts";
  static const String creditsAvailable = "Credit Available";
  static const String more = "More";
  static const String shiftList = "Shift List";
  static const String approveTimesDrawer = "Approve Times";
  static const String settings = "Settings";
  static const String support = "Support";
  static const String logout = "Log out";
  static const String suspendedList = "Suspended List";
  static const String aboutUs = "About Us";
  static const String appVersion = "App Version";
  static const String contactUs = "Contact Us";
  static const String touchDesc = "Contact Us";
  static const String supportTicket = "Support Request";
  static const String faq = "FAQ";
  static const String enableTouchId = "Please enable touch Id from settings";
  static const String ok = "Ok";
  static const String OK = "OK";
  static const String text = "Text";
  static const String call = "Call";
  static const String issueDate = "Issue Date";
  static const String dateTime = "Date Time";
  static const String expireDate = "Expire Date";
  static const String experience = "Experience";
  static const String licenses = "Licenses";
  static const String credDoc = "Credential Documents";
  static const String resume = "Resume";
  static const String reliabStats = "Reliability Stats (Last 90 Days)";
  static const String shiftsOnTime = "Shifts On Time";
  static const String lateCall = "Late Call Offs";
  static const String noCalls = "No Call No Show";
  static const String fav = "Favorite";
  static const String suspended = "Suspended";
  static const String favListSuccess = "Favorite list added successfully";
  static const String providerSuspended = "Provider suspended";
  static const String favName = "Favorite name";
  static const String close = "Close";
  static const String cancel = "Cancel";
  static const String youDidnCreate = "You didn't create a favorite group. Do you want to create a favorite group?";
  static const String create = "Create";
  static const String sure = "Sure";
  static const String favoriteList = "Favorite List";
  static const String add = "Add";
  static const String suspendProvider = "Suspend Provider";
  static const String allowWorkAccepted = "No bid on new shift, allow work accepted shifts";
  static const String autoReject = "No bid on new shift, auto-reject all accepted shifts";
  static const String autoRejectAllAccepted = "Auto-reject all accepted shifts, no access to the platform indefinitely";
  static const String suspendedStartDate = "Suspend Start Date ";
  static const String suspendedEndDate = "Suspend End Date ";
  static const String endDate = "End Date ";
  static const String suspendReason = "Suspend Reason";
  static const String suspendType = "Suspend Type";
  static const String notice = "Notice";
  static const String shiftDetails = "Shift Details";
  static const String preview = "Preview";
  static const String edit = "Edit";
  static const String done = "Done";
  static const String pending = "Pending";
  static const String speciality = "Speciality";
  static const String subSpeciality = "Sub Speciality";
  static const String matching = "Matching";
  static const String proLicence = "Professional Licences";
  static const String publishedRate = "Published Rate";
  static const String unpaidBreak = "Unpaid Break Time：";
  static const String bonus = "Bonus";
  static const String proBidCap = "Provider Bid Cap";
  static const String need = "Need";
  static const String filled = "Filled";
  static const String description = "Description";
  static const String startDateTime = "Start Date Time";
  static const String endDateTime = "End Date Time";
  static const String shiftConfType = "Shift Confirmation Type :";
  static const String providerRateCap = "Provider Rate Cap：";
  static const String instantConfirmed = "Instant confirmed";
  static const String facilityConfirmed = "Facility confirmed";
  static const String showingShiftTo = "Showing the shift to :";
  static const String shiftTemplateSave = "Shift Template Save ?";
  static const String additionalShift = "Additional Shift Requirements";
  static const String providerList = "Provider List";
  static const String accepted = "Accepted";
  static const String rejected = "Rejected";
  static const String callOf = "Call Off";
  static const String callOfTime = "Call Off time:";
  static const String noDataAvailable = "No Data Available";
  static const String facLoc = "Facility(Location)";
  static const String pleaseSelect = "Please select";
  static const String status = "Status";
  static const String shiftType = "Shift Type";
  static const String clockIn = "Clock In:";
  static const String clockOut = "Clock Out：";
  static const String breakTime = "Break Time:";
  static const String brTime = "Break Time";
  static const String brStartTime = "Break Start Time";
  static const String brEndTime = "Break End Time";
  static const String extendTime = "Extend Time:";
  static const String finalTime = "Final Time:";
  static const String reject = "Reject:";
  static const String approve = "Approve:";
  static const String noCallNoShow = "No Call No Show";
  static const String addTime = "Add Time";
  static const String reason = "Reason";
  static const String rating = "Rating";
  static const String feedback = "Feedback";
  static const String enterFeedback = "Enter Feedback";
  static const String wantPerformance = "Want to add a performance bonus?";
  static const String enterPerformance = "Enter performance bonus";
  static const String isItMarkedNCNS = "Is it marked as no call\nno show?";
  static const String clockInLessThanClockOut = "The clock in time should be less than clock out time";
  static const String clockOutGreaterThanClockIn = "The clock out time should be larger than clock in time";
  static const String breakTimeShouldBeLess = "Break time should be less than the shift timing";
  static const String recProvider = "Recommended Providers";
  static const String creditProfile = "Credit Profile";
  static const String creditLine = "Credit Line";
  static const String creditAvailable = "Credit Available";
  static const String creditSpend = "Credit Spend";
  static const String outInvoice = "Outstanding Invoices";
  static const String unInvoiceTime = "UnInvoices Timesheets";
  static const String runningShifts = "Running Shifts";


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





}
