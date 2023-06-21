import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widget/gender.dart';
import 'block/app_cubit.dart';


class BlockExample extends StatelessWidget {

  BlockExample({super.key});

  @override
  Widget build(BuildContext context) {
    AppCubit appCubit = AppCubit.get(context);
    return BlocBuilder<AppCubit, AppState>(builder: (context,state){
      return  Scaffold(
          body:  Column(
            children: [
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  appCubit.selectMale();
                                },
                                child:
                                SizedBox(
                                  width: 200,
                                  height: 200,
                                  child:   Gender(
                                    sex: 'MALE',
                                    sexImage: 'assets/images/male.png',
                                    isMaleSelected: appCubit.isMaleSelected,
                                  ),
                                ),

                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  appCubit.selectFemale();
                                },
                                child:
                                SizedBox(
                                  width: 200,
                                  height: 200,
                                  child:   Gender(
                                    sex: 'FEMALE',
                                    sexImage: 'assets/images/male.png',
                                    isMaleSelected: appCubit.isMaleSelected,
                                  ),
                                ),

                              ),
                            ),
                          ],
                        ), Padding(padding: const EdgeInsets.all(10),child:  Text(appCubit.isMaleSelected.toString(),style: const TextStyle(color: Colors.black,fontSize: 25),),),
                        ElevatedButton(onPressed: () {
                          appCubit.increaseCount();
                        }, child: const Text("Increase")),
                        ElevatedButton(onPressed: (){
                          appCubit.descreaseCount();
                        }, child: const Text("Decrease")),
                        Text(appCubit.count.toString()),
                      ],
                    )

                  )),
            ],
          )
      );
    });

  }
}