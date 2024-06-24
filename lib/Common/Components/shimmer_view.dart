import 'package:flutter/material.dart';

class SimmerView extends StatelessWidget {
  const SimmerView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Padding(
        padding: EdgeInsets.all(10.0),
        child: ShimmerViewSetup(),
      ),
    );
  }
}

// Here we setup the shimmer view, basically how the shimmer view will look like
class ShimmerViewSetup extends StatelessWidget {
  const ShimmerViewSetup({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShimmerBox(flex: 6, widthFactor: 1),
        SizedBox(height: 10),
        ShimmerBox(flex: 1, widthFactor: 1),
        SizedBox(height: 10),
        ShimmerBox(flex: 1, widthFactor: 0.75),
        SizedBox(height: 20),
        ShimmerBox(flex: 6, widthFactor: 1),
        SizedBox(height: 10),
        ShimmerBox(flex: 1, widthFactor: 1),
        SizedBox(height: 10),
        ShimmerBox(flex: 1, widthFactor: 0.75),
        SizedBox(height: 20),
        ShimmerBox(flex: 6, widthFactor: 1),
        SizedBox(height: 10),
        ShimmerBox(flex: 1, widthFactor: 1),
        SizedBox(height: 10),
        ShimmerBox(flex: 1, widthFactor: 0.75),
        SizedBox(height: 20),
      ],
    );
  }
}

// Here we created a shimmer box, which will be used in the shimmer view
class ShimmerBox extends StatelessWidget {
  const ShimmerBox({super.key, required this.flex, required this.widthFactor});

  final int flex;
  final double widthFactor;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: FractionallySizedBox(
        widthFactor: widthFactor,
        child: Container(
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.05),
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
      ),
    );
  }
}
