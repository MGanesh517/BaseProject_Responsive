// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppConstants {
  static ThemeConstants themeConstants = ThemeConstants();
  // static ThemeStyles themeStyles = ThemeStyles();

//special characters
  static final dollarSign = String.fromCharCodes(Runes('\u0024'));
  //date format
  static final dateFormat = DateFormat('MM/dd/yyyy');
}

class ThemeConstants {
  ThemeConstants();

  // //font family
  // String fontFamily = 'Montserrat';
  // double lineSpace = (1.8 / 896);

  // double topGap = (65 / 896); // 13.4px
  // double loginTopGap = (89 / 896); // 81px

  // double iconHeight = (24 / 896);
  // double iconWidth = (24 / 414);

  // //logo size with position
  // double topLogoHight = (4.4 / 896); //53px
  // double primaryColorlogoHight = (42 / 896); //42px
  // double primaryColorlogoWidth = (168.02 / 414); //168.02px
  // double introSlideHight = (7 / 896); //53px

  // // FRIZZMO APP ICON
  // double whiteColorLogoWidth = (216.02 / 414); //216PX
  // double whiteColorLogoHeight = (54 / 896); //86.91px

  // double buttonPositionFromTop = 0.866;
  // double enabelbuttonFromTop = (743 / 896);

  // // Side Menu
  // double sideMenuIconHeight = (24 / 896);
  // double sideMenuIconWidth = (24 / 414);

  // //Quick Menu
  // double quickMenuIconCircle = (56 / 896);
  // double quickMenuIconHeight = (24 / 896);
  // double quickMenuIconWidth = (24 / 414);
  // double iconSize = (24 / 896);

  // // suffixIcon
  // double suffixIconWidth = 9;
  // double suffixIconHeight = 18.4;
  // double suffixIconSize = (24 / 896);

  // //Bottom Sheet Radius
  // double bottomSheetRadius = (20 / 896);

  // // Redio Button size
  // double radioButtonSize = 1.3;
  // Color radioButtonColor = const Color.fromRGBO(3, 166, 120, 1.0);

  // // CheCkBox
  // double checkBoxSize = 24;
  // Color checkBoxColor = const Color.fromRGBO(0, 0, 0, 1.0);
  // double checkBoxRadius = 2;

  // //Switch
  Color succesColor = const Color.fromRGBO(23, 135, 28, 1.0);

  // // Screen Padding
  // double screenpadding = (15 / 414);

  // // Button size with position
  // double fullButtonHeight = (50 / 896);
  // double fullButtonWidth = (350 / 414);
  // double smallButtonWidth = (160 / 414);
  // double buttomBtnPosition = (6 / 896);
  // double buttomSheetBtnPosition = (75 / 896);
  // double buttonBorderRadius = 25;

  // double buttomBtnPosition_10 = (10 / 896);

  // //PinCodeTextField
  // double pinBoxHeight = 49;
  // double pinBoxWidth = 40;

