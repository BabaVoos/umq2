import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../models/get_trainers_response_model.dart';
import '../../../../core/config/app_palette.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes.dart';

class TrainerItem extends StatelessWidget {
  const TrainerItem({
    super.key,
    required this.trainer,
  });

  final Trainer trainer;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(
          Routes.aboutTrainerScreen,
          arguments: trainer, // Pass trainer details if needed
        );
      },
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        height: 200.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: trainer.profile?.image != null
                  ? Image.network(
                      trainer.profile!.image!,
                      fit: BoxFit.fill,
                      errorBuilder: (context, error, stackTrace) =>
                          DecoratedBox(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                        ),
                        child: const Icon(
                          Icons.error,
                          color: AppPalette.primaryLight,
                          size: 50,
                        ),
                      ),
                    )
                  : Container(
                      color: Colors.grey[300],
                      child: const Icon(
                        Icons.error,
                        color: AppPalette.primaryLight,
                        size: 50,
                      ),
                    ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: Padding(
                    padding: EdgeInsets.all(8.0.r),
                    child: const CircleAvatar(
                      backgroundColor: AppPalette.whiteColor,
                      child: Icon(
                        Icons.favorite_border,
                        color: AppPalette.primaryLight,
                      ),
                    ),
                  ),
                ),
                Container(
                  color: AppPalette.whiteColor,
                  height: 65.h,
                  child: ListTile(
                    title: Text(
                      trainer.profile?.name ?? "Unknown Trainer",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(color: AppPalette.primary),
                    ),
                    subtitle: Text(
                      trainer.profile?.phone ?? "******",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    leading: Container(
                      width: 50.w,
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.network(
                        trainer.profile?.image ??
                            'https://via.placeholder.com/150', // Placeholder
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.person, size: 30),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
