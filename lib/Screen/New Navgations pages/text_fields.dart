import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gowri_seva_sangam/App%20Constants/app_constants.dart';
import 'package:gowri_seva_sangam/BreakPoints/breakpoints.dart';
import 'package:gowri_seva_sangam/Screen/Scaffold%20Custom%20Appbar/custom_appbar.dart';
import 'package:responsive_toolkit/responsive_grid.dart';

class TextFieldsCommonFields extends StatelessWidget {
  const TextFieldsCommonFields({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffoldWithAppBar(
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          children: [
            ResponsiveRow(
              runSpacing: 20.0,
              spacing: 20.0,
              columns: [
              ResponsiveColumn(ResponsiveConstants().textFormField, child: CommonTextFormFields.defaultLoginTextFormField(context,
                title: 'Login Field',
                hintText: 'Enter Login Field',
                // errorText: 'Please enter a valid Login Field Name',
                controller: TextEditingController(),
                prefixIcon: Icon(Icons.person),
                suffixIcon: Icon(Icons.check_circle),
                maxLength: 20,
                obscureText: false,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.name,
              )),
        
              ResponsiveColumn(ResponsiveConstants().textFormField, child: CommonTextFormFields.defaultSearchTextField(context,
                hintText: 'Enter Search Field',
                // errorText: 'Please enter a valid Search Field Name',
                controller: TextEditingController(),
                prefixIcon: Icon(Icons.search),
                // suffixIcon: Icon(Icons.clear),
                textInputAction: TextInputAction.search,
                keyboardType: TextInputType.text,
              )),
        
              ResponsiveColumn(ResponsiveConstants().textFormField, child: CommonTextFormFields.defaultSearchTextFormField(context,
                title: 'Search Field',
                hintText: 'Enter Search Field',
                // errorText: 'Please enter a valid Search Field Name',
                controller: TextEditingController(),
                prefixIcon: Icon(Icons.search),
                suffixIcon: Icon(Icons.clear),
                textInputAction: TextInputAction.search,
                keyboardType: TextInputType.text,
              )),
        
              ResponsiveColumn(ResponsiveConstants().textFormField, child: CommonTextFormFields.defaultTextField(context,
                title: 'Text Field',
                hintText: 'Enter Text Field',
                // errorText: 'Please enter a valid Text Field Name',
                controller: TextEditingController(),
                // prefixIcon: Icon(Icons.text_fields),
                suffixIcon: Icon(Icons.check_circle),
                maxLength: 20,
                obscureText: false,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
              )),
        
              ResponsiveColumn(ResponsiveConstants().textFormField, child: CommonTextFormFields.defaultTextFieldComponent(context,
                title: 'Text Field Component',
                hintText: 'Enter Text Field Component',
                // errorText: 'Please enter a valid Text Field Component Name',
                controller: TextEditingController(),
                // prefixIcon: Icon(Icons.text_fields),
                // suffixIcon: Icon(Icons.check_circle),
                maxLength: 20,
                obscureText: false,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
              )),
        
              ResponsiveColumn(ResponsiveConstants().textFormField, child: CommonTextFormFields.differentBorderTextField(context,
                title: 'Different Border Text Field',
                hintText: 'Enter Different Border Text Field',
                // errorText: 'Please enter a valid Different Border Text Field Name',
                controller: TextEditingController(),
                maxLength: 20,
                obscureText: false,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.text,
              )),
        
            ])
          ],
        ),
      )),
    );
  }
}





