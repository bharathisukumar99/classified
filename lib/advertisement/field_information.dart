import 'package:classified/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../constant_widgets.dart';
import 'bloc/post_bloc.dart';

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
  Seller current = Seller.agent;
  SaleType currentSale = SaleType.resident;

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
        body: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.all(20),
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
                      ),
                      gap,
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7)),
                          labelText: 'Phone Number',
                          isDense: true,
                        ),
                      ),
                      gap,
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7)),
                          labelText: 'Price',
                          isDense: true,
                        ),
                      ),
                      gap,
                      TextFormField(
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7)),
                            isDense: true,
                            labelText: 'Description',
                            alignLabelWithHint: true),
                        maxLines: 10,
                      ),
                      gap,
                      TextFormField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7)),
                          labelText: 'Size',
                          isDense: true,
                        ),
                      ),
                      gap,
                      TextFormField(
                        controller: TextEditingController()..text= current.name.toUpperCase(),
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
                                builder:  (context, setState)  {
                                  return AlertDialog(
                                    content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      RadioListTile<Seller>(
                                        controlAffinity: ListTileControlAffinity.trailing,
                                          title: const Text('Agent',textScaleFactor: 1.5,style: TextStyle(fontWeight: FontWeight.w600),),
                                          value: Seller.agent,
                                          groupValue: current,
                                          onChanged: (val) {
                                             context.read<PostBloc>().add(SellerSelectionEvent(seller: val!));
                                             setState((){
                                              current = val;
                                             });
                                             Navigator.pop(context);
                                          }),
                                      RadioListTile<Seller>(
                                        controlAffinity: ListTileControlAffinity.trailing,
                                          title: const Text('LandLord',textScaleFactor: 1.5,style: TextStyle(fontWeight: FontWeight.w600),),
                                          value: Seller.landlord,
                                          groupValue: current,
                                          onChanged: (val) {
                                             context.read<PostBloc>().add(SellerSelectionEvent(seller: val!));
                                              setState((){
                                              current = val;
                                             });
                                             Navigator.pop(context);
                                          }),
                                      RadioListTile<Seller>(
                                        controlAffinity: ListTileControlAffinity.trailing,
                                          title: const Text('Developer',textScaleFactor: 1.5,style: TextStyle(fontWeight: FontWeight.w600),),
                                          value: Seller.developer,
                                         groupValue: current,
                                          onChanged: (val) {
                                             context.read<PostBloc>().add(SellerSelectionEvent(seller: val!));
                                              setState((){
                                              current = val;
                                             });
                                             Navigator.pop(context);
                                          }),
                                    ],
                                      ),
                                  );
                                }
                              );
                            },
                          );
                        },
                      ),
                      gap,
                      TextFormField(
                        controller: TextEditingController()..text= currentSale.name.toUpperCase(),
                        readOnly: true,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7)),
                          labelText: 'Sale for',
                          isDense: true,
                          
                        ),
                        onTap: () async{
                          await showDialog<void>(
                            context: context,
                            barrierDismissible: true,
                            builder: (BuildContext context) {
                              return StatefulBuilder(
                                builder:  (context, setStates)  {
                                  return AlertDialog(
                                    content: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      RadioListTile<SaleType>(
                                        controlAffinity: ListTileControlAffinity.trailing,
                                          title: const Text('Resident',textScaleFactor: 1.5,style: TextStyle(fontWeight: FontWeight.w600),),
                                          value: SaleType.resident,
                                          groupValue: currentSale,
                                          onChanged: ( val) {
                                             context.read<PostBloc>().add(SellerTypeSelectionEvent(seller: val!));
                                             setStates((){
                                              currentSale = val;
                                             });
                                             Navigator.pop(context);
                                          }),
                                      RadioListTile<SaleType>(
                                        controlAffinity: ListTileControlAffinity.trailing,
                                          title: const Text('Commercial',textScaleFactor: 1.5,style: TextStyle(fontWeight: FontWeight.w600),),
                                          value: SaleType.commercial,
                                          groupValue: currentSale,
                                          onChanged: (val) {
                                             context.read<PostBloc>().add(SellerTypeSelectionEvent(seller: val!));
                                               setStates((){
                                              currentSale = val;
                                             });
                                             Navigator.pop(context);
                                          }),
                                     
                                    ],
                                      ),
                                  );
                                }
                              );
                            },
                          );
                        },
                      ),
                      gap,
                      gap,
                      FilledButton(
                          onPressed: () {},
                          style: FilledButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(7))),
                          child: const Text('POST AN AD'))
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
