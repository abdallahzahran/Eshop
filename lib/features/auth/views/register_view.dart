import 'package:ecommerce_shop/core/helper/my_validator.dart';
import 'package:ecommerce_shop/core/translation/translation_keys.dart';
import 'package:ecommerce_shop/core/utils/app_assets.dart';
import 'package:ecommerce_shop/core/utils/app_text_styles.dart';
import 'package:ecommerce_shop/core/widgets/custom_btn.dart';
import 'package:ecommerce_shop/core/widgets/custom_form_field.dart';
import 'package:ecommerce_shop/features/auth/manager/register_cubit/cubit/register_cubit.dart';
import 'package:ecommerce_shop/features/auth/manager/register_cubit/cubit/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: BlocConsumer<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state is RegisterLoadingState) {
            // Optionally show a loading indicator
          } else if (state is RegisterSuccessState) {
            // Show success message and navigate back to login or home
             ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Registration Successful!')),
            );
            Navigator.pop(context); // Assuming you want to go back to login after successful registration
          } else if (state is RegisterErrorState) {
            // Show error message
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(state.error)),
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              leading: InkWell(
                onTap: () => Navigator.pop(context),
                child: SvgPicture.asset(
                  AppAssets.arrowback,
                  fit: BoxFit.scaleDown,
                ),
              ),
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0), // Adjusted padding
                child: SingleChildScrollView( // Wrapped with SingleChildScrollView
                  child: Form(
                    key: RegisterCubit.get(context).formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.stretch, // Stretch children
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 24.0), // Adjusted padding
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Create an \naccount',
                              style: AppTextStyle.loginTitel,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        CustomFormField(
                          hintText: 'Full Name',
                          prefixIcon: SvgPicture.asset(
                            AppAssets.user,
                            fit: BoxFit.scaleDown,
                          ),
                          controller: RegisterCubit.get(context).userName,
                          validator: requiredValidator,
                        ),
                        SizedBox(height: 20),
                        CustomFormField(
                          hintText: 'Phone',
                          prefixIcon: SvgPicture.asset(
                            AppAssets.call,
                            fit: BoxFit.scaleDown,
                          ),
                          controller: RegisterCubit.get(context).phone,
                          validator: phoneValidator,
                        ),
                        SizedBox(height: 20),
                        CustomFormField(
                          hintText: 'Email',
                          prefixIcon: SvgPicture.asset(
                            AppAssets.email,
                            fit: BoxFit.scaleDown,
                          ),
                          controller: RegisterCubit.get(context).emailController,
                          validator: emailValidator,
                        ),
                        SizedBox(height: 20),
                        CustomFormField(

                          hintText: 'Password',
                          prefixIcon: SvgPicture.asset(
                            AppAssets.lock,
                            fit: BoxFit.scaleDown,
                          ),
                          suffixIcon: SvgPicture.asset(
                            AppAssets.eye,
                            fit: BoxFit.scaleDown,
                          ),
                          controller: RegisterCubit.get(context).passwordController,
                          validator: passwordValidator,
                        obscureText: true,
                        ),
                        SizedBox(height: 20),
                        CustomFormField(
                          hintText: 'Confirm Password',
                          prefixIcon: SvgPicture.asset(
                            AppAssets.lock,
                            fit: BoxFit.scaleDown,
                          ),
                          suffixIcon: SvgPicture.asset(
                            AppAssets.eye,
                            fit: BoxFit.scaleDown,
                          ),
                          controller: RegisterCubit.get(context).passwordConfirmController,
                          validator: (value) => passwordValidator(value, confirm: RegisterCubit.get(context).passwordController.text),
                        obscureText: true,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'By clicking the Register button, you agree\n to the public offer',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                        ),
                        SizedBox(height: 40),
                         state is RegisterLoadingState
                            ? const Center(child: CircularProgressIndicator()) // Show loading indicator
                            : CustomBtn(
                               onPressed: () => RegisterCubit.get(context).onRegisterPressed(),
                               text: TranslationKeys.register,
                              ),
                        SizedBox(height: 70),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
