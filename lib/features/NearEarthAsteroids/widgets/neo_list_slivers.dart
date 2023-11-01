import 'package:flutter/material.dart';

import '../../../single_asteroid_screen.dart';
import '../../../util/transitions.dart';
import '../models/nea_model.dart';

class NeoListSliverGroup extends StatelessWidget {
  const NeoListSliverGroup(this.asteroidList, {super.key});

  final MapEntry<String, List<SingleAsteroid>> asteroidList;

  @override
  Widget build(BuildContext context) {
    return SliverMainAxisGroup(
      slivers: [
        SliverPersistentHeader(
          pinned: true,
          delegate: _HeaderDelegate(asteroidList.key),
        ),
        _NeoSliverList(asteroidList.value),
      ],
    );
  }
}

class _NeoSliverList extends StatelessWidget {
  const _NeoSliverList(this.singleDayList);

  final List<SingleAsteroid> singleDayList;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate((context, index) {
        final data = singleDayList[index];
        return SizedBox(
          width: double.infinity,
          child: Card(
            child: InkWell(
              onTap: () =>
                  Navigator.push(
                    context,
                    makeSlideTransitionPageRoute(
                      child: SingleAsteroidScreen(
                        data,
                      ),
                    ),
                  ),
              borderRadius: const BorderRadius.all(
                  Radius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment:
                      CrossAxisAlignment.start,
                      children: [
                        Text('Name: ${data.name}'),
                        Text(
                            'Miss Distance: ${data
                                .missDistanceMiles} mi'),
                        Text(
                            'Is Hazardous ${data
                                .isPotentiallyHazardous
                                .toString()}'),
                      ],
                    ),
                    Flexible(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Icon(data.isPotentiallyHazardous
                                ? Icons.error_outline
                                : Icons.gpp_good_outlined,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }, childCount: singleDayList.length),
    );
  }
}

class _HeaderDelegate extends SliverPersistentHeaderDelegate {
  _HeaderDelegate(this.title);

  final String title;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 3.0),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        child: Container(
          height: 64,
          color: Theme.of(context).primaryColor,
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: Text(
              title,
              style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 64;

  @override
  double get minExtent => 32;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      false;
}
