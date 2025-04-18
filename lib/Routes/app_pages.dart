import 'package:get/get.dart';
import 'package:gowri_seva_sangam/Screen/Community_Members/add_member_screen.dart';
import 'package:gowri_seva_sangam/Screen/Community_Members/community_members_list.dart';
import 'package:gowri_seva_sangam/Screen/Community_Members/comunity_members_view_by_id.dart';
import 'package:gowri_seva_sangam/Screen/Illustration/splash_screen.dart';
import 'package:gowri_seva_sangam/Screen/New%20Navgations%20pages/breadCrumb_examples.dart';
import 'package:gowri_seva_sangam/Screen/New%20Navgations%20pages/button_types.dart';
import 'package:gowri_seva_sangam/Screen/New%20Navgations%20pages/checkBox_models.dart';
import 'package:gowri_seva_sangam/Screen/New%20Navgations%20pages/date_picker_utils.dart';
import 'package:gowri_seva_sangam/Screen/New%20Navgations%20pages/default_dropdown_styles.dart';
import 'package:gowri_seva_sangam/Screen/New%20Navgations%20pages/different_type_datePicker.dart';
import 'package:gowri_seva_sangam/Screen/New%20Navgations%20pages/grid_example_part_2.dart';
import 'package:gowri_seva_sangam/Screen/New%20Navgations%20pages/grid_examples.dart';
import 'package:gowri_seva_sangam/Screen/New%20Navgations%20pages/other_dialog_widgets.dart';
import 'package:gowri_seva_sangam/Screen/New%20Navgations%20pages/pagination.dart';
import 'package:gowri_seva_sangam/Screen/New%20Navgations%20pages/popup_multi_select.dart';
import 'package:gowri_seva_sangam/Screen/New%20Navgations%20pages/stepper_widget.dart';
import 'package:gowri_seva_sangam/Screen/New%20Navgations%20pages/stepper_widget_2.dart';
import 'package:gowri_seva_sangam/Screen/New%20Navgations%20pages/tabbar_widget.dart';
import 'package:gowri_seva_sangam/Screen/New%20Navgations%20pages/text_fields.dart';
import 'package:gowri_seva_sangam/Screen/New%20Navgations%20pages/upload_document_ui_examples.dart';
import 'package:gowri_seva_sangam/Screen/Profile%20Screen/change_password_view.dart';
import 'package:gowri_seva_sangam/Screen/Profile%20Screen/profile_screen.dart';
import 'package:gowri_seva_sangam/Screen/Profile%20Screen/profile_view_screen.dart';
import 'package:gowri_seva_sangam/Screen/Profile%20Screen/responsive_profile_screen.dart';
import 'package:gowri_seva_sangam/Screen/Scaffold%20Custom%20Appbar/bottomNavigation_and_appbar_for_web.dart';
import 'package:gowri_seva_sangam/Screen/custom_dashBoard.dart';
import 'package:gowri_seva_sangam/Screen/login/login.dart';

part 'app_routes.dart';

/// contains all configuration pages
class AppPages {
  /// when the app is opened, this page will be the first to be shown

  static final pages = [
    GetPage(name: Routes.splashScreen, page: () => const SplashScreen(), transitionDuration: const Duration(milliseconds: 300)),
    GetPage(name: Routes.loginView, page: () => LoginView(), transitionDuration: const Duration(milliseconds: 300)),
    GetPage(name: Routes.dashBoardView, page: () =>  DashboardView(), transitionDuration: const Duration(milliseconds: 300)),
    GetPage(name: Routes.membersListScreen, page: () => const MembersList(), transitionDuration: const Duration(milliseconds: 300), transition: Transition.noTransition),
    GetPage(name: Routes.communityMembersViewById, page: () => const CommunityMembersViewById(), transitionDuration: const Duration(milliseconds: 300), transition: Transition.noTransition),
    GetPage(name: Routes.profileScreen, page: () => const ProfileScreen(), transitionDuration: const Duration(milliseconds: 300), transition: Transition.noTransition),
    GetPage(name: Routes.addMembers, page: () => AddCommunityMembers(), transitionDuration: const Duration(milliseconds: 300), transition: Transition.noTransition),
    GetPage(name: Routes.changePasswordView, page: () => const ChangePasswordView(), transitionDuration: const Duration(milliseconds: 300)),
    GetPage(name: '/moreScreen',page: () => MoreScreen(),transition: Transition.noTransition),
    GetPage(name: '/buttonTypes',page: () => ButtonTypes(),transition: Transition.noTransition),
    GetPage(name: '/textFieldsCommonFields',page: () => TextFieldsCommonFields(),transition: Transition.noTransition),
    GetPage(name: '/otherDialogWidgets',page: () => OtherDialogWidgets(),transition: Transition.noTransition),
    GetPage(name: '/profileScreenV2',page: () => ProfileScreenV2(),transition: Transition.noTransition),
    GetPage(name: '/responsiveProfileScreen',page: () => ResponsiveProfileScreen(),transition: Transition.noTransition),
    GetPage(name: '/datePickerUtils',page: () => DatePickerUtils(),transition: Transition.noTransition),
    GetPage(name: '/tabBarScreen',page: () => TabBarScreen(),transition: Transition.noTransition),
    GetPage(name: '/paginationExamples',page: () => PaginationExamples(),transition: Transition.noTransition),
    GetPage(name: '/stepperWidgetExamples',page: () => StepperWidgetExamples(),transition: Transition.noTransition),
    GetPage(name: '/antDesignStepperExampleScreen',page: () => AntDesignStepperExampleScreen(),transition: Transition.noTransition),
    GetPage(name: '/checkboxExamples',page: () => CheckboxExamples(),transition: Transition.noTransition),
    GetPage(name: '/antDatePickerDemoScreen',page: () => AntDatePickerDemoScreen(),transition: Transition.noTransition),
    GetPage(name: '/girdExamples',page: () => GirdExamples(),transition: Transition.noTransition),
    GetPage(name: '/responsiveGridExample',page: () => ResponsiveGridExample(),transition: Transition.noTransition),
    GetPage(name: '/defaultDropdownStyles',page: () => DefaultDropdownStyles(),transition: Transition.noTransition),
    GetPage(name: '/popUpMultiSelect',page: () => PopUpMultiSelect(),transition: Transition.noTransition),
    GetPage(name: '/breadcrumbFucntion',page: () => BreadcrumbFucntion(), transition: Transition.noTransition),
    GetPage(name: '/seconsdPageScreen',page: () => SeconsdPageScreen(), transition: Transition.noTransition),
    GetPage(name: '/thirdPageScreen',page: () => ThirdPageScreen(), transition: Transition.noTransition),

    GetPage(name: '/uploadDocumentUiExamples',page: () => UploadDocumentUiExamples(), transition: Transition.noTransition),

  ];
}