  // height
  double height_2 = (2 / 896); //2px
  double height_3 = (3 / 896); //3px
  double height_4 = (4 / 896); //4px
  double height_5 = (5 / 896); //5px
  double height_6 = (6 / 896); //6px
  double height_7 = (7 / 896); //7px
  double height_8 = (8 / 896); //8px
  double height_8_7 = (8.7 / 896); //8px
  double height_9 = (9 / 896); //9px
  double height_10_5 = (10.5 / 896); //10px
  double height_10 = (10 / 896); //10px
  double height_11 = (11 / 896); //11px
  double height_12 = (12 / 896); //12px
  double height_13 = (13 / 896); //13px
  double height_14 = (14 / 896); //14px
  double height_15 = (15 / 896); //15px
  double height_16 = (16 / 896); //16px
  double height_17 = (17 / 896); //17px
  double height_18 = (18 / 896); //18px
  double height_19 = (19 / 896); //19px
  double height_20 = (20 / 896); //20px
  double height_21 = (21 / 896); //21px
  double height_22 = (22 / 896); //22px
  double height_24 = (24 / 896); //24px
  double height_23 = (23 / 896); //23px
  double height_24_1 = (24.1 / 896); //24.1px
  double height_25 = (25 / 896); //25px
  double height_26 = (26 / 896); //26px
  double height_27 = (27 / 896); //27px
  double height_28 = (28 / 896); //28px
  double height_29 = (29 / 896); //29px
  double height_30 = (30 / 896); //30px
  double height_31 = (31 / 896); //31px
  double height_32 = (32 / 896); //32px
  double height_33 = (33 / 896); //33px
  double height_34 = (34 / 896); //34px
  double height_35 = (35 / 896); //35px
  double height_37 = (37 / 896); //37px
  double height_38 = (38 / 896); //38px
  double height_39 = (39 / 896); //39px
  double height_40 = (40 / 896); //40px
  double height_42 = (42 / 896); //42px
  double height_43 = (43 / 896); //43px
  double height_44 = (44 / 896); //44px
  double height_45 = (45 / 896); //45px
  double height_46 = (46 / 896); //46px
  double height_47 = (47 / 896); //47px
  double height_49 = (49 / 896); //49px
  double height_50 = (50 / 896); //50px
  double height_51 = (51 / 896); //51px
  double height_52 = (52 / 896); //52px
  double height_53 = (53 / 896); //53px
  double height_57 = (57 / 896); //57px
  double height_58 = (58 / 896); //58px
  double height_59 = (59 / 896); //59px
  double height_60 = (60 / 896); //60px
  double height_61 = (61 / 896); //61px
  double height_63 = (63 / 896); //63px
  double height_64 = (64 / 896); //64px
  double height_65 = (65 / 896); //64px
  double height_66 = (66 / 896); //64px
  double height_68 = (68 / 896); //57px
  double height_70 = (70 / 896); //70px
  double height_71 = (71 / 896); //70px
  double height_72 = (72 / 896); //72px
  double height_73 = (73 / 896); //73px
  double height_74 = (74 / 896); //74px
  double height_75 = (75 / 896); //75px
  double height_80 = (80 / 896); //80px
  double height_81 = (81 / 896); //81px
  double height_86 = (86 / 896); //86px
  double height_87 = (87 / 896); //87px
  double height_90 = (90 / 896); //93px
  double height_93 = (93 / 896); //93px
  double height_94 = (94 / 896); //94px
  double height_97 = (97 / 896); //97px
  double height_100 = (100 / 896); //100px
  double height_102 = (102 / 896); //102px
  double height_107 = (107 / 896); //107px
  double height_108 = (108 / 896); //108px
  double height_109 = (109 / 896); //109px
  double height_110 = (110 / 896); //110px
  double height_114 = (114 / 896); //114px
  double height_115 = (115 / 896); //115px
  double height_116 = (116 / 896); //116px
  double height_117 = (117 / 896); //117px
  double height_125 = (125 / 896); //125px
  double height_140 = (140 / 896); //140px
  double height_144 = (144 / 896); //144px
  double height_145 = (145 / 896); //145px
  double height_163 = (163 / 896); //163px
  double height_166 = (166 / 896); //166px
  double height_168 = (168 / 896); //168px
  double height_173 = (173 / 896); //173px
  double height_183 = (183 / 896); //183px
  double height_185 = (185 / 896); //185px
  double height_187 = (187 / 896); //187px
  double height_188 = (188 / 896); //188px
  double height_191 = (191 / 896); //191px
  double height_192 = (192 / 896); //192px
  double height_228 = (228 / 896); //228px
  double height_231_2 = (231.2 / 896); //231.2px

