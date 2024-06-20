import 'dart:convert';

import 'package:bushidose/components/dropdown_btn.dart';
import 'package:bushidose/components/text_field_widget.dart';
import 'package:bushidose/components/text_widget.dart';
import 'package:bushidose/constants/haiku_magic_list.dart';
import 'package:bushidose/models/haiku_create_model.dart';
import 'package:bushidose/modules/haiku/cubit/haiku_cubit.dart';
import 'package:bushidose/modules/haiku/pages/publish_page.dart';
import 'package:bushidose/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HaikuCreatePage extends StatefulWidget {
  const HaikuCreatePage({
    super.key,
    this.haikuCreateModel,
    this.isChange = false,
  });

  final HaikuCreateModel? haikuCreateModel;
  final bool isChange;

  @override
  State<HaikuCreatePage> createState() => _HaikuCreatePageState();
}

class _HaikuCreatePageState extends State<HaikuCreatePage> {
  final titleCtl = TextEditingController();
  final line1Ctl = TextEditingController();
  final line2Ctl = TextEditingController();
  final line3Ctl = TextEditingController();

  bool isTryMagic = false;

  String? lineValue1;
  String? lineValue2;
  String? lineValue3;

  List<Uint8List> images = [];

  final List<String> initialImages = [
    'assets/images/bg1.jpg',
    'assets/images/bg2.jpg',
    'assets/images/bg3.jpg',
    'assets/images/bg4.jpg',
    'assets/images/bg5.jpg',
  ];

  @override
  void initState() {
    super.initState();
    context
        .read<HaikuCubit>()
        .saveImageCount(widget.haikuCreateModel?.countImage);
    titleCtl.text = widget.haikuCreateModel?.title ?? '';
    line1Ctl.text = widget.haikuCreateModel?.line1 ?? '';
    line2Ctl.text = widget.haikuCreateModel?.line2 ?? '';
    line3Ctl.text = widget.haikuCreateModel?.line3 ?? '';
    titleCtl.addListener(_updateState);
    line1Ctl.addListener(_updateState);
    line2Ctl.addListener(_updateState);
    line3Ctl.addListener(_updateState);

    _loadImages();
  }

  Future<void> _loadImages() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? cachedImageBase64List = prefs.getStringList('cached_images');

