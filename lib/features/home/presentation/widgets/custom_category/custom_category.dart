import 'package:duaya_app/utils/constants/colors.dart';
import 'package:duaya_app/utils/helpers/navigation_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../routing/routes_name.dart';
import '../../../../../utils/constants/image_strings.dart';
import 'package:duaya_app/utils/connection/checkImageNetwork.dart';

import '../../../../category/presentation/category/presentation/controller/categories_by_page_cubit.dart';

class CustomCategoryInHome extends StatelessWidget {
  final String categoryImage, categoryName, categoryID;

  const CustomCategoryInHome(
      {Key? key,
      required this.categoryImage,
      required this.categoryName,
      required this.categoryID})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    CategoriesByPageCubit certainCataController =
        context.read<CategoriesByPageCubit>();
    return FutureBuilder(
        future:
            checkImageNetwork.checkImageStatus(NetworkImageURL: categoryImage),
        builder: (context, snapshot) {
          Widget imageWidget;
          if (snapshot.connectionState == ConnectionState.waiting) {
            imageWidget = Center(
              child: Lottie.asset(AssetRes.circleLoading),
            );
          } else if (snapshot.hasError || !snapshot.data!) {
            imageWidget = Lottie.asset(AssetRes.emptyProduct2);
          } else {
            imageWidget = Image.network(categoryImage);
          }
          return GestureDetector(
            onTap: () async {
              await certainCataController.fetchCategoryByID(cataID: categoryID);
              await context.pushNamed(DRoutesName.certainCategoryRoute,
                  arguments: {"cataName": categoryName});
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30.r,
                  backgroundColor: ColorRes.grey3,
                  child: imageWidget,
                ),
                Text(categoryName,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        fontSize: 14.sp, fontWeight: FontWeight.w500)),
                Text(S.current.seeAll,
                    style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: ColorRes.grey2.withOpacity(.5), fontSize: 14.sp))
              ],
            ),
          );
        });
  }
}