  // WIDTH
  double width_2 = (2 / 414); //2px
  double width_3 = (3 / 414); //3px
  double width_4 = (4 / 414); //4px
  double width_5 = (5 / 414); //5px
  double width_6 = (6 / 414); //6px
  double width_7 = (7 / 414); //7px
  double width_8 = (8 / 414); //8px
  double width_8_7 = (8.7 / 414); //8.7px
  double width_9 = (9 / 414); //9px
  double width_10_5 = (10.5 / 414); //10px
  double width_10 = (10 / 414); //10px
  double width_11 = (11 / 414); //11px
  double width_12 = (12 / 414); //12px
  double width_13 = (13 / 414); //13px
  double width_14 = (14 / 414); //14px
  double width_15 = (15 / 414); //15px
  double width_16 = (16 / 414); //16px
  double width_17 = (17 / 414); //17px
  double width_18 = (18 / 414); //18px
  double width_19 = (19 / 414); //19px
  double width_20 = (20 / 414); //20px
  double width_27 = (27 / 414); //27px
  double width_39 = (39 / 414); //39px
  double width_51 = (51 / 414); //51px
  double width_70 = (70 / 414); //70px
  double width_81 = (81 / 414); //81px
  double width_88 = (88 / 414); //88px
  double width_97 = (97 / 414); //97px

  // FONT SIZE IN PERCENTAGES
  double fontsize_2 = (2 / 896); //2px
  double fontsize_10 = (10 / 896); //10px
  double fontsize_12 = (12 / 896); //12px
  double fontsize_13 = (13 / 896); //13px
  double fontsize_14 = (14 / 896); //14PX
  double fontsize_15 = (15 / 896); //15px
  double fontsize_16 = (16 / 896); //16px
  double fontsize_17 = (17 / 896); //17PX
  double fontsize_18 = (18 / 896); //18px
  double fontsize_19 = (19 / 896); //19px
  double fontsize_20 = (20 / 896); //20px
  double fontsize_21 = (21 / 896); //21px
  double fontsize_22 = (22 / 896); //22px
  double fontsize_23 = (23 / 896); //23px
  double fontsize_24 = (24 / 896); //23px
  double fontsize_25 = (25 / 896); //25px
  double fontsize_26 = (26 / 896); //26px
  double fontsize_27 = (27 / 896); //27px
  double fontsize_28 = (28 / 896); //28px
  double fontsize_30 = (30 / 896); //30px
  double fontsize_32 = (32 / 896); //32px
  double fontsize_33 = (33 / 896); //32px
  double fontsize_38 = (38 / 896); //38px
  double fontsize_40 = (40 / 896); //40px
  double fontsize_42 = (42 / 896); //42px
  double fontsize_50 = (50 / 896); //50px
  double fontsize_60 = (60 / 896); //60px
  double fontsize_70 = (70 / 896); //70px
  double fontsize_78 = (78 / 896); //78px
  double fontsize_80 = (80 / 896); //78px

  //font sizes
  double placeholderSize = (21 / 896); //21px
  double inputTextSize = (21 / 896); // 21px
  double hintTextSize = (16 / 896);

  //---------------------------------------------------------------------------------------------------------------------------

  double textFieldHeight = 0.063616; //57px

  // Textfield box
  double textFeildContentPadding = 0.018415; //16.5px
  double textFieldContentPadding = 0.017857; //16px

  // Between two text fields
  double textSpaceHeight = 0.0613839; //55px
  double textFieldSpace = 0.031; //28px

  // Starting with height and width
  double topGap63 = 0.070; // 63.5px
  double frizzmoIconTopPadd = 0.034; // 30.5px
  double topPaddFrizzmo = 0.03738; //33.5px

  double buttonCard = 0.888;

  double termsScrollHegiht = 0.846;

  double loginSlidetitlePadding = 5.099; //37.5PX

  // Card
  double cardWidth = 0.81642; //338px
  double cardWidth_375 = 0.90579; //375px
  double cardHeight = 0.08816; //79px
  double cardHeight_122 = 0.133928; //120px
  double cardHeight_60 = 0.06696; //60px
  double cardHeight_82 = 0.09151; //60px
  double cardHeight_40 = 0.04464; //60px
  double cardHeight_70 = 0.078125; //70px

  // ICON SIZE
  double iconSize_23 = 0.025669; //23px
  double iconSize_25 = 0.02790179; //25px
  double iconSize_24 = 0.02678; //24.1px
  double iconSize_50 = 0.055803; //50px
  double iconSize_29 = 0.032366; //29px