    if (cachedImageBase64List != null) {
      List<Uint8List> loadedImages = cachedImageBase64List
          .map((base64String) => base64Decode(base64String))
          .toList();

      setState(() {
        images.addAll(loadedImages);
      });
    } else {
      List<Uint8List> loadedImages = await Future.wait(
        initialImages.map((path) => loadAsset(path)),
      );

      List<String> imageBase64List =
          loadedImages.map((image) => base64Encode(image)).toList();

      await prefs.setStringList('cached_images', imageBase64List);

      setState(() {
        images.addAll(loadedImages);
      });
    }
  }

  Future<Uint8List> loadAsset(String path) async {
    final ByteData data = await rootBundle.load(path);
    return data.buffer.asUint8List();
  }

  @override
  void dispose() {
    titleCtl.removeListener(_updateState);
    line1Ctl.removeListener(_updateState);
    line2Ctl.removeListener(_updateState);
    line3Ctl.removeListener(_updateState);
    titleCtl.dispose();
    line1Ctl.dispose();
    line2Ctl.dispose();
    line3Ctl.dispose();
    super.dispose();
  }

  void _updateState() {
    setState(() {});
  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      Uint8List imageData = await pickedFile.readAsBytes();
      setState(() {
        images.add(imageData);
      });
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String> imageBase64List =
          images.map((image) => base64Encode(image)).toList();

      await prefs.setStringList('cached_images', imageBase64List);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bg,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 15, 15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                        context.read<HaikuCubit>().clear();
                      },
                      icon: SvgPicture.asset('assets/icons/close.svg'),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isTryMagic = !isTryMagic;
                        });
                      },
                      child: Row(
                        children: [
                          const Text(
                            'Try magic write',
                            style: TextStyle(
                              fontFamily: 'Inter',
                              color: Color(0xffB9B9B9),
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              height: 14.52 / 12,
                              textBaseline: TextBaseline.alphabetic,
                            ),
                            textAlign: TextAlign.left,
                          ),
                          const SizedBox(width: 8),
                          SvgPicture.asset('assets/icons/star.svg'),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, top: 66),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFieldWidget(
                        text: 'Title:',
                        controller: titleCtl,
                      ),
                      const SizedBox(height: 32),
                      isTryMagic
                          ? DropdownBtnWidget(
                              text: 'line 1:',
                              onSaved: (value) {
                                lineValue1 = value.toString();
                              },
                              list: data,
                            )
                          : TextFieldWidget(
                              text: 'Line 1:',
                              controller: line1Ctl,
                            ),
                      const SizedBox(height: 32),
                      isTryMagic
                          ? DropdownBtnWidget(
                              text: 'line 2:',
                              onSaved: (value) {
                                lineValue2 = value.toString();
                              },
                              list: data,
                            )
                          : TextFieldWidget(
                              text: 'Line 2:',
                              controller: line2Ctl,
                            ),
                      const SizedBox(height: 32),
                      isTryMagic
                          ? DropdownBtnWidget(
                              text: 'line 3:',
                              onSaved: (value) {
                                lineValue3 = value.toString();
                              },
                              list: data,
                            )
                          : TextFieldWidget(
                              text: 'Line 3:',
                              controller: line3Ctl,
                            ),
                      const SizedBox(height: 32),
                      const TextWidget(
                        text: 'background:',
                        textStyle: TextStyle(
                          fontFamily: 'Inter',
                          fontSize: 14,
                          color: AppColors.textBlue,
                          fontWeight: FontWeight.w700,
                          height: 16.94 / 14,
                          textBaseline: TextBaseline.alphabetic,
                        ),
                      ),
                      const SizedBox(height: 6),
                      SizedBox(
                        height: 50,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: images.length + 1,
                          itemBuilder: (context, index) {
                            if (index == images.length) {
                              return GestureDetector(
                                onTap: _pickImage,
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: const Color(0xffB9B9B9),
                                    ),
                                  ),
                                  width: 50,
                                  height: 50,
                                  child: const Center(
                                    child: Icon(
                                      Icons.add,
                                      color: Color(0xffB9B9B9),
                                      size: 32,
                                    ),
                                  ),
                                ),
                              );
                            }
                            return GestureDetector(
                              onTap: () {
                                context
                                    .read<HaikuCubit>()
                                    .saveImage(images[index]);
                                context
                                    .read<HaikuCubit>()
                                    .saveImageCount(index);
                              },
                              child: Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    width: 1.5,
                                    color: context
                                                .watch<HaikuCubit>()
                                                .state
                                                .selectedImageIndex ==
                                            index
                                        ? Colors.black
                                        : Colors.transparent,
                                  ),
                                ),
                                margin: const EdgeInsets.only(right: 8),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: Image.memory(
                                    images[index],
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 54),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            if (widget.isChange)
                              GestureDetector(
                                onTap: () {
                                  context
                                      .read<HaikuCubit>()
                                      .deleteHaiku(widget.haikuCreateModel!);
                                  setState(() {
                                    titleCtl.clear();
                                    line1Ctl.clear();
                                    line2Ctl.clear();
                                    line3Ctl.clear();
                                    context
                                        .read<HaikuCubit>()
                                        .saveImageCount(null);
                                    Navigator.pop(context);
                                  });
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(right: 48),
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(color: Colors.red),
                                    ),
                                  ),
                                  child: const Text(
                                    'Delete',
                                    style: TextStyle(
                                      fontFamily: 'Inter',
                                      fontSize: 14,
                                      color: Colors.red,
                                      fontWeight: FontWeight.w400,
                                      height: 16.94 / 14,
                                      textBaseline: TextBaseline.alphabetic,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ),
                            BlocBuilder<HaikuCubit, HaikuState>(
                              builder: (context, state) {
                                return GestureDetector(
                                  onTap: () {
                                    if (isTryMagic) {
                                      if (titleCtl.text.isNotEmpty &&
                                          lineValue1 != null &&
                                          lineValue2 != null &&
                                          lineValue3 != null &&
                                          state.image != null) {
                                        final newHaiku = HaikuCreateModel(
                                          title: titleCtl.text,
                                          line1: lineValue1 ?? '',
                                          line2: lineValue2 ?? '',
                                          line3: lineValue3 ?? '',
                                          image: state.image!,
                                          date: DateFormat('dd MMMM, yyyy')
                                              .format(DateTime.now()),
                                          image2: null,
                                          countImage:
                                              state.selectedImageIndex ?? 0,
                                        );
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => PublishPage(
                                              oldHaiku: widget.haikuCreateModel,
                                              newHaiku: newHaiku,
                                              isChange: widget.isChange,
                                            ),
                                          ),
                                        );
                                      }
                                    } else {
                                      if (titleCtl.text.isNotEmpty &&
                                          line1Ctl.text.isNotEmpty &&
                                          line2Ctl.text.isNotEmpty &&
                                          line3Ctl.text.isNotEmpty &&
                                          state.image != null) {
                                        final newHaiku = HaikuCreateModel(
                                          title: titleCtl.text,
                                          line1: line1Ctl.text,
                                          line2: line2Ctl.text,
                                          line3: line3Ctl.text,
                                          image: state.image!,
                                          date: DateFormat('dd MMMM, yyyy')
                                              .format(DateTime.now()),
                                          image2: null,
                                          countImage:
                                              state.selectedImageIndex ?? 0,
                                        );
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => PublishPage(
                                              oldHaiku: widget.haikuCreateModel,
                                              newHaiku: newHaiku,
                                              isChange: widget.isChange,
                                            ),
                                          ),
                                        );
                                      }
                                    }
                                  },
                                  child: Container(
                                    decoration: const BoxDecoration(
                                      border: Border(bottom: BorderSide()),
                                    ),
                                    child: const Text(
                                      'Publish',
                                      style: TextStyle(
                                        fontFamily: 'Inter',
                                        fontSize: 14,
                                        color: AppColors.textBlue,
                                        fontWeight: FontWeight.w400,
                                        height: 16.94 / 14,
                                        textBaseline: TextBaseline.alphabetic,
                                      ),
                                      textAlign: TextAlign.left,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
