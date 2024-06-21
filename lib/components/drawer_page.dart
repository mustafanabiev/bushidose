import 'package:bushidose/components/premium_text_page.dart';
import 'package:bushidose/modules/main/cubit/main_cubit.dart';
import 'package:bushidose/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class DrawerPage extends StatelessWidget {
  const DrawerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width * 0.9,
      shape: const RoundedRectangleBorder(),
      child: BlocBuilder<MainCubit, MainState>(
        builder: (context, state) {
          if (state.premium == true) {
            return Container(
              decoration: const BoxDecoration(
                color: AppColors.bg,
                borderRadius: BorderRadius.zero,
                border: Border(left: BorderSide()),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      15,
                      MediaQuery.of(context).size.height * 0.1,
                      15,
                      0,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RichText(
                              text: const TextSpan(
                                text: 'BUSHI DOSE',
                                style: TextStyle(
                                  fontFamily: 'Inter',
                                  color: AppColors.textBlue,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w700,
                                  height: 19.36 / 16,
                                ),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: ' PREMIUM',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ],
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: SvgPicture.asset(
                                'assets/icons/close.svg',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 15,
                      top: 350 / 2,
                    ),
                    width: 350,
                    height: 350,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        alignment: Alignment.centerLeft,
                        image: AssetImage('assets/images/Ellipse 11.png'),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Support'.toUpperCase(),
                          style: const TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            height: 23.44 / 20,
                            letterSpacing: -0.3,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 45),
                        Text(
                          'privacy policy'.toUpperCase(),
                          style: const TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            height: 23.44 / 20,
                            letterSpacing: -0.3,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'terms & conditions'.toUpperCase(),
                          style: const TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            height: 23.44 / 20,
                            letterSpacing: -0.3,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: SvgPicture.asset(
                        'assets/icons/Group.svg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            );
          } else {
            return Container(
              decoration: const BoxDecoration(
                color: AppColors.bg,
                borderRadius: BorderRadius.zero,
                border: Border(left: BorderSide()),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      15,
                      MediaQuery.of(context).size.height * 0.1,
                      15,
                      0,
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'BUSHI DOSE',
                              style: TextStyle(
                                fontFamily: 'Inter',
                                color: AppColors.textBlue,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w700,
                                height: 19.36 / 16,
                              ),
                            ),
                            IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: SvgPicture.asset('assets/icons/close.svg'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(
                      left: 15,
                      top: 10,
                    ),
                    width: 350,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        alignment: Alignment.topLeft,
                        image: AssetImage(
                          'assets/images/Ellipse 11.png',
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Unlock Premium',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            color: AppColors.textBlue,
                            fontSize: 36,
                            fontWeight: FontWeight.w500,
                            height: 42.19 / 36,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        const SizedBox(height: 14),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/CheckCircle.svg',
                            ),
                            const SizedBox(width: 3),
                            const PremiumTextWidget(text: 'Ad-free app'),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/CheckCircle.svg',
                            ),
                            const SizedBox(width: 3),
                            const PremiumTextWidget(
                              text: 'Access to Haiku',
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/icons/CheckCircle.svg',
                            ),
                            const SizedBox(width: 3),
                            const PremiumTextWidget(
                              text: 'One-time payment',
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              context.read<MainCubit>().premium();
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xffFFCD03),
                              padding: const EdgeInsets.all(9),
                              shape: const RoundedRectangleBorder(
                                side: BorderSide(),
                              ),
                            ),
                            child: const Text(
                              'Unlock Now For \$0.99',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                height: 22 / 20,
                                letterSpacing: -0.02,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        Text(
                          'restore'.toUpperCase(),
                          style: const TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            height: 23.44 / 20,
                            letterSpacing: -0.3,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'Support'.toUpperCase(),
                          style: const TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            height: 23.44 / 20,
                            letterSpacing: -0.3,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 45),
                        Text(
                          'privacy policy'.toUpperCase(),
                          style: const TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            height: 23.44 / 20,
                            letterSpacing: -0.3,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'terms & conditions'.toUpperCase(),
                          style: const TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            height: 23.44 / 20,
                            letterSpacing: -0.3,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
            // return Container(
            //   decoration: const BoxDecoration(
            //     color: AppColors.bg,
            //     borderRadius: BorderRadius.zero,
            //     border: Border(
            //       left: BorderSide(),
            //     ),
            //   ),
            //   width: double.infinity,
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       // Positioned(
            //       //   top: MediaQuery.of(context).size.height * 0.2,
            //       //   child: Padding(
            //       //     padding: const EdgeInsets.only(bottom: 20),
            //       //     child: Image.asset('assets/images/Ellipse 11.png'),
            //       //   ),
            //       // ),
            //       Padding(
            //         padding: EdgeInsets.fromLTRB(
            //           15,
            //           MediaQuery.of(context).size.height * 0.1,
            //           15,
            //           15,
            //         ),
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //                 Text(
            //                   'bushi dose'.toUpperCase(),
            //                   style: const TextStyle(
            //                     fontFamily: 'Inter',
            //                     color: AppColors.textBlue,
            //                     fontSize: 16.0,
            //                     fontWeight: FontWeight.w700,
            //                     height: 19.36 / 16,
            //                   ),
            //                 ),
            //                 IconButton(
            //                   onPressed: () {
            //                     Navigator.pop(context);
            //                   },
            //                   icon: SvgPicture.asset('assets/icons/close.svg'),
            //                 ),
            //               ],
            //             ),
            //             Container(
            //               padding: const EdgeInsets.only(
            //                 left: 15,
            //                 top: 350 / 2,
            //               ),
            //               width: 350,
            //               height: 350,
            //               decoration: const BoxDecoration(
            //                 image: DecorationImage(
            //                   alignment: Alignment.centerLeft,
            //                   image: AssetImage('assets/images/Ellipse 11.png'),
            //                 ),
            //               ),
            //               child: Column(
            //                 crossAxisAlignment: CrossAxisAlignment.start,
            //                 children: [
            //                   Text(
            //                     'Support'.toUpperCase(),
            //                     style: const TextStyle(
            //                       fontFamily: 'Roboto',
            //                       fontSize: 20,
            //                       color: Colors.white,
            //                       fontWeight: FontWeight.w400,
            //                       height: 23.44 / 20,
            //                       letterSpacing: -0.3,
            //                     ),
            //                     textAlign: TextAlign.center,
            //                   ),
            //                   const SizedBox(height: 45),
            //                   Text(
            //                     'privacy policy'.toUpperCase(),
            //                     style: const TextStyle(
            //                       fontFamily: 'Roboto',
            //                       fontSize: 20,
            //                       color: Colors.black,
            //                       fontWeight: FontWeight.w400,
            //                       height: 23.44 / 20,
            //                       letterSpacing: -0.3,
            //                     ),
            //                     textAlign: TextAlign.center,
            //                   ),
            //                   const SizedBox(height: 20),
            //                   Text(
            //                     'terms & conditions'.toUpperCase(),
            //                     style: const TextStyle(
            //                       fontFamily: 'Roboto',
            //                       fontSize: 20,
            //                       color: Colors.black,
            //                       fontWeight: FontWeight.w400,
            //                       height: 23.44 / 20,
            //                       letterSpacing: -0.3,
            //                     ),
            //                     textAlign: TextAlign.center,
            //                   ),
            //                 ],
            //               ),
            //             ),
            //             // Padding(
            //             //   padding: EdgeInsets.only(
            //             //     top: MediaQuery.of(context).size.height * 0.045,
            //             //   ),
            // child: Column(
            //   crossAxisAlignment: CrossAxisAlignment.start,
            //   children: [
            //     const Text(
            //       'Unlock Premium',
            //       style: TextStyle(
            //         fontFamily: 'Roboto',
            //         color: AppColors.textBlue,
            //         fontSize: 36,
            //         fontWeight: FontWeight.w500,
            //         height: 42.19 / 36,
            //       ),
            //       textAlign: TextAlign.left,
            //     ),
            //     const SizedBox(height: 14),
            //     Row(
            //       children: [
            //         SvgPicture.asset(
            //           'assets/icons/CheckCircle.svg',
            //         ),
            //         const SizedBox(width: 3),
            //         const PremiumTextWidget(text: 'Ad-free app'),
            //       ],
            //     ),
            //     const SizedBox(height: 10),
            //     Row(
            //       children: [
            //         SvgPicture.asset(
            //           'assets/icons/CheckCircle.svg',
            //         ),
            //         const SizedBox(width: 3),
            //         const PremiumTextWidget(
            //           text: 'Access to Haiku',
            //         ),
            //       ],
            //     ),
            //     const SizedBox(height: 10),
            //     Row(
            //       children: [
            //         SvgPicture.asset(
            //           'assets/icons/CheckCircle.svg',
            //         ),
            //         const SizedBox(width: 3),
            //         const PremiumTextWidget(
            //           text: 'One-time payment',
            //         ),
            //       ],
            //     ),
            //     const SizedBox(height: 10),
            //     SizedBox(
            //       width: double.infinity,
            //       child: ElevatedButton(
            //         onPressed: () {
            //           context.read<MainCubit>().premium();
            //           Navigator.pop(context);
            //         },
            //         style: ElevatedButton.styleFrom(
            //           backgroundColor: const Color(0xffFFCD03),
            //           padding: const EdgeInsets.all(9),
            //           shape: const RoundedRectangleBorder(
            //             side: BorderSide(),
            //           ),
            //         ),
            //         child: const Text(
            //           'Unlock Now For \$0.99',
            //           style: TextStyle(
            //             fontFamily: 'Roboto',
            //             fontSize: 20,
            //             color: Colors.black,
            //             fontWeight: FontWeight.w400,
            //             height: 22 / 20,
            //             letterSpacing: -0.02,
            //           ),
            //           textAlign: TextAlign.left,
            //         ),
            //       ),
            //     ),
            //     const SizedBox(height: 30),
            //     Text(
            //       'restore'.toUpperCase(),
            //       style: const TextStyle(
            //         fontFamily: 'Roboto',
            //         fontSize: 20,
            //         color: Colors.white,
            //         fontWeight: FontWeight.w400,
            //         height: 23.44 / 20,
            //         letterSpacing: -0.3,
            //       ),
            //       textAlign: TextAlign.center,
            //     ),
            //     const SizedBox(height: 20),
            //     Text(
            //       'Support'.toUpperCase(),
            //       style: const TextStyle(
            //         fontFamily: 'Roboto',
            //         fontSize: 20,
            //         color: Colors.white,
            //         fontWeight: FontWeight.w400,
            //         height: 23.44 / 20,
            //         letterSpacing: -0.3,
            //       ),
            //       textAlign: TextAlign.center,
            //     ),
            //     const SizedBox(height: 45),
            //     Text(
            //       'privacy policy'.toUpperCase(),
            //       style: const TextStyle(
            //         fontFamily: 'Roboto',
            //         fontSize: 20,
            //         color: Colors.black,
            //         fontWeight: FontWeight.w400,
            //         height: 23.44 / 20,
            //         letterSpacing: -0.3,
            //       ),
            //       textAlign: TextAlign.center,
            //     ),
            //     const SizedBox(height: 20),
            //     Text(
            //       'terms & conditions'.toUpperCase(),
            //       style: const TextStyle(
            //         fontFamily: 'Roboto',
            //         fontSize: 20,
            //         color: Colors.black,
            //         fontWeight: FontWeight.w400,
            //         height: 23.44 / 20,
            //         letterSpacing: -0.3,
            //       ),
            //       textAlign: TextAlign.center,
            //     ),
            //   ],
            // ),
            //             // ),
            //           ],
            //         ),
            //       ),
            //     ],
            //   ),
            // );
          }
        },
      ),
    );
  }
}
