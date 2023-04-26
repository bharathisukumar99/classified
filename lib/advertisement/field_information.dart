import 'package:classified/advertisement/models/post_model.dart';
import 'package:classified/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constant_widgets.dart';
import '../custom_widgets/custom_loader.dart';
import 'bloc/post_bloc.dart';
import 'success_post.dart';

const gap = SizedBox(
  height: 15,
);

class FieldInformation extends StatefulWidget {
  const FieldInformation({super.key});

  @override
  State<FieldInformation> createState() => _FieldInformationState();
}

class _FieldInformationState extends State<FieldInformation> {
  final _formKey = GlobalKey<FormState>();
  Seller current = Seller.landlord;
  SaleType currentSale = SaleType.resident;
  late String title, phone, price, description, size, seller, property;
  @override
  Widget build(BuildContext context) {
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
        body: BlocConsumer<PostBloc, PostState>(
          listener: (context, state) {
            if (state.status == FetchStatus.success) {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) => const SuccessPost()),
                  ModalRoute.withName('/home'));
            }
          },
          builder: (context, state) {
            return Stack(
              children: [
                SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.all(20),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextFormField(
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                decoration: TextDecoration.none,
                                letterSpacing: 1.2,
                                fontSize: 20,
                              ),
                              maxLines: null,
                              keyboardType: TextInputType.multiline,
                              initialValue: state.title,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7)),
                                labelText: 'Title',
                                isDense: true,
                              ),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Title is required';
                                }
                                return null;
                              },
                              onSaved: (newValue) {
                                setState(() {
                                  title = newValue!;
                                });
                              }),
                          gap,
                          TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7)),
                                labelText: 'Phone Number',
                                isDense: true,
                              ),
                              style: TextStyle(fontFamily: 'Opensans'),
                             
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Phone Number is required';
                                }else if(!RegExp(r'^(05|5|5[0-5])[0-9]{7}$').hasMatch(value)){
                                  return 'Enter a Valid Number';
                                }
                                return null;
                              },
                              onSaved: (newValue) {
                                setState(() {
                                  phone = newValue!;
                                });
                              }),
                          gap,
                          TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7)),
                                labelText: 'Price',
                                isDense: true,
                              ),
                              style: TextStyle(fontFamily: 'Opensans'),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Price is required';
                                }else if(!RegExp(r'^-?[0-9]+$').hasMatch(value)){
                                  return 'Enter a Valid Price';
                                }
                                return null;
                              },
                              onSaved: (newValue) {
                                setState(() {
                                  price = newValue!;
                                });
                              }),
                          gap,
                          TextFormField(
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(7)),
                                  isDense: true,
                                  labelText: 'Description',
                                  alignLabelWithHint: true),
                              maxLines: 10,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Description is required';
                                }
                                return null;
                              },
                              onSaved: (newValue) {
                                setState(() {
                                  description = newValue!;
                                });
                              }),
                          gap,
                          TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7)),
                                labelText: 'Size',
                                isDense: true,
                              ),
                              style: TextStyle(fontFamily: 'Opensans'),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Size is required';
                                }else if(!RegExp(r'^-?[0-9]+$').hasMatch(value)){
                                  return 'Enter a Valid Size';
                                }
                                return null;
                              },
                              onSaved: (newValue) {
                                setState(() {
                                  size = newValue!;
                                });
                              }),
                          gap,
                          TextFormField(
                              controller: TextEditingController()
                                ..text = current.name.toUpperCase(),
                              readOnly: true,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(7)),
                                labelText: 'About you',
                                isDense: true,
                              ),
                              onTap: () async {
                                await showDialog<void>(
                                  context: context,
                                  barrierDismissible: true,
                                  builder: (BuildContext context) {
                                    return StatefulBuilder(
                                        builder: (context, setState) {
                                      return AlertDialog(
                                        content: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: <Widget>[
                                            RadioListTile<Seller>(
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .trailing,
                                                title: const Text(
                                                  'Agent',
                                                  textScaleFactor: 1.5,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                value: Seller.agent,
                                                groupValue: current,
                                                onChanged: (val) {
                                                  context.read<PostBloc>().add(
                                                      SellerSelectionEvent(
                                                          seller: val!));
                                                  setState(() {
                                                    current = val;
                                                  });
                                                  Navigator.pop(context);
                                                }),
                                            RadioListTile<Seller>(
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .trailing,
                                                title: const Text(
                                                  'LandLord',
                                                  textScaleFactor: 1.5,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                value: Seller.landlord,
                                                groupValue: current,
                                                onChanged: (val) {
                                                  context.read<PostBloc>().add(
                                                      SellerSelectionEvent(
                                                          seller: val!));
                                                  setState(() {
                                                    current = val;
                                                  });
                                                  Navigator.pop(context);
                                                }),
                                            RadioListTile<Seller>(
                                                controlAffinity:
                                                    ListTileControlAffinity
                                                        .trailing,
                                                title: const Text(
                                                  'Developer',
                                                  textScaleFactor: 1.5,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                                value: Seller.developer,
                                                groupValue: current,
                                                onChanged: (val) {
                                                  context.read<PostBloc>().add(
                                                      SellerSelectionEvent(
                                                          seller: val!));
                                                  setState(() {
                                                    current = val;
                                                  });
                                                  Navigator.pop(context);
                                                }),
                                          ],
                                        ),
                                      );
                                    });
                                  },
                                );
                              },
                              onSaved: (newValue) {
                                setState(() {
                                  seller = newValue!;
                                });
                              }),
                          gap,
                          TextFormField(
                            controller: TextEditingController()
                              ..text = currentSale.name.toUpperCase(),
                            readOnly: true,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(7)),
                              labelText: 'Property Type',
                              isDense: true,
                            ),
                            onSaved: (newValue) {
                              setState(() {
                                property = newValue!;
                              });
                            },
                            onTap: () async {
                              await showDialog<void>(
                                context: context,
                                barrierDismissible: true,
                                builder: (BuildContext context) {
                                  return StatefulBuilder(
                                      builder: (context, setStates) {
                                    return AlertDialog(
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: <Widget>[
                                          RadioListTile<SaleType>(
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .trailing,
                                              title: const Text(
                                                'Resident',
                                                textScaleFactor: 1.5,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              value: SaleType.resident,
                                              groupValue: currentSale,
                                              onChanged: (val) {
                                                context.read<PostBloc>().add(
                                                    SellerTypeSelectionEvent(
                                                        seller: val!));
                                                setStates(() {
                                                  currentSale = val;
                                                });
                                                Navigator.pop(context);
                                              }),
                                          RadioListTile<SaleType>(
                                              controlAffinity:
                                                  ListTileControlAffinity
                                                      .trailing,
                                              title: const Text(
                                                'Commercial',
                                                textScaleFactor: 1.5,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              value: SaleType.commercial,
                                              groupValue: currentSale,
                                              onChanged: (val) {
                                                context.read<PostBloc>().add(
                                                    SellerTypeSelectionEvent(
                                                        seller: val!));
                                                setStates(() {
                                                  currentSale = val;
                                                });
                                                Navigator.pop(context);
                                              }),
                                        ],
                                      ),
                                    );
                                  });
                                },
                              );
                            },
                          ),
                          gap,
                          gap,
                          FilledButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();
                                  context.read<PostBloc>().add(PostData(
                                      postModel: PostModel(
                                          type: state.type,
                                          location: state.location,
                                          title: title,
                                          imageUrls: List.generate(
                                              state.imageList.length,
                                              (index) =>
                                                  state.imageList[index].path),
                                          phoneNumber: int.parse(phone),
                                          price: int.parse(phone),
                                          description: description,
                                          size: int.parse(size),
                                          seller: seller,
                                          propertyType: property)));
                                }
                              },
                              style: FilledButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(7))),
                              child: const Text('POST AN AD'))
                        ],
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: state.status == FetchStatus.initial,
                  child: const CustomLoader(),
                ),
              ],
            );
          },
        ));
  }
}
