import 'package:classified/advertisement/bloc/post_bloc.dart';
import 'package:classified/enums.dart';
import 'package:classified/home.dart';
import 'package:classified/home/models/items.dart';
import 'package:classified/login/bloc/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constant_widgets.dart';
import '../custom_widgets/custom_loader.dart';
import 'bloc/home_bloc.dart';
import 'bottom_navigation.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  void initState() {
    context.read<HomeBloc>().add(FetchPost());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state.responseCode == 403) {
          Navigator.popUntil(context, ModalRoute.withName('/'));
        }
        
      },
      child: Scaffold(
        appBar: AppBar(
          title: SvgPicture.asset(
            'assets/images/logo.svg',
            height: 50,
          ),
          centerTitle: true,
        ),
        body: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state.code == 1) {
              Navigator.pushAndRemoveUntil(context,MaterialPageRoute(builder: (context)=>Home()),ModalRoute.withName('/'));
            }
          },
          builder: (context, state) {
            return Stack(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      GridView.builder(
                        padding: const EdgeInsets.only(bottom: 20),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        shrinkWrap: true,
                        itemCount: items.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.all(4),
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(7),
                                color: Theme.of(context)
                                    .colorScheme
                                    .primaryContainer),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/images/${items[index].assets}.svg',
                                  height: height(context) / 12,
                                ),
                                Flexible(
                                  child: Text(
                                    items[index].name,
                                    maxLines: 1,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                      Visibility(
                        visible: state.posts.isNotEmpty,
                        child: Text(
                          'Resident in Sale',
                          textScaleFactor: 2,
                          style: TextStyle(
                              color: onPrimaryContainer(context),
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 4.3,
                        alignment: Alignment.topLeft,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: state.posts.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Stack(
                              children: [
                                SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2.2,
                                    child: Card(
                                      color: primary(context),
                                      margin: EdgeInsets.all(8),
                                      child: SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              4.3),
                                    )),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height / 4.4,
                                  width:
                                      MediaQuery.of(context).size.width / 2.2,
                                  child: Card(
                                    margin: EdgeInsets.all(8),
                                    child: Column(
                                      children: [
                                        AspectRatio(
                                          aspectRatio: 16 / 9,
                                          child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.vertical(
                                                      top: Radius.circular(20)),
                                              child: FadeInImage.assetNetwork(
                                                  placeholder:
                                                      'assets/images/placeholder.png',
                                                  image: state
                                                      .posts[index].images[0],
                                                  fit: BoxFit.fill)),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 4.0, horizontal: 8),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'AED ${state.posts[index].price.toString()}',
                                                textScaleFactor: 1.2,
                                                style: TextStyle(
                                                    fontFamily: 'Opensans',
                                                    color: primary(context),
                                                    fontWeight:
                                                        FontWeight.w900),
                                              ),
                                              Text(
                                                state.posts[index].title,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w500),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                              Text(
                                                state.posts[index].location,
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.grey),
                                                maxLines: 1,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
                Visibility(
                    visible: state.status == FetchStatus.initial,
                    child: CustomLoader()),
              ],
            );
          },
        ),
        floatingActionButton: FloatingActionButton.small(
          onPressed: () {
            Navigator.pushNamed(context, '/post');
          },
          backgroundColor: Theme.of(context).colorScheme.tertiary,
          foregroundColor: Theme.of(context).colorScheme.onTertiary,
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.miniCenterDocked,
        bottomNavigationBar: const BottomNavigationBarItems(),
      ),
    );
  }
}