  // WIDTH
  double leftWidth_44 = 0.10628; //44px
  double roghtWidth_69 = 0.1666; //69px

  double leftWidth_36 = 0.08695; //36px
  double leftWidth_38 = 0.09178; //38px
  double rigthWidth_38 = 0.09178; //38px
  double leftWidth_32 = 0.07850; //32.5px
  double leftWidth_25 = 0.060386; //25px
  double leftWidth_34 = 0.08212; //34px
  double rigthWidth_34 = 0.08333; //34.5px
  double rigthWidth_49 = 0.11835; //49px

  // LetterSpacing
  double letterSpacing_0 = 0.0;
  double letterSpacing_010 = (-0.10 / 414);
  double letterSpacing_10 = (0.10 / 414);
  double letterSpacing_060 = 0.6071428756713867;
  double letterSpacing_040 = -0.40800000000000003;
  double letterSpacing_071 = 0.7142887878417968;
  double letterSpacing_016 = -0.16;
  double letterSpacing_017 = -0.17;
  double letterSpacing_018 = -0.18;
  double letterSpacing_038 = -0.384;
  double letterSpacing_084 = 0.84;
  double letterSpacing_02 = -0.2;
  double letterSpacing_021 = -0.21;
  double letterSpacing_026 = -0.26;
  double letterSpacing_050 = 0.5000000152587891;
  double letterSpacing_057 = 0.5714285888671875;
  double letterSpacing_053 = 0.5357143020629883;
  double letterSpacing_043 = -0.432;
  double letterSpacing_187 = -1.872;
  double letterSpacing_076 = 0.76;
  double letterSpacing_012 = -0.12;
  double letterSpacing_049 = 0.49994;
  double letterSpacing_025 = 0.25;
  double letterSpacing_096 = -0.96;
  double letterSpacing_048 = -0.48;
}

