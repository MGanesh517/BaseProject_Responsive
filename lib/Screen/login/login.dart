
// import 'package:expand_tap_area/expand_tap_area.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';
// import 'package:gowri_seva_sangam/App%20Constants/app_constants.dart';
// import 'package:gowri_seva_sangam/Common%20Components/Common%20Widgets/custom_appbar.dart';
// import 'package:gowri_seva_sangam/Common%20Components/Common%20Widgets/done_widget.dart';
// import 'package:gowri_seva_sangam/Common%20Components/Common%20Widgets/priamaryGradientCOntainer.dart';
// import 'package:gowri_seva_sangam/Common%20Components/common_input_fields.dart';
// import 'package:gowri_seva_sangam/Screen/login/Controller/controller.dart';
// import 'package:keyboard_actions/keyboard_actions.dart';

// class LoginView extends StatefulWidget {
//   const LoginView({super.key});

//   @override
//   State<LoginView> createState() => _LoginViewState();
// }

// class _LoginViewState extends State<LoginView> {
//   final controller = Get.put(LoginController());
//   GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   final focusNodes = Iterable<int>.generate(2).map((_) => FocusNode()).toList();
//   @override
//   Widget build(BuildContext context) {
//     return PopScope(
//         canPop: false,
//         child: Scaffold(
//           appBar: CustomAppBar(
//             height: 0.0,
//           ),
//             body: GetBuilder<LoginController>(
//                 initState: (_) => LoginController.to.initState(),
//                 builder: (value) =>  SafeArea(
//                       bottom: false,
//                       child: KeyboardActions(
//                           tapOutsideBehavior: TapOutsideBehavior.none,
//                           config: KeyboardActionsConfig(
//                             nextFocus: true,
//                             defaultDoneWidget: const DoneWidget(),
//                             actions: focusNodes.map((focusNode) => KeyboardActionsItem(focusNode: focusNode)).toList(),
//                           ),
//                           child: Stack(children: [
//                             Positioned(
//                               bottom: 0,
//                               top: MediaQuery.of(context).size.height / 2 - 50,
//                               child: PrimaryGradiantContainer(
//                                 onlyBottomRadius: true,
//                                 // height: MediaQuery.of(context).size.height / 2,
//                                 // width: MediaQuery.of(context).size.width,
//                                 // child: Container(),
//                               ),
//                             ),
//                             Positioned(
//                               top: 0,
//                               child: PrimaryGradiantContainer(
//                                 radius: 18.0,
//                                 onlyBottomRadius: true, height: MediaQuery.of(context).size.height / 2,width: Get.width,
//                                 ),
//                             ),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.center, children: [
//                               // Container(
//                               //   height: Get.height * (MediaQuery.of(context).padding.top + 90) / 896,
//                               // ),
//                               // RichText(
//                               //     text: TextSpan(children: [
//                               //   TextSpan(
//                               //       text: "Hello, ",
//                               //       style: TextStyle(
//                               //           color: Theme.of(context).colorScheme.shadow,
//                               //           fontSize: Get.height * AppConstants.themeConstants.fontsize_20,
//                               //           fontWeight: FontWeight.normal)),
//                               //   TextSpan(
//                               //       text: 'Login',
//                               //       style: TextStyle(
//                               //           color: Theme.of(context).colorScheme.primary,
//                               //           fontWeight: FontWeight.w600,
//                               //           fontSize: Get.height * AppConstants.themeConstants.fontsize_28)),
//                               // ])),
//                               // Container(
//                               //   height: Get.height * 50 / 896,
//                               // ),
//                               Container(
//                                 height: Get.height * (MediaQuery.of(context).padding.top + 90) / 896,
//                               ),
//                               Container(
//                                   height: Get.height * 178.48 / 896,
//                                   width: Get.width * 191 / 414,
//                                   child: SvgPicture.asset('assets/svg_icons/Splash.svg')),
//                                   Container(
//                                 height: Get.height * 50 / 896,
//                               ),
//                               Center(
//                         child: Text(
//                           "Gowri Seva Sangam",
//                           style: TextStyle(
//                             fontSize: Get.height * AppConstants.themeConstants.fontsize_25,
//                             fontWeight: FontWeight.w900,
//                             color: Colors.white,
//                             shadows: [
//                               Shadow(
//                                 blurRadius: 3.0,
//                                 color: Color.fromRGBO(0, 0, 0, 1),
//                                 offset: Offset(0, 2),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                               Container(
//                                 height: Get.height * 75 / 896,
//                               ),
//                               Text("Login", style: TextStyle(
//                             fontSize: Get.height * AppConstants.themeConstants.fontsize_18,
//                             fontWeight: FontWeight.w700,
//                             color: Theme.of(context).colorScheme.surface,
//                           ),),
//                               Container(
//                                         height: Get.height * 5 / 896,
//                                       ),
//                               Padding(
//                                 padding: const EdgeInsets.symmetric(horizontal: 25.0),
//                                 child: Form(
//                                   key: formKey,
//                                   child: Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       // Text(
//                                       //   'Username',
//                                       //   style: TextStyle(
//                                       //       fontSize: Get.height * AppConstants.themeConstants.fontsize_14,
//                                       //       fontWeight: FontWeight.w500,
//                                       //       color: Theme.of(context).colorScheme.primaryContainer),
//                                       // ),
//                                       Container(
//                                         height: Get.height * 8 / 896,
//                                       ),
//                                       CommonComponents.defaultLoginTextFormField(
//                                         context,
//                                         title: 'Username',
//                                         hintText: 'Enter Username',
//                                         controller: controller.userNameController,
//                                         filled: true,
//                                         prefixIcon: Padding(
//                                           padding: const EdgeInsets.all(5.0),
//                                           child: SvgPicture.asset('assets/svg_icons/mail.svg'),
//                                         ),
//                                         // suffixIcon: Padding(
//                                         //   padding: const EdgeInsets.only(right: 18.0),
//                                         //   child: SvgPicture.asset('assets/icons/tick.svg'),
//                                         // ),
//                                         // inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
//                                         validator: (String? val) {
//                                           if (val == '') {
//                                             return 'Username is required';
//                                           }
//                                           // else if (val!.length < 10) {
//                                           //   return 'Please enter a valid  username';
//                                           // }
//                                           else {
//                                             return null;
//                                           }
//                                         },
//                                         keyboardType: TextInputType.text,
//                                         textInputAction: TextInputAction.next,
//                                         onChange: (value) {},
//                                       ),
//                                       Container(
//                                         height: Get.height * 20 / 896,
//                                       ),
//                                       CommonComponents.defaultLoginTextFormField(
//                                         context,
//                                         hintText: 'Enter Password',
//                                         title: 'Password',
//                                         filled: true,
//                                         prefixIcon: Padding(
//                                           padding: const EdgeInsets.all(5.0),
//                                           child: SvgPicture.asset('assets/svg_icons/lock.svg'),
//                                         ),
//                                         controller: controller.passwordController,
//                                         obscureText: controller.obscureText,
//                                         suffixIcon: ExpandTapWidget(
//                                           tapPadding: EdgeInsets.all(10.0),
//                                           onTap: () {
//                                             setState(() {
//                                               controller.obscureText = !controller.obscureText;
//                                             });
//                                           },
//                                           child: Padding(
//                                               padding: EdgeInsets.symmetric(horizontal: 8),
//                                               child: Icon(
//                                                 controller.obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
//                                                 size: 18,
//                                                 color: Color.fromRGBO(153, 153, 169, 1),
//                                               )),
//                                         ),
//                                         // inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
//                                         validator: (String? val) {
//                                           if (val == '') {
//                                             return 'Password is required';
//                                           }
//                                           // else if (val!.length < 10) {
//                                           //   return 'Please enter a valid  mobile number';
//                                           // }
//                                           else {
//                                             return null;
//                                           }
//                                         },
//                                         keyboardType: TextInputType.text,
//                                         textInputAction: TextInputAction.done,
//                                         onChange: (value) {},
//                                       ),
//                                       // Container(
//                                       //   height: Get.height * 20 / 896,
//                                       // ),
//                                       // Row(
//                                       //   mainAxisAlignment: MainAxisAlignment.end,
//                                       //   children: [
//                                       //     InkWell(
//                                       //       onTap: () {},
//                                       //       child: Text(
//                                       //         'Need Help?',
//                                       //         style: TextStyle(
//                                       //             fontSize: Get.height * AppConstants.themeConstants.fontsize_16,
//                                       //             fontWeight: FontWeight.w500,
//                                       //             color: Theme.of(context).colorScheme.primaryContainer),
//                                       //       ),
//                                       //     )
//                                       //   ],
//                                       // ),
//                                       Container(
//                                         height: Get.height * 40 / 896,
//                                       ),
//                                       Align(
//                                         alignment: Alignment.center,
//                                         child: MaterialButton(
//                                           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//                                           minWidth: Get.width,
//                                           height: Get.height * 45 / 896,
//                                           color: Theme.of(context).colorScheme.secondary,
//                                           onPressed: () {
//                                             if (formKey.currentState!.validate()) {
//                                               controller.loginServiceCall();
                                              
