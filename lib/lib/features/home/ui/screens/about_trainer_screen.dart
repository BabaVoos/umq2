import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/config/app_palette.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/helpers/spacing.dart';
import '../../models/get_trainers_response_model.dart';

class AboutTrainerScreen extends StatelessWidget {
  const AboutTrainerScreen({super.key, required this.trainer});

  final Trainer trainer;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Align(
              alignment: Alignment(-1.5.w, -1.1.h),
              child: Container(
                width: 250.r,
                height: 250.r,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppPalette.textLightBlue,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  width: 205.r,
                  height: 205.r,
                  margin: EdgeInsetsDirectional.only(top: 50.h, start: 20.w),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image.network(
                    trainer.profile!.image!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) => DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                      ),
                      child: const Icon(
                        Icons.error,
                        color: AppPalette.primaryLight,
                        size: 50,
                      ),
                    ),
                  ),
                ),
                verticalSpacing(10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    verticalSpacing(20.w),
                    Column(
                      children: [
                        Text(
                          trainer.profile!.name!,
                          style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                                color: AppPalette.textLightBlue,
                              ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              size: 25.r,
                              color: AppPalette.startColor,
                            ),
                            Icon(
                              Icons.star,
                              size: 25.r,
                              color: AppPalette.startColor,
                            ),
                            Icon(
                              Icons.star,
                              size: 25.r,
                              color: AppPalette.startColor,
                            ),
                            Icon(
                              Icons.star,
                              size: 25.r,
                              color: AppPalette.startColor,
                            ),
                            Icon(
                              Icons.star,
                              size: 25.r,
                              color: AppPalette.startColor,
                            ),
                            Text(
                              '(10)',
                              style: Theme.of(context).textTheme.titleSmall,
                            )
                          ],
                        ),
                        verticalSpacing(10),
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 23.r,
                              backgroundColor: AppPalette.whiteColor,
                              child: const Icon(
                                Icons.email_outlined,
                                color: AppPalette.primaryLight,
                              ),
                            ),
                            horizontalSpacing(5),
                            CircleAvatar(
                              radius: 23.r,
                              backgroundColor: AppPalette.whiteColor,
                              child: const Icon(
                                Icons.wifi_calling_3,
                                color: AppPalette.primaryLight,
                              ),
                            ),
                            horizontalSpacing(5),
                            CircleAvatar(
                              radius: 23.r,
                              backgroundColor: AppPalette.whiteColor,
                              child: const Icon(
                                Icons.location_on_outlined,
                                color: AppPalette.primaryLight,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      width: context.screenSize.width * 0.35,
                      height: 55,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppPalette.primaryLight,
                          shape: const StadiumBorder(),
                        ),
                        onPressed: () {},
                        child: Text(
                          'Follow',
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                color: AppPalette.textWhite,
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
                ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  separatorBuilder: (context, index) => verticalSpacing(20),
                  itemBuilder: (context, index) => ListTile(
                    tileColor: AppPalette.whiteColor,
                    leading: Container(
                      width: 50.r,
                      height: 50.r,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fHBlb3BsZXxlbnwwfHwwfHx8MA%3D%3D',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Row(
                      children: [
                        Text(
                          '@mariammekhail',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        horizontalSpacing(20),
                        Text(
                          '1 month',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(color: AppPalette.textPrimaryLight),
                        ),
                      ],
                    ),
                    subtitle: Text(
                      'very unique and smart ..',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                  ),
                )
              ],
            ),
            Positioned(
              top: 40.h,
              left: 10.w,
              child: IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 30.r,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