// class ThemeStyles {
//   ThemeStyles();
//   BoxDecoration gradientDecoration = BoxDecoration(
//     gradient: LinearGradient(
//       begin: Alignment.topCenter,
//       end: Alignment.bottomCenter,
//       colors: [AppConstants.themeConstants.appBGColor, AppConstants.themeConstants.whiteColor],
//     ),
//   );
//   // TextStyles
//   TextStyle primaryColorTitle = TextStyle(
//     fontSize: Get.height * AppConstants.themeConstants.fontsize_26,
//     color: AppConstants.themeConstants.primaryColor,
//     fontWeight: FontWeight.w600,
//     letterSpacing: AppConstants.themeConstants.letterSpacing_010,
//   );
//   TextStyle primaryColorTitleBold = TextStyle(
//     color: AppConstants.themeConstants.primaryColor,
//     fontSize: Get.height * AppConstants.themeConstants.fontsize_26,
//     fontWeight: FontWeight.bold,
//   );
//   TextStyle blackColorTitle = TextStyle(
//     fontSize: Get.height * AppConstants.themeConstants.fontsize_26,
//     color: AppConstants.themeConstants.blackColor,
//     fontWeight: FontWeight.w600,
//     letterSpacing: AppConstants.themeConstants.letterSpacing_010,
//   );
//   TextStyle primaryBtnText = TextStyle(
//     color: AppConstants.themeConstants.primaryColor,
//     fontSize: Get.height * AppConstants.themeConstants.fontsize_18,
//     fontWeight: FontWeight.w600,
//     letterSpacing: AppConstants.themeConstants.letterSpacing_018,
//   );
//   TextStyle whiteBtnText = TextStyle(
//     color: AppConstants.themeConstants.whiteColor,
//     fontSize: Get.height * AppConstants.themeConstants.fontsize_18,
//     fontWeight: FontWeight.w600,
//     letterSpacing: AppConstants.themeConstants.letterSpacing_018,
//   );
//   TextStyle greyBtnText = TextStyle(
//     color: const Color.fromRGBO(176, 176, 176, 1),
//     fontSize: Get.height * AppConstants.themeConstants.fontsize_18,
//     fontWeight: FontWeight.w600,
//   );
//   TextStyle blackBtnText = TextStyle(
//     color: AppConstants.themeConstants.blackColor,
//     fontSize: Get.height * AppConstants.themeConstants.fontsize_18,
//     fontWeight: FontWeight.w600,
//   );
//   TextStyle greyColorSmallText = TextStyle(
//     height: Get.height * AppConstants.themeConstants.lineSpace,
//     color: AppConstants.themeConstants.appGreyColor,
//     fontSize: Get.height * AppConstants.themeConstants.fontsize_13,
//     fontWeight: FontWeight.normal,
//     letterSpacing: 0.464,
//   );
//   TextStyle primaryColorLinkText_13 = TextStyle(
//     color: AppConstants.themeConstants.primaryColor,
//     fontSize: Get.height * AppConstants.themeConstants.fontsize_13,
//     fontWeight: FontWeight.w600,
//     letterSpacing: 0.264,
//   );
//   TextStyle blackColorHeaderText_20 = TextStyle(
//     color: AppConstants.themeConstants.blackColor,
//     fontSize: Get.height * AppConstants.themeConstants.fontsize_20,
//     fontWeight: FontWeight.w600,
//   );
//   TextStyle blackColorSubHeaderText_15 = TextStyle(
//     color: AppConstants.themeConstants.blackColor,
//     fontSize: Get.height * AppConstants.themeConstants.fontsize_15,
//     fontWeight: FontWeight.normal,
//   );
//   TextStyle blackColorSubHeaderText_13 = TextStyle(
//     color: AppConstants.themeConstants.blackColor,
//     fontSize: Get.height * AppConstants.themeConstants.fontsize_13,
//     fontWeight: FontWeight.normal,
//   );
//   TextStyle blackColorHeaderText = TextStyle(
//     color: AppConstants.themeConstants.blackColor,
//     fontSize: Get.height * AppConstants.themeConstants.fontsize_26,
//     fontWeight: FontWeight.w600,
//   );
//   TextStyle walletQuestionsHeaderText = TextStyle(
//     color: AppConstants.themeConstants.blackColor,
//     fontSize: Get.height * AppConstants.themeConstants.fontsize_24,
//     fontWeight: FontWeight.w600,
//   );
//   TextStyle blackColorSubHeaderText = TextStyle(
//     color: AppConstants.themeConstants.blackColor,
//     fontSize: Get.height * AppConstants.themeConstants.fontsize_17,
//     fontWeight: FontWeight.normal,
//   );
//   TextStyle primaryColorSubText = TextStyle(
//     color: AppConstants.themeConstants.primaryColor,
//     fontSize: Get.height * AppConstants.themeConstants.fontsize_15,
//     fontWeight: FontWeight.w600,
//     letterSpacing: AppConstants.themeConstants.letterSpacing_016,
//   );
//   TextStyle greyColorTextContent = TextStyle(
//     color: AppConstants.themeConstants.termsgreyColor,
//     fontSize: Get.height * AppConstants.themeConstants.fontsize_16,
//     fontWeight: FontWeight.normal,
//   );
//   TextStyle blackColorTextContent = TextStyle(
//     color: AppConstants.themeConstants.blackColor,
//     fontSize: Get.height * AppConstants.themeConstants.fontsize_14,
//     fontWeight: FontWeight.normal,
//   );
//   TextStyle blackColorTextContent_16 = TextStyle(
//     color: AppConstants.themeConstants.blackColor,
//     fontSize: Get.height * AppConstants.themeConstants.fontsize_16,
//     fontWeight: FontWeight.normal,
//   );
//   TextStyle blackColorTextContentwithLineSpace = TextStyle(
//     height: Get.height * (1.3 / 896),
//     color: AppConstants.themeConstants.blackColor,
//     fontSize: Get.height * AppConstants.themeConstants.fontsize_14,
//     fontWeight: FontWeight.normal,
//   );
//   TextStyle whiteColorTextContent = TextStyle(
//     color: AppConstants.themeConstants.whiteColor,
//     fontSize: Get.height * AppConstants.themeConstants.fontsize_16,
//     fontWeight: FontWeight.w500,
//   );
//   TextStyle whiteColorTextContentWithLineSpace = TextStyle(
//     height: Get.height * AppConstants.themeConstants.lineSpace,
//     color: AppConstants.themeConstants.whiteColor,
//     fontSize: Get.height * AppConstants.themeConstants.fontsize_16,
//     fontWeight: FontWeight.w500,
//   );
//   TextStyle textFiledTitle = TextStyle(
//     color: AppConstants.themeConstants.blackColor,
//     fontSize: Get.height * AppConstants.themeConstants.fontsize_14,
//     fontWeight: FontWeight.w600,
//   );
//   TextStyle textFiledTitleDisable = TextStyle(
//     color: const Color.fromRGBO(206, 206, 206, 1.0),
//     fontSize: Get.height * AppConstants.themeConstants.fontsize_14,
//     fontWeight: FontWeight.w600,
//   );
//   TextStyle textFiledWithEntry = TextStyle(
//     fontWeight: FontWeight.w300,
//     color: AppConstants.themeConstants.blackColor,
//     fontSize: Get.height * AppConstants.themeConstants.fontsize_20,
//   );
//   TextStyle textFiledHintText = TextStyle(
//     fontWeight: FontWeight.w300,
//     color: const Color.fromRGBO(206, 206, 206, 1.0),
//     fontSize: Get.height * AppConstants.themeConstants.fontsize_20,
//   );
//   TextStyle errorTextFiled = TextStyle(
//     color: AppConstants.themeConstants.redColor,
//     fontSize: Get.height * AppConstants.themeConstants.fontsize_14,
//     fontWeight: FontWeight.normal,
//   );

