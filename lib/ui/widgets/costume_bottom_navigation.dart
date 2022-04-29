import 'package:airplane/cubit/page_cubit.dart';
import 'package:flutter/material.dart';
import '../../utils/utils.dart';
import '../../shared/shared.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CostumeBottomNavigationItem extends StatelessWidget {
  final int index;
  final String assetsImagePath;

  const CostumeBottomNavigationItem(
      {Key? key, required this.assetsImagePath, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<PageCubit>().changePage(index);
      },
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            Image.asset(
              assetsImagePath,
              width: 24,
              height: 24,
              color: context.read<PageCubit>().state == index
                  ? kPrimaryColor
                  : kGreyColor,
            ),
            Container(
              height: 2,
              width: 30,
              decoration: BoxDecoration(
                  color: context.read<PageCubit>().state == index
                      ? kPrimaryColor
                      : kTransparentColor,
                  borderRadius: BorderRadius.circular(18)),
            )
          ],
        ),
      ),
    );
  }
}