class CommonTextFormFields {

static Column defaultTextFormField(
  BuildContext context, {
  TextEditingController? controller,
  String? title = '',
  String? hintText,
  String? errorText,
  String? initialValue,
  bool readOnly = false,
  bool enable = true,
  Widget? prefixIcon,
  Widget? suffixIcon,
  int? maxLength,
  bool obscureText = false,
  List<TextInputFormatter>? inputFormatters,
  TextInputAction? textInputAction,
  TextInputType? keyboardType,
  FocusNode? focusNode,
  TextCapitalization textCapitalization = TextCapitalization.none,
  TextAlign textAlign = TextAlign.left,
  InputDecoration? decoration,
  String? Function(String?)? validator,
  void Function(String?)? onSaved,
  void Function()? onTap,
  void Function()? onEditingComplete,
  void Function(String)? onChange,
  void Function(String)? onFieldSubmitted,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (title != '')
        Padding(
          padding: const EdgeInsets.only(bottom: 4.0),
          child: Text(
            title!,
            style: TextStyle(
              color: Theme.of(context).colorScheme.surface,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins',
              fontSize: Get.height * AppConstants.themeConstants.fontsize_13, // Reduced font size
            ),
          ),
        ),
      TextFormField(
        controller: controller,
        maxLength: maxLength,
        readOnly: readOnly,
        enabled: enable,
        initialValue: initialValue,
        obscureText: obscureText,
        textCapitalization: textCapitalization,
        focusNode: focusNode,
        textInputAction: textInputAction,
        textAlign: textAlign,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: const TextStyle(
          fontSize: 13, // Reduced font size
          fontWeight: FontWeight.normal,
          color: Colors.black,
        ),
        cursorColor: Theme.of(context).colorScheme.primary,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: Get.height * AppConstants.themeConstants.fontsize_13, // Reduced font size
            color: Theme.of(context).colorScheme.surfaceContainer,
              fontFamily: 'Poppins',
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0), // Reduced padding
          counterText: '',
          prefixIcon: prefixIcon != null
              ? Padding(
                  padding: const EdgeInsets.all(8.0), // Adjusts icon size
                  child: prefixIcon,
                )
              : null,
          suffixIcon: suffixIcon,
          filled: true,
          fillColor: Theme.of(context).colorScheme.primaryContainer,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0), // Slightly smaller radius
            borderSide: BorderSide(color: Theme.of(context).colorScheme.outline, width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary, width: 1.2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: const BorderSide(color: Colors.red, width: 1.2),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6.0),
            borderSide: const BorderSide(color: Colors.red, width: 1.2),
          ),
        ),
        onChanged: onChange,
        onFieldSubmitted: onFieldSubmitted,
        onSaved: onSaved,
        onTap: onTap,
        validator: validator,
        onEditingComplete: onEditingComplete,
      ),
      if (errorText != null)
        Padding(
          padding: const EdgeInsets.only(top: 2.0), // Reduced spacing
          child: Text(
            errorText,
            style: const TextStyle(
              fontSize: 11, // Smaller error text
              color: Colors.red,
            ),
          ),
        ),
    ],
  );
}

static Column defaultLoginTextFormField(
  BuildContext context, {
  TextEditingController? controller,
  String? title = '',
  String? hintText,
  String? errorText,
  String? initialValue,
  bool readOnly = false,
  bool filled = false,

  bool enable = true,
  Widget? prefixIcon,
  Widget? suffixIcon,
  int? maxLength,
  bool obscureText = false,
  List<TextInputFormatter>? inputFormatters,
  TextInputAction? textInputAction,
  TextInputType? keyboardType,
  FocusNode? focusNode,
  TextCapitalization textCapitalization = TextCapitalization.none,
  TextAlign textAlign = TextAlign.left,
  InputDecoration? decoration,
  String? Function(String?)? validator,
  void Function(String?)? onSaved,
  void Function()? onTap,
  void Function()? onEditingComplete,
  void Function(String)? onChange,
  void Function(String)? onFieldSubmitted,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (title != '')
        Padding(
          padding: const EdgeInsets.only(bottom: 4.0), // Slightly reduced spacing
          child: Text(
            title!,
            style: TextStyle(
              color: Theme.of(context).colorScheme.surface,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins',
              fontSize: Get.height * AppConstants.themeConstants.fontsize_14, // Reduced font size
            ),
          ),
        ),
      TextFormField(
        controller: controller,
        maxLength: maxLength,
        readOnly: readOnly,
        enabled: enable,
        initialValue: initialValue,
        obscureText: obscureText,
        textCapitalization: textCapitalization,
        focusNode: focusNode,
        textInputAction: textInputAction,
        textAlign: textAlign,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: const TextStyle(
          fontSize: 13, // Reduced font size
          fontWeight: FontWeight.normal,
          color: Colors.black,
        ),
        cursorColor: Theme.of(context).colorScheme.primary,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: Get.height * AppConstants.themeConstants.fontsize_13, // Reduced font size
            color: Theme.of(context).colorScheme.surface,
              fontFamily: 'Poppins',
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0), // Reduced padding
          counterText: '',
          prefixIcon: prefixIcon != null
              ? Padding(
                  padding: const EdgeInsets.all(8.0), // Adjusts icon size
                  child: prefixIcon,
                )
              : null,
          suffixIcon: suffixIcon,
          filled: filled,
          fillColor: !filled ?  Theme.of(context).colorScheme.primaryContainer : Color(0xffFFF4F7),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Theme.of(context).colorScheme.outline, width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary, width: 1.2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.red, width: 1.2),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.red, width: 1.2),
          ),
        ),
        onChanged: onChange,
        onFieldSubmitted: onFieldSubmitted,
        onSaved: onSaved,
        onTap: onTap,
        validator: validator,
        onEditingComplete: onEditingComplete,
      ),
      if (errorText != null)
        Padding(
          padding: const EdgeInsets.only(top: 2.0), // Reduced spacing
          child: Text(
            errorText,
            style: const TextStyle(
              fontSize: 11, // Smaller error text
              color: Colors.red,
            ),
          ),
        ),
    ],
  );
}

