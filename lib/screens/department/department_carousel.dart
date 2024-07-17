import 'package:flutter/material.dart';
import 'package:neversitup_test_flutter/models/department/department_list_result.dart';

class DepartmentCarouselScreen extends StatelessWidget {
  final double? height;
  final double? width;
  final DepartmentModel data;

  const DepartmentCarouselScreen({
    this.height,
    this.width,
    required this.data,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(
            Radius.circular(
              16,
            ),
          ),
          border: Border.all(
            width: 1,
          ),
        ),
        width: width,
        height: height,
        margin: const EdgeInsets.only(right: 8),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: Image.network(
                data.imageUrl ?? "",
                fit: BoxFit.cover,
                width: double.infinity,
                height: double.infinity,
              ),
            ),
            Positioned(
              top: 5,
              right: 5,
              child: Text(
                data.name ?? "",
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ));
  }
}
