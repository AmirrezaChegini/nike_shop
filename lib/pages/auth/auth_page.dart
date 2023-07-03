import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_shop/bloc/auth/auth_bloc.dart';
import 'package:nike_shop/bloc/auth/auth_event.dart';
import 'package:nike_shop/bloc/auth/auth_state.dart';
import 'package:nike_shop/bloc/cart/cart_bloc.dart';
import 'package:nike_shop/bloc/cart/cart_event.dart';
import 'package:nike_shop/constants/my_color.dart';
import 'package:nike_shop/cubit/auth_cubit.dart';
import 'package:nike_shop/cubit/edt_pass_cubti.dart';
import 'package:nike_shop/pages/auth/widgets/edt_text.dart';
import 'package:nike_shop/pages/auth/widgets/text_btn.dart';
import 'package:nike_shop/widgets/loading_anim.dart';
import 'package:nike_shop/widgets/my_snackbar.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  String username = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColor.dark,
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: SizedBox(
          height: MediaQuery.of(context).size.height - 56,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/nike_logo.png',
                    color: MyColor.white),
                const SizedBox(height: 20),
                const Text(
                  'خوش آمدید',
                  style: TextStyle(
                    color: MyColor.white,
                    fontFamily: 'iranyekan',
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  'اطلاعات حساب خود را وارد کنید',
                  style: TextStyle(
                    color: MyColor.white,
                    fontFamily: 'iranyekan',
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 40),
                Form(
                  key: _globalKey,
                  child: Column(
                    children: [
                      EdtText(
                        label: 'پست الکترونیک',
                        textInputAction: TextInputAction.next,
                        textInputType: TextInputType.emailAddress,
                        validator: (value) {
                          bool isMatch = RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(value);
                          if (value.isEmpty) {
                            return ' ایمیل خود را وارد کنید';
                          } else if (!isMatch) {
                            return 'فرمت ایمیل اشتباه است';
                          }

                          username = value;
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      BlocBuilder<EdtPassCubit, bool>(
                        builder: (context, state) => EdtText(
                          label: 'رمز عبور',
                          textInputAction: TextInputAction.done,
                          textInputType: TextInputType.visiblePassword,
                          obsecure: state,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              BlocProvider.of<EdtPassCubit>(context)
                                  .changeObsecure(!state);
                            },
                            child: Icon(
                              state
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                              color: MyColor.grey,
                            ),
                          ),
                          validator: (value) {
                            bool isMatch = RegExp(
                                    r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$')
                                .hasMatch(value);

                            if (value.isEmpty) {
                              return 'رمز عبور خود را وارد کنید';
                            } else if (!isMatch) {
                              return 'رمز عبور باید شامل اعداد و حروف انگلیسی بزرگ و کوچک باشد';
                            }
                            password = value;
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                BlocConsumer<LoginAuthBloc, LoginAuthState>(
                  builder: (context, state) {
                    if (state is InitLoginState) {
                      return TextBtn(
                        backgroundColor: MyColor.white,
                        foregroundColor: MyColor.dark,
                        child: const Text('ورود'),
                        ontap: () {
                          if (_globalKey.currentState!.validate()) {
                            BlocProvider.of<LoginAuthBloc>(context)
                                .add(LoginAuthEvent(username, password));
                          }
                        },
                      );
                    }

                    if (state is FailedLoginState) {
                      return TextBtn(
                        backgroundColor: MyColor.white,
                        foregroundColor: MyColor.dark,
                        child: const Text('ورود'),
                        ontap: () {
                          if (_globalKey.currentState!.validate()) {
                            BlocProvider.of<LoginAuthBloc>(context)
                                .add(LoginAuthEvent(username, password));
                          }
                        },
                      );
                    }

                    if (state is LoadingLoginState) {
                      return TextBtn(
                        backgroundColor: MyColor.white,
                        foregroundColor: MyColor.dark,
                        child: const LoadingAnim(color: MyColor.dark),
                        ontap: () {},
                      );
                    }

                    return TextBtn(
                      backgroundColor: MyColor.white,
                      foregroundColor: MyColor.dark,
                      child: const Text('ورود'),
                      ontap: () {
                        if (_globalKey.currentState!.validate()) {
                          BlocProvider.of<LoginAuthBloc>(context)
                              .add(LoginAuthEvent(username, password));
                        }
                      },
                    );
                  },
                  listener: (context, state) {
                    if (state is FailedLoginState) {
                      showMessage(context, state.errorMessage);
                    }

                    if (state is CompletedLoginState) {
                      BlocProvider.of<AuthCubit>(context).isLoggedIn(true);
                      BlocProvider.of<CartBloc>(context).add(GetAllCartEvent());
                    }
                  },
                ),
                const SizedBox(height: 10),
                BlocConsumer<RegisterAuthBloc, RegisterAuthState>(
                  builder: (context, state) {
                    if (state is InitRegisterState) {
                      return TextBtn(
                        backgroundColor: MyColor.dark,
                        foregroundColor: MyColor.white,
                        child: const Text('ثبت نام'),
                        ontap: () {
                          if (_globalKey.currentState!.validate()) {
                            BlocProvider.of<RegisterAuthBloc>(context)
                                .add(RegisterAuthEvent(username, password));
                          }
                        },
                      );
                    }

                    if (state is LoadingRegisterState) {
                      return TextBtn(
                        backgroundColor: MyColor.dark,
                        foregroundColor: MyColor.white,
                        child: const LoadingAnim(color: MyColor.white),
                        ontap: () {},
                      );
                    }

                    if (state is FailedRegisterState) {
                      return TextBtn(
                        backgroundColor: MyColor.dark,
                        foregroundColor: MyColor.white,
                        child: const Text('ثبت نام'),
                        ontap: () {
                          if (_globalKey.currentState!.validate()) {
                            BlocProvider.of<RegisterAuthBloc>(context)
                                .add(RegisterAuthEvent(username, password));
                          }
                        },
                      );
                    }

                    return TextBtn(
                      backgroundColor: MyColor.dark,
                      foregroundColor: MyColor.white,
                      child: const Text('ثبت نام'),
                      ontap: () {
                        if (_globalKey.currentState!.validate()) {
                          BlocProvider.of<RegisterAuthBloc>(context)
                              .add(RegisterAuthEvent(username, password));
                        }
                      },
                    );
                  },
                  listener: (context, state) {
                    if (state is FailedRegisterState) {
                      showMessage(context, state.errorMessage);
                    }

                    if (state is CompletedRegisterState) {
                      if (_globalKey.currentState!.validate()) {
                        BlocProvider.of<LoginAuthBloc>(context)
                            .add(LoginAuthEvent(username, password));
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
