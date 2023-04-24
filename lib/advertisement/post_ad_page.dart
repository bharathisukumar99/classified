import 'dart:io';

import 'package:classified/constant_widgets.dart';
import 'package:classified/custom_widgets/custom_stepper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../home/models/items.dart';
import 'bloc/post_bloc.dart';

class PostAdPage extends StatefulWidget {
  const PostAdPage({super.key});

  @override
  State<PostAdPage> createState() => _PostAdPageState();
}

class _PostAdPageState extends State<PostAdPage> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new,
                  size: 32, color: primary(context)),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'POST AN AD',
                style: TextStyle(
                  color: primary(context),
                ),
              ),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.all(10),
              child: Stepper(
                physics: const ClampingScrollPhysics(),
                type: StepperType.vertical,
                currentStep: _index,
                onStepTapped: (int index) {
                  setState(() {
                    _index = index;
                  });
                },
                controlsBuilder: (context, details) {
                  return SizedBox.shrink();
                },
                steps: <Step>[
                  Step(
                    state: state.location.isEmpty
                        ? StepState.editing
                        : StepState.complete,
                    title: const Text(
                      'Location',
                      style: TextStyle(fontWeight: FontWeight.w600),
                      textScaleFactor: 1.2,
                    ),
                    content: Container(
                        alignment: Alignment.centerLeft,
                        child: DropdownButtonFormField(
                          value: state.location.isEmpty ? null : state.location,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              isDense: true,
                              hintText: 'Choose your Location'),
                          onSaved: (val) {},
                          items: List.generate(
                              5,
                              (index) => DropdownMenuItem(
                                    value: 'dubai $index',
                                    child: Text('Dubai $index'),
                                  )),
                          onChanged: (value) {
                            context
                                .read<PostBloc>()
                                .add(SelectLocationEvent(location: value!));
                            setState(() {
                              _index = 1;
                            });
                          },
                        )),
                  ),
                  Step(
                    state: state.type.isNotEmpty
                        ? StepState.complete
                        : state.location.isNotEmpty
                            ? StepState.editing
                            : StepState.disabled,
                    title: const Text(
                      'Type',
                      style: TextStyle(fontWeight: FontWeight.w600),
                      textScaleFactor: 1.2,
                    ),
                    content: Container(
                        alignment: Alignment.centerLeft,
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                          ),
                          shrinkWrap: true,
                          itemCount: items.length - 1,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.all(4),
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: Theme.of(context)
                                      .colorScheme
                                      .primaryContainer),
                              child: InkWell(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/images/${items[index].assets}.svg',
                                      height: height(context) / 25,
                                    ),
                                    Text(
                                      items[index].name,
                                      maxLines: 1,
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    )
                                  ],
                                ),
                                onTap: () {
                                  context.read<PostBloc>().add(
                                        SelectTypeEvent(
                                            type: items[index].assets),
                                      );
                                  setState(() {
                                    _index = 2;
                                  });
                                },
                              ),
                            );
                          },
                        )),
                  ),
                  Step(
                    state: state.title.trim().length > 10
                        ? StepState.complete
                        : state.type.isNotEmpty
                            ? StepState.editing
                            : StepState.disabled,
                    title: const Text(
                      'Title',
                      style: TextStyle(fontWeight: FontWeight.w600),
                      textScaleFactor: 1.2,
                    ),
                    content: Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          TextField(
                            maxLines: 2,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.grey.shade100)),
                              isDense: true,
                              contentPadding: EdgeInsets.all(10),
                              hintText: 'Enter Title',
                            ),
                            onChanged: (val) {
                              context
                                  .read<PostBloc>()
                                  .add(TitleEvent(title: val));
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Step(
                    state: state.imageList.length >= 3
                        ? StepState.complete
                        : state.title.trim().length > 10
                            ? StepState.editing
                            : StepState.disabled,
                    title: const Text(
                      'Upload Images',
                      style: TextStyle(fontWeight: FontWeight.w600),
                      textScaleFactor: 1.2,
                    ),
                    content: Container(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Please upload atleast three Images'),
                          Row(
                            children: [
                              FloatingActionButton(
                                heroTag: null,
                                onPressed: () {
                                  context
                                      .read<PostBloc>()
                                      .add(UploadImageEvent(type: 'P'));
                                },
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7)),
                                child: Icon(
                                  Icons.add_a_photo,
                                  color: primary(context),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              FloatingActionButton(
                                heroTag: null,
                                onPressed: () {
                                  context
                                      .read<PostBloc>()
                                      .add(UploadImageEvent(type: 'M'));
                                },
                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(7)),
                                child: Icon(
                                  Icons.image,
                                  color: primary(context),
                                ),
                              ),
                            ],
                          ),
                          GridView.builder(
                            physics:const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2),
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.all(4),
                                child: Image.file(
                                  File(state.imageList[index].path),
                                ),
                              );
                            },
                            itemCount: state.imageList.length,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Visibility(
              visible: state.location.isNotEmpty &&
                  state.type.isNotEmpty &&
                  state.title.length >= 10 &&
                  state.imageList.length >= 3,
              child: InkWell(
                child: Container(
                    padding: EdgeInsets.all(20),
                    color: primary(context),
                    child: const Text(
                      'Next',
                      textAlign: TextAlign.center,
                      textScaleFactor: 2,
                      style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600,letterSpacing: 1.5),
                    )),
                onTap: () {},
              )),
        );
      },
    );
  }
}
