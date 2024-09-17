import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:imtihon6/bloc/xarajat/xarajat_bloc.dart';
import 'package:imtihon6/ui/widgets/container_widget.dart';
import 'package:imtihon6/ui/widgets/navigationbar_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Overview"),
        actions: const [
          CircleAvatar(
            child: Icon(Icons.person),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: [
          BlocBuilder<XarajatBloc, XarajatState>(
            builder: (context, state) {
              if (state is LoadingStateXarajat) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is ErrorStateXarajat) {
                return Center(
                  child: Text(state.message),
                );
              }

              if (state is LoadedStateXarajat) {
                return Column(
                  children: [
                    Container(
                      height: 250,
                      width: double.infinity,
                      color: Colors.grey[300],
                      child: const Column(
                        children: [
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                vertical: 20,
                                horizontal: 20,
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ContainerWidget(
                                    icon: Icon(Icons.wallet),
                                    title: "Total Salary",
                                    price: 10,
                                  ),
                                  SizedBox(width: 10),
                                  ContainerWidget(
                                    icon: Icon(Icons.wallet),
                                    title: "Total Salary",
                                    price: 10,
                                  ),
                                  SizedBox(width: 10),
                                  ContainerWidget(
                                    icon: Icon(Icons.wallet),
                                    title: "Total Salary",
                                    price: 10,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ListView.builder(
                      itemCount: state.xarajat.length,
                      itemBuilder: (context, index) {
                        final xarajat = state.xarajat[index];
                        return ListTile(
                          onLongPress: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  content: Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          context.read().add(
                                                XarajatDeleteEvent(xarajat.id!),
                                              );
                                        },
                                        icon: const Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          context.read<XarajatBloc>().add(
                                                XarajatEditEvent(xarajat),
                                              );
                                        },
                                        icon: const Icon(
                                          Icons.edit,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                          title: Text(xarajat.description),
                          subtitle: Text(xarajat.time.toString()),
                          trailing: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(xarajat.summa.toString()),
                              Text(xarajat.category),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                );
              }
              return Column(
                children: [
                  Container(
                    height: 250,
                    width: double.infinity,
                    color: Colors.grey[300],
                    child: const Column(
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                              vertical: 20,
                              horizontal: 20,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ContainerWidget(
                                  icon: Icon(Icons.wallet),
                                  title: "Total Salary",
                                  price: 10,
                                ),
                                SizedBox(width: 10),
                                ContainerWidget(
                                  icon: Icon(Icons.wallet),
                                  title: "Total Salary",
                                  price: 10,
                                ),
                                SizedBox(width: 10),
                                ContainerWidget(
                                  icon: Icon(Icons.wallet),
                                  title: "Total Salary",
                                  price: 10,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  ListView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      // final xarajat = state.xarajat[index];
                      return ListTile(
                        onLongPress: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        // context.read().add(
                                        //       XarajatDeleteEvent(xarajat.id!),
                                        //     );
                                      },
                                      icon: const Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      ),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        // context.read<XarajatBloc>().add(
                                        //       XarajatEditEvent(xarajat),
                                        //     );
                                      },
                                      icon: const Icon(
                                        Icons.edit,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                        // title: Text(xarajat.description),
                        // subtitle: Text(xarajat.time.toString()),
                        trailing: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Text(xarajat.summa.toString()),
                            // Text(xarajat.category),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: const NavigationbarWidget(),
    );
  }
}
