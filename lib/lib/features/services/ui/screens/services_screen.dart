import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/config/app_palette.dart';
import '../../../../core/di/dependency_injection.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/networking/api_constants.dart';
import '../../../../core/widgets/loading.dart';
import '../bloc/service_cubit.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ServicesCubit>()..getTrainers(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: BlocBuilder<ServicesCubit, ServicesState>(
            builder: (context, state) {
              if (state is ServiceSuccess) {
                final services = state.services;
                return ListView.builder(
                  itemCount: services.length,
                  itemBuilder: (context, index) => SizedBox(
                    height: 0.25.sh,
                    width: double.infinity,
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomRight,
                          child: Container(
                            padding: EdgeInsetsDirectional.only(
                              start: .52.sw,
                              end: 10.w,
                              top: 10.h,
                              bottom: 10.h,
                            ),
                            decoration: const BoxDecoration(
                              color: AppPalette.whiteColor,
                              borderRadius: BorderRadiusDirectional.all(
                                  Radius.circular(25)),
                            ),
                            width: double.infinity,
                            height: 0.16.sh,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  constraints: BoxConstraints(maxWidth: 0.4.sw),
                                  child: Text(
                                    services[index].name,
                                    style:
                                        Theme.of(context).textTheme.titleLarge,
                                  ),
                                ),
                                verticalSpacing(10),
                                Text(
                                  "\$${services[index].price}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge!
                                      .copyWith(
                                        fontWeight: FontWeight.w700,
                                      ),
                                ),
                                verticalSpacing(10),
                                Row(
                                  children: [
                                    const Icon(Icons.star,
                                        color: Colors.orange),
                                    horizontalSpacing(5),
                                    Text(
                                      services[index].stars.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                            fontWeight: FontWeight.w700,
                                          ),
                                    ),
                                    const Spacer(),
                                    const _AddToCartButton(),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            decoration: const BoxDecoration(
                              color: AppPalette.whiteColor,
                              borderRadius: BorderRadiusDirectional.only(
                                topEnd: Radius.circular(25),
                                bottomEnd: Radius.circular(25),
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: AppPalette.primaryLight,
                                  spreadRadius: 1,
                                  blurRadius: 2,
                                  offset: Offset(0, -1),
                                ),
                              ],
                            ),
                            child: Image.network(
                              '${ApiConstants.baseUrl}${services[index].image}',
                              errorBuilder: (context, error, stackTrace) {
                                return Icon(
                                  Icons.error,
                                  size: 0.5.sw,
                                  color: AppPalette.primaryLight,
                                );
                              },
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              } else if (state is ServicesError) {
                return Center(
                  child: Text(
                    state.message,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                );
              } else {
                return const Loading();
              }
            },
          ),
        ),
      ),
    );
  }
}

class _AddToCartButton extends StatelessWidget {
  const _AddToCartButton();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: CircleAvatar(
        radius: 15.r,
        backgroundColor: AppPalette.primaryLight,
        child: const Icon(
          Icons.add,
          color: AppPalette.whiteColor,
        ),
      ),
    );
  }
}
