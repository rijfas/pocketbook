import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ResponseLoading extends StatelessWidget {
  const ResponseLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[200]!,
        child: Container(
          margin: const EdgeInsets.all(8.0),
          padding: const EdgeInsets.all(12.0),
          height: 50,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.only(
              topLeft: Radius.zero,
              topRight: Radius.circular(8.0),
              bottomLeft: Radius.circular(8.0),
              bottomRight: Radius.circular(8.0),
            ),
          ),
        ),
      ),
    );
  }
}