//                                             }
//                                           },
//                                           child: Text(
//                                             'Login',
//                                             style: TextStyle(
//                                                 fontSize: Get.height * AppConstants.themeConstants.fontsize_15,
//                                                 fontWeight: FontWeight.w500,
//                                                 color: Theme.of(context).colorScheme.primaryContainer),
//                                           ),
//                                         ),
//                                       )
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ]),
//                           ])),
//                     ))));
//   }
// }


import 'package:expand_tap_area/expand_tap_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:gowri_seva_sangam/Common%20Components/Common%20Widgets/custom_appbar.dart';
import 'package:gowri_seva_sangam/Common%20Components/common_input_fields.dart';
import 'package:gowri_seva_sangam/Screen/login/Controller/controller.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final controller = Get.put(LoginController());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final focusNodes = Iterable<int>.generate(2).map((_) => FocusNode()).toList();
  
  var image1 = 'assets/Absolin.svg';
  var image2 = '';

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        appBar: CustomAppBar(
          height: 0.0,
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, constraints) {
              // Responsive layout based on screen width
              bool isDesktop = constraints.maxWidth > 800;
              bool isTablet = constraints.maxWidth > 600 && constraints.maxWidth <= 800;
              bool isMobile = constraints.maxWidth <= 600;
      
              return SingleChildScrollView(
                child: Container(
                  height: constraints.maxHeight,
                  width: constraints.maxWidth,
                  child: isDesktop
                      ? _buildDesktopLayout(constraints)
                      : isTablet
                          ? _buildTabletLayout(constraints)
                          : _buildMobileLayout(constraints),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _buildDesktopLayout(BoxConstraints constraints) {
    return Row(
      children: [
        // Left side - decorative area (1/2 of screen)
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Theme.of(context).colorScheme.secondaryContainer,
                Theme.of(context).colorScheme.secondary,
                ],
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                SvgPicture.asset(image1, color: Colors.white , height: Get.height * 0.25, width: Get.width *0.25),
                SizedBox(height: 16),
                SvgPicture.asset(image2),
                ],
              ),
            ),
          ),
        ),
        // Right side - login form (1/2 of screen)
        Expanded(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Center(
              child: Container(
                constraints: BoxConstraints(maxWidth: 400),
                child: buildLoginForm(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTabletLayout(BoxConstraints constraints) {
    return Column(
      children: [
        // Top section - banner (1/3 of screen)
        Container(
          // height: constraints.maxHeight * 0.3,
          height: constraints.maxHeight,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Theme.of(context).colorScheme.secondaryContainer,
                Theme.of(context).colorScheme.secondary,
              ],
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(image1),
                SizedBox(height: 16),
                SvgPicture.asset(image2),
              ],
            ),
          ),
        ),
        // Bottom section - login form (2/3 of screen)
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Center(
              child: Container(
                constraints: BoxConstraints(maxWidth: 450),
                child: buildLoginForm(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BoxConstraints constraints) {
    return Column(
      children: [
        // Top section - banner (1/4 of screen)
        
        Container(
          height: constraints.maxHeight * 0.50,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Theme.of(context).colorScheme.secondaryContainer,
                Theme.of(context).colorScheme.secondary,
              ],
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset(image1, color: Colors.white , height: Get.height * 0.25, width: Get.width *0.25),
                SizedBox(height: 16),
                SvgPicture.asset(image2),
              ],
            ),
          ),
        ),
        // Bottom section - login form (3/4 of screen)
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Center(
              child: SingleChildScrollView(
                child: buildLoginForm(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildLoginForm() {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Login',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.surface,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Please sign in with your credentials',
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).colorScheme.surface.withOpacity(0.7),
            ),
          ),
          SizedBox(height: 12),
          buildTextField(),
          SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  controller.loginServiceCall();
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                'Login',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          // SizedBox(height: 24),
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.center,
          //   children: [
          //     Text(
          //       "Don't have an account? ",
          //       style: TextStyle(
          //         color: Theme.of(context).colorScheme.primaryContainer.withOpacity(0.7),
          //       ),
          //     ),
          //     TextButton(
          //       onPressed: () {
          //         // Sign up logic
          //       },
          //       child: Text(
          //         'Sign Up',
          //         style: TextStyle(
          //           color: Theme.of(context).colorScheme.primary,
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }

  Widget buildTextField() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Username Field
      Text(
        'Username',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
      ),
      SizedBox(height: 8),
      CommonComponents.defaultLoginTextFormField(
        context,
        hintText: 'Enter Username',
        controller: controller.userNameController,
        filled: true,
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: SvgPicture.asset('assets/svg_icons/mail.svg'),
        ),
        validator: (String? val) {
          if (val == '') {
            return 'Username is required';
          } else {
            return null;
          }
        },
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        onChange: (value) {},
      ),
      
      SizedBox(height: 20),
      
      // Password Field
      Text(
        'Password',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Theme.of(context).colorScheme.primaryContainer,
        ),
      ),
      SizedBox(height: 8),
      CommonComponents.defaultLoginTextFormField(
        context,
        hintText: 'Enter Password',
        filled: true,
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: SvgPicture.asset('assets/svg_icons/lock.svg'),
        ),
        controller: controller.passwordController,
        obscureText: controller.obscureText,
        onFieldSubmitted: (val) {
                          if (formKey.currentState!.validate()) {
                            controller.loginServiceCall();
                          }
                        },
        suffixIcon: ExpandTapWidget(
          tapPadding: EdgeInsets.all(10.0),
          onTap: () {
            setState(() {
              controller.obscureText = !controller.obscureText;
            });
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Icon(
              controller.obscureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
              size: 20,
              color: Color.fromRGBO(153, 153, 169, 1),
            )
          ),
        ),
        validator: (String? val) {
          if (val == '') {
            return 'Password is required';
          } else {
            return null;
          }
        },
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.done,
        onChange: (value) {},
      ),
    ],
  );
}
}