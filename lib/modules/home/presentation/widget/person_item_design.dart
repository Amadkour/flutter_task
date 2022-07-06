import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_task/core/constant/color.dart';
import 'package:flutter_task/core/constant/strings.dart';
import 'package:flutter_task/modules/profile/presentation/page/profile_screen.dart';
import 'package:flutter_task/core/widget/my_image.dart';
import '../../../../core/constant/routes.dart';
import '../../../profile/provider/model/Person_model.dart';

class PersonItemDesign extends StatelessWidget {
  final PersonModel person;

  const PersonItemDesign({Key? key, required this.person}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.profile,
          arguments: [person],
        );
      },
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: MyImage(
              url: '${AppStrings.imageBaseUrl}${person.profilePath}',
              height: 70,
              width: 70,
              originalHeight: MediaQuery.of(context).size.height,
              originalWidth: MediaQuery.of(context).size.width,
              title: person.name!,
              canClick: true,
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  person.name ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: AppColors.blackColor),
                ),
                Text(
                  person.knownForDepartment ?? '',
                  style:
                  Theme.of(context)
                      .textTheme
                      .headline6!
                      .copyWith(color: AppColors.darkGreyColor,fontSize: 16,),
                ),
              ],
            ),
          ),
          const Icon(Icons.arrow_forward_ios_rounded)
        ],
      ),
    );
  }
}