static Column defaultSearchTextFormField(
  BuildContext context, {
  TextEditingController? controller,
  String? title = '',
  String? hintText,
  String? errorText,
  String? initialValue,
  bool readOnly = false,
  bool enable = true,
  Widget? prefixIcon,
  Widget? suffixIcon,
  int? maxLength,
  bool obscureText = false,
  List<TextInputFormatter>? inputFormatters,
  TextInputAction? textInputAction,
  TextInputType? keyboardType,
  FocusNode? focusNode,
  TextCapitalization textCapitalization = TextCapitalization.none,
  TextAlign textAlign = TextAlign.left,
  InputDecoration? decoration,
  String? Function(String?)? validator,
  void Function(String?)? onSaved,
  void Function()? onTap,
  void Function()? onEditingComplete,
  void Function(String)? onChange,
  void Function(String)? onFieldSubmitted,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (title != '')
        Padding(
          padding: const EdgeInsets.only(bottom: 4.0), // Slightly reduced spacing
          child: Text(
            title!,
            style: TextStyle(
              color: Theme.of(context).colorScheme.surface,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins',
              fontSize: 13, // Reduced font size
            ),
          ),
        ),
      TextFormField(
        controller: controller,
        maxLength: maxLength,
        readOnly: readOnly,
        enabled: enable,
        initialValue: initialValue,
        obscureText: obscureText,
        textCapitalization: textCapitalization,
        focusNode: focusNode,
        textInputAction: textInputAction,
        textAlign: textAlign,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        style: const TextStyle(
          fontSize: 13, // Reduced font size
          fontWeight: FontWeight.normal,
          color: Colors.black,
        ),
        cursorColor: Theme.of(context).colorScheme.primary,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 13, // Reduced font size
            color: Colors.black,
              fontFamily: 'Poppins',
          ),
          contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0), // Reduced padding
          counterText: '',
          prefixIcon: prefixIcon != null
              ? Padding(
                  padding: const EdgeInsets.all(8.0), // Adjusts icon size
                  child: prefixIcon,
                )
              : null,
          suffixIcon: suffixIcon,
          filled: true,
          // fillColor: Theme.of(context).colorScheme.primaryContainer,
          fillColor: Colors.white,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0), // Slightly smaller radius
            borderSide: BorderSide(color: Theme.of(context).colorScheme.outline, width: 1.0),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(color: Theme.of(context).colorScheme.secondary, width: 1.2),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.red, width: 1.2),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: const BorderSide(color: Colors.red, width: 1.2),
          ),
        ),
        onChanged: onChange,
        onFieldSubmitted: onFieldSubmitted,
        onSaved: onSaved,
        onTap: onTap,
        validator: validator,
        onEditingComplete: onEditingComplete,
      ),
      if (errorText != null)
        Padding(
          padding: const EdgeInsets.only(top: 2.0), // Reduced spacing
          child: Text(
            errorText,
            style: const TextStyle(
              fontSize: 11, // Smaller error text
              color: Colors.red,
            ),
          ),
        ),
    ],
  );
}


  static Column defaultTextField(
    context, {
    TextEditingController? controller,
    bool? isMultiline = false,
    String? title = '',
    String? hintText,
    String? errorText,
    bool? readOnly = false,
    bool? enable = true,
    bool? filled = true,
    Icon? prefixIcon,
    Widget? suffixIcon,
    int? maxLength,
    int? maxLines,
    bool? obscureText = false,
    List<TextInputFormatter>? inputFormatters,
    TextInputAction? textInputAction,
    TextInputType? keyboardType,
    FocusNode? focusNode,
    TextCapitalization? textCapitalization,
    InputDecoration? decoration,
    bool? isRequired = false,
    validator,
    void Function(String?)? onSaved,
    void Function()? onTap,
    void Function()? onEditingComplete,
    void Function(String)? onChange,
    void Function(String)? onFieldSubmitted,
    void Function(PointerDownEvent)? onTapOutside,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          autofocus: false,
          maxLength: maxLength,
          maxLines: obscureText! ? 1 : maxLines,
          readOnly: readOnly!,
          enabled: enable,
          controller: controller,
          textCapitalization: textCapitalization ?? TextCapitalization.none,
          focusNode: focusNode,
          textInputAction: textInputAction,
          obscureText: obscureText,
          keyboardType: keyboardType,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          inputFormatters: inputFormatters,
          cursorColor: filled! ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.primaryContainer,
          style: TextStyle(
            fontSize: Get.height * AppConstants.themeConstants.fontsize_13,
            fontWeight: FontWeight.w500,
            color: filled ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.primaryContainer,
          ),
          decoration: InputDecoration(
            counterText: '',
            hintText: hintText,
            floatingLabelBehavior: FloatingLabelBehavior.always, // Floating inside only
            labelText: isRequired! ? "* $title" : title, // Add * only if required
            // labelStyle: TextStyle(color: isRequired ? Colors.red : null),
            hintStyle: TextStyle(
              fontSize: Get.height * AppConstants.themeConstants.fontsize_14,
              fontWeight: FontWeight.w500,
              color: !filled ? Theme.of(context).colorScheme.primaryContainer : Theme.of(context).colorScheme.primaryFixed,
            ),
            prefixIcon: prefixIcon,
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: suffixIcon,
            ),
            filled: filled,
            fillColor: filled ? Theme.of(context).colorScheme.primaryContainer : Colors.transparent,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).colorScheme.primaryFixed),
              borderRadius: BorderRadius.circular(8),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(153, 153, 169, 1)),
              borderRadius: BorderRadius.circular(8),
            ),
            contentPadding: const EdgeInsets.all(10),
            suffixIconConstraints: const BoxConstraints(minHeight: 10, minWidth: 10, maxHeight: 20, maxWidth: 60),
            prefixIconConstraints: const BoxConstraints(minHeight: 10, minWidth: 10, maxHeight: 20, maxWidth: 40),
          ),
          onTapOutside: onTapOutside,
          onChanged: onChange,
          onFieldSubmitted: onFieldSubmitted,
          onSaved: onSaved,
          onTap: onTap,
          validator: validator,
          onEditingComplete: onEditingComplete,
        ),
      ],
    );
  }

  static Column differentBorderTextField(
    context, {
    TextEditingController? controller,
    bool? isMultiline = false,
    String? title = '',
    String? hintText,
    String? errorText,
    bool? readOnly = false,
    bool? enable = true,
    bool? filled = true,
    Icon? prefixIcon,
    Widget? suffixIcon,
    int? maxLength,
    int? maxLines,
    bool? obscureText = false,
    List<TextInputFormatter>? inputFormatters,
    TextInputAction? textInputAction,
    TextInputType? keyboardType,
    FocusNode? focusNode,
    TextCapitalization? textCapitalization,
    InputDecoration? decoration,
    bool? isRequired = false,
    validator,
    void Function(String?)? onSaved,
    void Function()? onTap,
    void Function()? onEditingComplete,
    void Function(String)? onChange,
    void Function(String)? onFieldSubmitted,
    void Function(PointerDownEvent)? onTapOutside,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          autofocus: false,
          maxLength: maxLength,
          maxLines: obscureText! ? 1 : maxLines,
          readOnly: readOnly!,
          enabled: enable,
          controller: controller,
          textCapitalization: textCapitalization ?? TextCapitalization.none,
          focusNode: focusNode,
          textInputAction: textInputAction,
          obscureText: obscureText,
          keyboardType: keyboardType,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          inputFormatters: inputFormatters,
          cursorColor: filled! ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.primaryContainer,
          style: TextStyle(
            fontSize: Get.height * AppConstants.themeConstants.fontsize_17,
            fontWeight: FontWeight.w500,
            color: filled ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.primaryContainer,
          ),
          decoration: InputDecoration(
            counterText: '',
            hintText: hintText,
            floatingLabelBehavior: FloatingLabelBehavior.always, // Floating inside only
            labelText: isRequired! ? "* $title" : title, // Add * only if required
            // labelStyle: TextStyle(color: isRequired ? Colors.red : null),
            hintStyle: TextStyle(
              fontSize: Get.height * AppConstants.themeConstants.fontsize_14,
              fontWeight: FontWeight.w500,
              color: !filled ? Theme.of(context).colorScheme.surface : Theme.of(context).colorScheme.primaryFixed,
            ),
            prefixIcon: prefixIcon,
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: suffixIcon,
            ),
            filled: filled,
            fillColor: filled ? Theme.of(context).colorScheme.primaryContainer : Colors.transparent,
            // fillColor: Color(0xffFFF4F7),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Theme.of(context).colorScheme.outline),
              borderRadius: BorderRadius.circular(10),
            ),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Color.fromRGBO(153, 153, 169, 1)),
              borderRadius: BorderRadius.circular(10),
            ),
            contentPadding: const EdgeInsets.all(10),
            suffixIconConstraints: const BoxConstraints(minHeight: 10, minWidth: 10, maxHeight: 20, maxWidth: 60),
            prefixIconConstraints: const BoxConstraints(minHeight: 10, minWidth: 10, maxHeight: 20, maxWidth: 40),
          ),
          onTapOutside: onTapOutside,
          onChanged: onChange,
          onFieldSubmitted: onFieldSubmitted,
          onSaved: onSaved,
          onTap: onTap,
          validator: validator,
          onEditingComplete: onEditingComplete,
        ),
      ],
    );
  }

  static Column defaultTextFieldComponent(context,
      {TextEditingController? controller,
      bool? isMultiline = false,
      String? title = '',
      String? initialValue,
      String? hintText,
      String? errorText,
      bool? readOnly = false,
      bool? enable = true,
      bool? filled = true,
      Icon? prefixIcon,
      Widget? suffixIcon,
      int? maxLength,
      int? maxLines,
      bool? obscureText = false,
      List<TextInputFormatter>? inputFormatters,
      TextInputAction? textInputAction,
      TextInputType? keyboardType,
      FocusNode? focusNode,
      TextCapitalization? textCapitalization,
      InputDecoration? decoration,
      validator,
      void Function(String?)? onSaved,
      void Function()? onTap,
      void Function()? onEditingComplete,
      void Function(String)? onChange,
      void Function(String)? onFieldSubmitted,
      void Function(PointerDownEvent)? onTapOutside}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimationConfiguration.synchronized(
            duration: Duration(milliseconds: 500),
            child: ScaleAnimation(
                child: FadeInAnimation(
                    child: TextFormField(
              scrollPadding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom + 30),
              autofocus: false,
              maxLength: maxLength,
              maxLines: obscureText! ? 1 : maxLines,
              readOnly: readOnly!,
              enabled: enable,
              controller: controller,
              textCapitalization: textCapitalization ?? TextCapitalization.none,
              focusNode: focusNode,
              textInputAction: textInputAction,
              initialValue: initialValue,
              obscureText: obscureText,
              keyboardType: keyboardType,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              inputFormatters: inputFormatters,
              cursorColor: filled! ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.primaryContainer,
              style: TextStyle(
                  fontSize: Get.height * AppConstants.themeConstants.fontsize_13,
                  fontWeight: FontWeight.w500,
                  color: filled ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.primaryContainer),
              decoration: InputDecoration(
                counterText: '',
                hintText: hintText,
                hintStyle: TextStyle(
                    fontSize: Get.height * AppConstants.themeConstants.fontsize_14,
                    fontWeight: FontWeight.w500,
                    color: !filled ? Theme.of(context).colorScheme.primaryContainer : Theme.of(context).colorScheme.primaryFixed),
                prefixIcon: prefixIcon,
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: suffixIcon,
                ),
                filled: filled,
                fillColor: filled ? Theme.of(context).colorScheme.primaryContainer : Colors.transparent,
                floatingLabelAlignment: FloatingLabelAlignment.start,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                // labelText: hintText!.replaceAll('Enter ', ''),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Theme.of(context).colorScheme.primaryFixed), borderRadius: BorderRadius.circular(8)),
                border: OutlineInputBorder(borderSide: BorderSide(color: Color.fromRGBO(153, 153, 169, 1)), borderRadius: BorderRadius.circular(8)),
                contentPadding: const EdgeInsets.all(10),
                suffixIconConstraints: const BoxConstraints(minHeight: 10, minWidth: 10, maxHeight: 20, maxWidth: 60),
                prefixIconConstraints: const BoxConstraints(minHeight: 10, minWidth: 10, maxHeight: 20, maxWidth: 40),
              ),
              onTapOutside: onTapOutside,
              onChanged: onChange,
              onFieldSubmitted: onFieldSubmitted,
              onSaved: onSaved,
              onTap: onTap,
              validator: validator,
              onEditingComplete: onEditingComplete,
            )))),
      ],
    );
  }

  static Column defaultSearchTextField(context,
      {TextEditingController? controller,
      String? initialValue,
      String? hintText,
      String? errorText,
      bool? readOnly = false,
      bool? enable = true,
      bool? filled = true,
      Icon? prefixIcon,
      Widget? suffixIcon,
      Widget? prefix,
      Widget? suffix,
      List<TextInputFormatter>? inputFormatters,
      TextInputAction? textInputAction,
      TextInputType? keyboardType,
      FocusNode? focusNode,
      TextCapitalization? textCapitalization,
      InputDecoration? decoration,
      validator,
      void Function(String?)? onSaved,
      void Function()? onTap,
      void Function()? onEditingComplete,
      void Function(String)? onChange,
      void Function(String)? onFieldSubmitted,
      void Function(PointerDownEvent)? onTapOutside}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimationConfiguration.synchronized(
            duration: Duration(milliseconds: 500),
            child: ScaleAnimation(
                child: FadeInAnimation(
                    child: TextFormField(
              readOnly: readOnly!,
              enabled: enable,
              controller: controller,
              textCapitalization: textCapitalization ?? TextCapitalization.none,
              focusNode: focusNode,
              textInputAction: textInputAction,
              initialValue: initialValue,
              keyboardType: keyboardType,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              inputFormatters: inputFormatters,
              autofocus: false,
              cursorColor: Theme.of(context).colorScheme.primary,
              style: TextStyle(fontSize: Get.height * AppConstants.themeConstants.fontsize_14, fontWeight: FontWeight.w500),
              decoration: InputDecoration(
                counterText: '',
                hintText: 'Search',
                hintStyle: TextStyle(
                    fontSize: Get.height * AppConstants.themeConstants.fontsize_14,
                    fontWeight: FontWeight.w500,
                    color: Theme.of(context).colorScheme.primary),
                suffixIcon: suffixIcon,
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                  child: SvgPicture.asset('assets/icons/search.svg'),
                ),
                // suffixIcon: suffixIcon,
                suffix: suffix,
                prefix: prefix,
                // suffixIcon: IconButton(onPressed: () {},
                //   icon: Icon(Icons.search),
                //   color: Theme.of(context).colorScheme.primary,
                // ),
                filled: true,
                fillColor: Theme.of(context).colorScheme.primaryContainer,
                border: OutlineInputBorder(borderSide: BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                  strokeAlign: 0,
                  color: Color.fromRGBO(229, 229, 229, 1),
                ), borderRadius: BorderRadius.circular(8)),
                contentPadding: const EdgeInsets.fromLTRB(20, 13, 15, 12),
                suffixIconConstraints: const BoxConstraints(minHeight: 10, minWidth: 10, maxHeight: 20, maxWidth: 60),
                prefixIconConstraints: const BoxConstraints(minHeight: 10, minWidth: 10, maxHeight: 20, maxWidth: 40),
              ),
              onTapOutside: onTapOutside,
              onChanged: onChange,
              onFieldSubmitted: onFieldSubmitted,
              onSaved: onSaved,
              onTap: onTap,
              onEditingComplete: onEditingComplete,
            )))),
      ],
    );
  }
}
