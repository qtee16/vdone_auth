import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vdone_auth_ui/custom_submit_button.dart';
import 'package:vdone_auth_ui/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Image.asset(
                "assets/images/background.png",
                fit: BoxFit.fitWidth,
              ),
              Positioned(
                bottom: 0,
                width: size.width,
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/logo.png",
                      width: 100,
                    ),
                    const SizedBox(height: 24,),
                    Container(
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF4F4F4),
                        borderRadius: BorderRadius.circular(12)
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                isLogin = true;
                              });
                            },
                            child: Container(
                              width: 160,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: isLogin ? Colors.white : Colors.transparent,
                                boxShadow: const [
                                  BoxShadow(
                                    color: Color.fromRGBO(7, 48, 45, 0.06),
                                    spreadRadius: 2,
                                    blurRadius: 6,
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Center(
                                child: Text(
                                  "Đăng nhập",
                                  style: TextStyle(
                                    fontWeight: isLogin ? FontWeight.w600 : FontWeight.w400,
                                    fontSize: 14,
                                    height: 20/14,
                                    leadingDistribution: TextLeadingDistribution.even,
                                    color: isLogin ? const Color(0xFF212121) : const Color(0xFF6E6E6E)
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 4,),
                          InkWell(
                            onTap: () {
                              setState(() {
                                isLogin = false;
                              });
                            },
                            child: Container(
                              width: 160,
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: isLogin ? Colors.transparent : Colors.white,
                              ),
                              child: Center(
                                child: Text(
                                  "Đăng ký",
                                  style: TextStyle(
                                    fontWeight: isLogin ? FontWeight.w400 : FontWeight.w600,
                                    fontSize: 14,
                                    height: 20/14,
                                    leadingDistribution: TextLeadingDistribution.even,
                                    color: isLogin ? const Color(0xFF6E6E6E) : const Color(0xFF212121),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 24,),
          isLogin ? const LoginWidget() : const RegisterWidget()
        ],
      ),
    );
  }
}

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final usernameCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Số điện thoại",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Color(0xFF212121),
              height: 20/14,
              leadingDistribution: TextLeadingDistribution.even
            ),
          ),
          const SizedBox(height: 4,),
          CustomTextField(
            controller: usernameCtrl,
            prefixIcon: IntrinsicHeight(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    child: Image.asset(
                      "assets/icons/ic_phone.png",
                      width: 24,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: VerticalDivider(
                      color: Color(0xFFD9D9D9),
                      thickness: 1,
                      width: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/icons/vn_flag.png",
                          width: 22,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 4,),
                        const Text(
                          "+84",
                          style: TextStyle(
                            color: Color(0xFF212121),
                            height: 20/14,
                            leadingDistribution: TextLeadingDistribution.even,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            hintText: "Nhập số điện thoại",
            hintStyle: const TextStyle(
              color: Color(0xFF8C8C8C),
              fontSize: 14,
              height: 20/14,
              leadingDistribution: TextLeadingDistribution.even,
            ),
          ),
          const SizedBox(height: 16,),
          const Text(
            "Mật khẩu",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Color(0xFF212121),
              height: 20/14,
              leadingDistribution: TextLeadingDistribution.even
            ),
          ),
          const SizedBox(height: 4,),
          CustomTextField(
            controller: passwordCtrl,
            hintText: "**************",
            hintStyle: const TextStyle(
              color: Color(0xFF8C8C8C),
              fontSize: 14,
              height: 20/14,
              leadingDistribution: TextLeadingDistribution.even,
            ),
            isPassword: true,
          ),
          const SizedBox(height: 16,),
          const Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12,),
              child: Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF8C8C8C),
                    height: 20/14,
                    leadingDistribution: TextLeadingDistribution.even,
                  ),
                  children: [
                    TextSpan(
                      text: "Bằng việc đăng ký là đồng ý với\n"
                    ),
                    TextSpan(
                      text: "Điều khoản dịch vụ và Chính sách",
                      style: TextStyle(
                        color: Color(0xFF085CAF)
                      )
                    ),
                    TextSpan(
                      text: " của VDONE"
                    ),
                  ]
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          const SizedBox(height: 12,),
          CustomSubmitButton(
            title: "Đăng nhập",
            onTap: () {},
            color: Colors.white,
            gradientBackgroundColor: const LinearGradient(
              colors: [
                Color(0xFF015CB5),
                Color(0xFF0E86FC),
              ],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.0, 0.0),
            ),
          ),
          const SizedBox(height: 12,),
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              child: InkWell(
                onTap: () {},
                child: const Text(
                  "Quên mật khẩu?",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    height: 20/14,
                    leadingDistribution: TextLeadingDistribution.even,
                    color: Color(0xFF8C8C8C),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({super.key});

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  final usernameCtrl = TextEditingController();
  final passwordCtrl = TextEditingController();
  final rePasswordCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Số điện thoại",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Color(0xFF212121),
              height: 20/14,
              leadingDistribution: TextLeadingDistribution.even
            ),
          ),
          const SizedBox(height: 4,),
          CustomTextField(
            controller: usernameCtrl,
            prefixIcon: IntrinsicHeight(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    child: Image.asset(
                      "assets/icons/ic_phone.png",
                      width: 24,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0),
                    child: VerticalDivider(
                      color: Color(0xFFD9D9D9),
                      thickness: 1,
                      width: 1,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      children: [
                        Image.asset(
                          "assets/icons/vn_flag.png",
                          width: 22,
                          fit: BoxFit.cover,
                        ),
                        const SizedBox(width: 4,),
                        const Text(
                          "+84",
                          style: TextStyle(
                            color: Color(0xFF212121),
                            height: 20/14,
                            leadingDistribution: TextLeadingDistribution.even,
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            hintText: "Nhập số điện thoại",
            hintStyle: const TextStyle(
              color: Color(0xFF8C8C8C),
              fontSize: 14,
              height: 20/14,
              leadingDistribution: TextLeadingDistribution.even,
            ),
          ),
          const SizedBox(height: 16,),
          const Text(
            "Mật khẩu",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Color(0xFF212121),
              height: 20/14,
              leadingDistribution: TextLeadingDistribution.even
            ),
          ),
          const SizedBox(height: 4,),
          CustomTextField(
            controller: passwordCtrl,
            hintText: "**************",
            hintStyle: const TextStyle(
              color: Color(0xFF8C8C8C),
              fontSize: 14,
              height: 20/14,
              leadingDistribution: TextLeadingDistribution.even,
            ),
            isPassword: true,
          ),
          const SizedBox(height: 16,),
          const Text(
            "Nhập lại mật khẩu",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Color(0xFF212121),
              height: 20/14,
              leadingDistribution: TextLeadingDistribution.even
            ),
          ),
          const SizedBox(height: 4,),
          CustomTextField(
            controller: rePasswordCtrl,
            hintText: "**************",
            hintStyle: const TextStyle(
              color: Color(0xFF8C8C8C),
              fontSize: 14,
              height: 20/14,
              leadingDistribution: TextLeadingDistribution.even,
            ),
            isPassword: true,
          ),
          const SizedBox(height: 24,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Lưu ý về mật khẩu:",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 20/14,
                  leadingDistribution: TextLeadingDistribution.even,
                  color: Color(0xFF6E6E6E)
                ),
              ),
              const SizedBox(height: 8,),
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/ic_uncheck-circle.svg",
                    width: 16,
                  ),
                  const SizedBox(width: 4,),
                  const Text(
                    "Tối thiểu 8 ký tự",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      height: 20/14,
                      leadingDistribution: TextLeadingDistribution.even,
                      color: Color(0xFF6E6E6E)
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8,),
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/ic_uncheck-circle.svg",
                    width: 16,
                  ),
                  const SizedBox(width: 4,),
                  const Text(
                    "Có ít nhất một ký tự viết hoa",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      height: 20/14,
                      leadingDistribution: TextLeadingDistribution.even,
                      color: Color(0xFF6E6E6E)
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8,),
              Row(
                children: [
                  SvgPicture.asset(
                    "assets/icons/ic_uncheck-circle.svg",
                    width: 16,
                  ),
                  const SizedBox(width: 4,),
                  const Text(
                    "Có ít nhất 1 chữ số",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      height: 20/14,
                      leadingDistribution: TextLeadingDistribution.even,
                      color: Color(0xFF6E6E6E)
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24,),
          CustomSubmitButton(
            title: "Đăng ký",
            onTap: () {},
            color: Colors.white,
            gradientBackgroundColor: const LinearGradient(
              colors: [
                Color(0xFF015CB5),
                Color(0xFF0E86FC),
              ],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.0, 0.0),
            ),
          ),
          const SizedBox(height: 24,),
          const Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12,),
              child: Text.rich(
                TextSpan(
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF8C8C8C),
                    height: 20/14,
                    leadingDistribution: TextLeadingDistribution.even,
                  ),
                  children: [
                    TextSpan(
                      text: "Bằng việc đăng ký là đồng ý với\n"
                    ),
                    TextSpan(
                      text: "Điều khoản dịch vụ và Chính sách",
                      style: TextStyle(
                        color: Color(0xFF085CAF)
                      )
                    ),
                    TextSpan(
                      text: " của VDONE"
                    ),
                  ]
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}