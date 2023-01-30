import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hossam_test_mvvm/features/presentation/view_models/auth_view_model.dart';
import 'package:hossam_test_mvvm/features/presentation/view_models/home_view_model.dart';
import 'package:hossam_test_mvvm/features/presentation/views/widgets/align_child_by_row.dart';
import 'package:hossam_test_mvvm/features/presentation/views/widgets/custom_text.dart';
import 'package:hossam_test_mvvm/features/presentation/views/widgets/custom_text_form_field.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static final TextEditingController emailTextEditingController =
      TextEditingController();
  static final TextEditingController passTextEditingController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20), topLeft: Radius.circular(20))),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                AlignChildRow(
                  isStart: true,
                  child: CustomText(
                      text: "SignIn".toUpperCase(),
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50.h,
                  child: CustomTextFromField(
                      onChanged: (val) {},
                      hintText: "email",
                      labelText: "email",
                      radius: 10,
                      cursorColor: Colors.black,
                      textEditingController: emailTextEditingController,
                      validator: () {},
                      prefixIcon: null,
                      hasBorder: true,
                      suffixIcon: const SizedBox(),
                      obscureText: false,
                      isLabelError: false),
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomTextFromField(
                    onChanged: (val) {},
                    hintText: "password",
                    labelText:"password",
                    radius: 10,
                    textEditingController: passTextEditingController,
                    cursorColor: Colors.black12,
                    validator: () {},
                    prefixIcon: null,
                    obscureText: false,
                    hasBorder: true,
                    suffixIcon: const Icon(
                      CupertinoIcons.eye_slash,
                      color: Colors.black12,
                    ),
                    // obscureText: authProvider.isSecurePassword,
                    isLabelError: false),
                const SizedBox(
                  height: 30,
                ),
                MaterialButton(
                  onPressed: () async {
                    if (emailTextEditingController.text.trim().isNotEmpty &&
                        passTextEditingController.text.trim().isNotEmpty) {
                      /// function to sign in from viewModel Controller

                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content:  Text("some field is empty",
                            style: TextStyle(color: Colors.white),),backgroundColor: Colors.red,));
                    }
                  },
                  minWidth: double.infinity,
                  color: Colors.black38,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                    side: const BorderSide(width: 2, color: Colors.black38),
                  ),
                  child: InkWell(

                    child: CustomText(
                      text: "SignIn".toUpperCase(),
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.w,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),

              ],
            ),
          )),
    );
  }
}
