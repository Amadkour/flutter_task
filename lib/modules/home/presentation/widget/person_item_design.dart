import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
              url: 'https://image.tmdb.org/t/p/w500/${person.profilePath}',
              height: 70,
              width: 70,
              fit: BoxFit.fill,
            ),
          ),
          Column(
            children: [
              Text(
                person.name ?? '',
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              Text(
                person.knownForDepartment ?? '',
                style: const TextStyle(
                  color: Colors.blueGrey,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const Icon(Icons.arrow_forward_ios_rounded)
        ],
      ),
    );
  }
}