//   TextStyle errorTextFiledWithLineSpace = TextStyle(
//     height: Get.height * AppConstants.themeConstants.lineSpace,
//     color: AppConstants.themeConstants.redColor,
//     fontSize: Get.height * AppConstants.themeConstants.fontsize_14,
//     fontWeight: FontWeight.normal,
//   );
//   TextStyle primaryColorLinkText = TextStyle(
//     color: AppConstants.themeConstants.primaryColor,
//     fontSize: Get.height * AppConstants.themeConstants.fontsize_17,
//     fontWeight: FontWeight.w600,
//   );
//   TextStyle menuText = TextStyle(
//     fontWeight: FontWeight.w500,
//     fontSize: Get.height * AppConstants.themeConstants.fontsize_17,
//     color: const Color.fromRGBO(74, 74, 74, 1.0),
//   );
//   TextStyle notificationSideMenuText = TextStyle(
//     fontWeight: FontWeight.w500,
//     fontSize: Get.height * AppConstants.themeConstants.fontsize_16,
//     color: const Color.fromRGBO(70, 70, 70, 1.0),
//   );
//   TextStyle menuSubtitleText = TextStyle(
//     fontWeight: FontWeight.normal,
//     fontSize: Get.height * AppConstants.themeConstants.fontsize_14,
//     color: AppConstants.themeConstants.blackColor,
//   );
//   TextStyle appBarTitle = TextStyle(
//     color: AppConstants.themeConstants.blackColor,
//     fontSize: Get.height * AppConstants.themeConstants.fontsize_20,
//     fontWeight: FontWeight.w600,
//   );
//   TextStyle appBarTitleWhite = TextStyle(
//     color: AppConstants.themeConstants.whiteColor,
//     fontSize: Get.height * AppConstants.themeConstants.fontsize_20,
//     fontWeight: FontWeight.w600,
//   );
//   TextStyle quickMenuTitle = TextStyle(
//     color: AppConstants.themeConstants.blackColor,
//     fontSize: Get.height * AppConstants.themeConstants.fontsize_24,
//     fontWeight: FontWeight.w800,
//   );
//   TextStyle underLineTextPrimary = TextStyle(
//     // decoration: TextDecoration.underline,
//     color: AppConstants.themeConstants.primaryColor,
//     fontWeight: FontWeight.normal,
//     fontSize: Get.height * AppConstants.themeConstants.fontsize_15,
//   );
// }
