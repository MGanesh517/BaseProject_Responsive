import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:gowri_seva_sangam/App%20Constants/app_constants.dart';
import 'package:gowri_seva_sangam/Common%20Components/Common%20Widgets/common_shadowed_container_widget.dart';

class CommonComponents {

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
          style: TextStyle(
            fontSize: Get.height * AppConstants.themeConstants.fontsize_13, // Reduced font size
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
              style: TextStyle(
                fontSize: Get.height * AppConstants.themeConstants.fontsize_12, // Smaller error text
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
          style: TextStyle(
            fontSize: Get.height * AppConstants.themeConstants.fontsize_13, // Reduced font size
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
              style: TextStyle(
                fontSize: Get.height * AppConstants.themeConstants.fontsize_12, // Smaller error text
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
          style: TextStyle(
            fontSize: Get.height * AppConstants.themeConstants.fontsize_13, // Reduced font size
            fontWeight: FontWeight.normal,
            color: Colors.black,
          ),
          cursorColor: Theme.of(context).colorScheme.primary,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(
              fontSize: Get.height * AppConstants.themeConstants.fontsize_13, // Reduced font size
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
              style: TextStyle(
                fontSize: Get.height * AppConstants.themeConstants.fontsize_12, // Smaller error text
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

  static Column defaultNewDropdownSearch<T>(
    BuildContext context, {
    Key? key,
    Icon? prefixIcon,
    String? title = '',
    String? hintText,
    bool? enabled,
    Color? filledColor,
    String? Function(T?)? validator,
    Future<List<T>> Function(String, LoadProps?)? items,
    bool Function(T, T)? compareFn,
    bool Function(T)? disableItemFn,
    String Function(T)? itemAsString,
    T? selectedItem,
    void Function(T?)? onChanged,
    bool? showBottomSheet = true,
    itemBuilder,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null && title.isNotEmpty)
          Padding(
          padding: const EdgeInsets.only(bottom: 4.0), // Slightly reduced spacing
          child: Text(
            title,
            style: TextStyle(
              color: Theme.of(context).colorScheme.surface,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins',
              fontSize: Get.height * AppConstants.themeConstants.fontsize_13, // Reduced font size
            ),
          ),
        ),
        DropdownSearch<T>(
          autoValidateMode: AutovalidateMode.onUserInteraction,
          items: items,
          key: ValueKey(title),
          selectedItem: selectedItem,
          itemAsString: itemAsString,
          enabled: enabled ?? true,
          validator: validator,
          compareFn: compareFn,
          clickProps: ClickProps(),
          
          // dropdownButtonProps: DropdownButtonProps(
          //   iconOpened: SvgPicture.asset('assets/icons/arrow_down_drop.svg'),
          //   iconClosed: SvgPicture.asset('assets/icons/arrow_down_drop.svg'),
          // ),
          decoratorProps: DropDownDecoratorProps(
            baseStyle: TextStyle(
              fontSize: Get.height * AppConstants.themeConstants.fontsize_13,
              fontWeight: FontWeight.w500,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: filledColor ?? Theme.of(context).colorScheme.primaryContainer,
              hintText: hintText ?? title,
              hintStyle: TextStyle(
                fontSize: Get.height * AppConstants.themeConstants.fontsize_13,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w500,
                color: Theme.of(context).colorScheme.surfaceContainer,
                overflow: TextOverflow.ellipsis,
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
              prefixIcon: prefixIcon,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.0),
                borderSide: BorderSide(color: Colors.grey.shade300, width: 1.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6.0),
                borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 1.2),
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
          ),
          popupProps: showBottomSheet == false
                        ? PopupProps.menu(
                          showSelectedItems: true,
                          showSearchBox: true,
                            searchFieldProps: TextFieldProps(
                              decoration: InputDecoration(
                              suffixIcon: Icon(
                                Icons.search,
                                color: Theme.of(context).colorScheme.primary,
                              ),
                              filled: true,
                              fillColor: Theme.of(context).colorScheme.primaryContainer,
                              hintText: 'Search Here',
                            )),
                            fit: FlexFit.loose,
                            constraints: BoxConstraints(maxHeight: 500),
                            menuProps:  MenuProps(backgroundColor: Colors.white)
                          )
                        : PopupPropsMultiSelection.modalBottomSheet(
                          disabledItemFn: disableItemFn,
                          showSelectedItems: true,
                          showSearchBox: true,
                          itemBuilder: itemBuilder,
                          fit: FlexFit.tight,
                          searchFieldProps: TextFieldProps(
                              decoration: InputDecoration(
                            suffixIcon: Icon(
                              Icons.search,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            filled: true,
                            fillColor: Theme.of(context).colorScheme.primaryContainer,
                            hintText: 'Search Here',
                          )),
                          modalBottomSheetProps: ModalBottomSheetProps(
                              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  topRight: Radius.circular(25),
                                ),
                              )),
                          title: Container(
                            height: Get.height * 50 / 896,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [Color.fromRGBO(197, 0, 53, 1), Color.fromRGBO(126, 32, 57, 1)],
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                title!,
                                style: TextStyle(
                                  fontSize: Get.height * AppConstants.themeConstants.fontsize_14,
                                  fontWeight: FontWeight.w500,
                                  fontFamily: 'Poppins',
                                  color: Theme.of(context).colorScheme.primaryContainer,
                                ),
                              ),
                            ),
                          )),
          onChanged: onChanged,
        ),
      ],
    );
  }

  // static Column defaultDropdownResponsive<T>(context,
  //     {Key? key,
  //     //   TextEditingController? controller,
  //     String? title,
  //     String? hintText,
  //     bool? enabled,
  //     List<T>? items,
  //     validator,
  //     Future<List<T>> Function(String)? asyncItems,
  //     compareFn,
  //     itemAsString,
  //     selectedItem,
  //     onChanged,
  //     itemBuilder,
  //     bool? showTitle = true,
  //     bool? showBottomSheet = true,
  //     }) {
  //   return Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
  //     Visibility(
  //       visible: showTitle == true ? true : false,
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           // Text(title!, style: TextStyle(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.w500, fontSize: 10)),
  //           Text(title!, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 10)),
  //           Container(height: 8),
  //         ],
  //       ),
  //     ),
  //     DropdownSearch<T>(
  //         autoValidateMode: AutovalidateMode.onUserInteraction,
  //         asyncItems: asyncItems,
  //         items: items ?? [],
  //         key: ValueKey(title),
  //         dropdownButtonProps: const DropdownButtonProps(
  //           icon: Icon(Icons.keyboard_arrow_down),
  //         ),
  //         validator: validator,
  //         compareFn: compareFn,
  //         enabled: enabled ?? true,
  //         dropdownDecoratorProps: DropDownDecoratorProps(
  //           dropdownSearchDecoration: InputDecoration(
  //             contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
  //             border: OutlineInputBorder(
  //               borderRadius: BorderRadius.circular(12),
  //               borderSide: BorderSide(color: Colors.grey.shade300),
  //             ),
  //             enabledBorder: OutlineInputBorder(
  //               borderRadius: BorderRadius.circular(12),
  //               borderSide: BorderSide(color: Colors.grey.shade300),
  //             ),
  //             focusedBorder: OutlineInputBorder(
  //               borderRadius: BorderRadius.circular(12),
  //               borderSide: BorderSide(color: Color(0xffE0E0E0)),
  //             ),
  //             filled: true,
  //             fillColor: Colors.white,
  //             labelText: title,
  //             labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
  //             hintText: "Select $title",
  //             hintStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: Colors.grey),
  //           ),
  //         ),
  //         popupProps: showBottomSheet == false
  //             ? PopupProps.menu(
  //                 fit: FlexFit.loose,
  //                 constraints: BoxConstraints(maxHeight: 250),
  //                 menuProps:  MenuProps(backgroundColor: Colors.white)
  //               )
  //             : PopupPropsMultiSelection.modalBottomSheet(
  //                 showSelectedItems: true,
  //                 showSearchBox: true,
  //                 itemBuilder: itemBuilder,
  //                 fit: FlexFit.tight,
  //                 searchFieldProps: const TextFieldProps(
  //                   decoration: InputDecoration(
  //                     border: OutlineInputBorder(
  //                       borderRadius: BorderRadius.all(Radius.circular(12)),
  //                       borderSide: BorderSide(color: Colors.grey),
  //                     ),
  //                     filled: true,
  //                     fillColor: Colors.white,
  //                     suffixIcon: Icon(Icons.search),
  //                     hintText: 'Search Here',
  //                   ),
  //                 ),
  //                 modalBottomSheetProps: ModalBottomSheetProps(
  //                   backgroundColor: Colors.white,
  //                   shape: RoundedRectangleBorder(
  //                     borderRadius: BorderRadius.only(
  //                       topLeft: Radius.circular(25),
  //                       topRight: Radius.circular(25),
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //         itemAsString: itemAsString,
  //         selectedItem: selectedItem,
  //         onChanged: onChanged,
  //       ),
  //   ]);
  // }


  static Column defaultDropdownSearch<T>(
    context, {
    Key? key,
    Icon? prefixIcon,
    String? title = '',
    String? hintText,
    bool? enabled,
    Color? filledColor,
    validator,
    Future<List<T>> Function(String, LoadProps?)? items,
    compareFn,
    disableItemFn,
    itemAsString,
    selectedItem,
    onChanged,
    itemBuilder,
    bool? showBottomSheet = true,
    PopupMenuPosition? popupPosition,
  }) {
    return Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
      AnimationConfiguration.synchronized(
          duration: Duration(milliseconds: 500),
          child: ScaleAnimation(
              child: FadeInAnimation(
                  child: DropdownSearch<T>(
                      autoValidateMode: AutovalidateMode.onUserInteraction,
                      items: items,
                      key: ValueKey(title),
                      suffixProps: DropdownSuffixProps(
                        dropdownButtonProps: DropdownButtonProps(
                            iconOpened: SvgPicture.asset('assets/icons/arrow_down_drop.svg'),
                            iconClosed: SvgPicture.asset('assets/icons/arrow_down_drop.svg')),
                      ),
                      validator: validator,
                      compareFn: compareFn,
                      enabled: enabled ?? true,
                      decoratorProps: DropDownDecoratorProps(
                        baseStyle: TextStyle(
                          fontSize: Get.height * AppConstants.themeConstants.fontsize_14,
                          fontWeight: FontWeight.w500,
                        ),
                        decoration: InputDecoration(
                          filled: true, fillColor: Theme.of(context).colorScheme.primaryContainer,
                          // constraints: BoxConstraints(maxHeight: Get.height * 40 / 896, minHeight: Get.height * 40 / 896),
                          floatingLabelAlignment: FloatingLabelAlignment.start, floatingLabelBehavior: FloatingLabelBehavior.always, labelText: title,

                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Theme.of(context).colorScheme.surface), borderRadius: BorderRadius.circular(8)),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(color: Color.fromRGBO(153, 153, 169, 1)), borderRadius: BorderRadius.circular(8)),
                          hintText: "$title",
                          hintStyle: TextStyle(
                              fontSize: Get.height * AppConstants.themeConstants.fontsize_14,
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context).colorScheme.onSurface),
                          contentPadding: const EdgeInsets.fromLTRB(15, 13, 15, 12),
                          // suffixIconConstraints: const BoxConstraints(minHeight: 10, minWidth: 10, maxHeight: 20, maxWidth: 60),
                          // prefixIconConstraints: const BoxConstraints(minHeight: 10, minWidth: 10, maxHeight: 20, maxWidth: 40),
                        ),
                      ),
                      popupProps: showBottomSheet == false
                        ? PopupProps.menu(
                            fit: FlexFit.loose,
                            constraints: BoxConstraints(maxHeight: 250),
                            menuProps:  MenuProps(backgroundColor: Colors.white)
                          )
                        : PopupPropsMultiSelection.modalBottomSheet(
                          disabledItemFn: disableItemFn,
                          showSelectedItems: true,
                          showSearchBox: true,
                          itemBuilder: itemBuilder,
                          fit: FlexFit.tight,
                          searchFieldProps: TextFieldProps(
                              decoration: InputDecoration(
                            suffixIcon: Icon(
                              Icons.search,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            filled: true,
                            fillColor: Theme.of(context).colorScheme.primaryContainer,
                            hintText: 'Search Here',
                          )),
                          modalBottomSheetProps: ModalBottomSheetProps(
                              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                              shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(25),
                                  topRight: Radius.circular(25),
                                ),
                              )),
                          title: Container(
                            height: Get.height * 50 / 896,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.centerLeft,
                                end: Alignment.centerRight,
                                colors: [Color.fromRGBO(68, 53, 81, 1), Color.fromRGBO(47, 36, 54, 1)],
                              ),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                title!,
                                style: TextStyle(
                                  fontSize: Get.height * AppConstants.themeConstants.fontsize_15,
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).colorScheme.primaryContainer,
                                ),
                              ),
                            ),
                          )),
                      itemAsString: itemAsString,
                      selectedItem: selectedItem,
                      onChanged: onChanged))))
    ]);
  }

  static Column defaultDropdownSearchMultipleSelection<T>(
    context, {
    Key? key,
    String? title,
    String? hintText,
    bool? enabled,
    validator,
    Future<List<T>> Function(String, LoadProps?)? items,
    String? Function(List<T>?)? itemAsString,
    compareFn,
    // itemAsString,
    selectedItem,
    onChanged,
    onCheckBoxChanged,
    onCheckBoxDeleted,
    itemBuilder,
    bool? showBottomSheet = true,
  }) {
    return Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        title!,
        style: TextStyle(color: Theme.of(context).colorScheme.surface, fontWeight: FontWeight.w500),
      ),
      Container(height: 5),
      ShadowContainer(
          defaultRadius: false,
          radius: 15,
          child: DropdownSearch<T>.multiSelection(
              autoValidateMode: AutovalidateMode.onUserInteraction,
              items: items,
              key: ValueKey(title),
              suffixProps: const DropdownSuffixProps(
                dropdownButtonProps: DropdownButtonProps(iconOpened: Icon(Icons.keyboard_arrow_down)),
              ),
              dropdownBuilder: (context, selectedItems) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: selectedItems.map((item) {
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
                        child: Chip(
                          label: Text(item.toString()),
                          // onDeleted: () {
                          //   selectedItems.remove(item);
                          //   onChanged?.call(List<T>.from(selectedItems));
                          // },
                          onDeleted: onCheckBoxDeleted,
                        ),
                      );
                    }).toList(),
                  ),
                );
              },
              validator: validator,
              compareFn: compareFn,
              enabled: enabled ?? true,
              // decoratorProps: DropDownDecoratorProps(
              //   decoration: InputDecoration(
              //     border: OutlineInputBorder(
              //         borderSide: BorderSide(color: Theme.of(context).colorScheme.primaryContainer), borderRadius: BorderRadius.circular(15)),
              //     hintText: "Select $title",
              //   ),
              // ),
              popupProps: showBottomSheet == false
                        ? PopupPropsMultiSelection.menu(
                          itemBuilder: itemBuilder,
                          
                            showSelectedItems: true,
                            showSearchBox: true,
                            searchFieldProps: TextFieldProps(
                              decoration: InputDecoration(
                                suffixIcon: Icon(
                                  Icons.search,
                                  color: Theme.of(context).colorScheme.primary,
                                ),
                                filled: true,
                                fillColor: Theme.of(context).colorScheme.primaryContainer,
                                hintText: 'Search Here',
                              ),
                            ),
                            fit: FlexFit.loose,
                            constraints: BoxConstraints(maxHeight: 250),
                            menuProps:  MenuProps(backgroundColor: Colors.white)
                          )
                        :  PopupPropsMultiSelection.modalBottomSheet(
                  showSelectedItems: true,
                  showSearchBox: true,
                  itemBuilder: itemBuilder,
                  fit: FlexFit.tight,
                  searchFieldProps: TextFieldProps(
                      decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.search,
                      color: Theme.of(context).colorScheme.surface,
                    ),
                    hintText: 'Search Here',
                  )),
                  modalBottomSheetProps: ModalBottomSheetProps(
                      backgroundColor: Theme.of(context).colorScheme.primary,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(25),
                          topRight: Radius.circular(25),
                        ),
                      )),
                  // title: Container(
                  //   height: 50,
                  //   decoration: const BoxDecoration(
                  //     borderRadius: BorderRadius.only(
                  //       topLeft: Radius.circular(25),
                  //       topRight: Radius.circular(25),
                  //     ),
                  //   ),
                  //   child: Center(
                  //     child: Text(
                  //       title,
                  //       style: TextStyle(
                  //         fontSize: Get.height * AppConstants.themeConstants.fontsize_24,
                  //         fontWeight: FontWeight.bold,
                  //         color: Theme.of(context).colorScheme.secondaryContainer,
                  //       ),
                  //     ),
                    ),
                  // )),
              // itemAsString: itemAsString,
              onChanged: onChanged))
    ]);
  }
}
