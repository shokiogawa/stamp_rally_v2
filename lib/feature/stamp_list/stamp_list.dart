import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:stamp_rally_v2_fvm/feature/stamp_detail/stamp_detail.dart';
import 'package:stamp_rally_v2_fvm/feature/stamp_list/provider/fetch_place_and_stamped_provider.dart';

class StampListPage extends HookConsumerWidget {
  const StampListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final placeAsyncNotifier = ref.watch(fetchPlaceAndStampedProvider);

    return placeAsyncNotifier.when(
      data: (places) {
        final acquiredCount = places.where((place) => place.isStamped).length;
        final totalCount = places.length;

        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.emoji_events, color: Colors.orange),
                  const SizedBox(width: 8),
                  Text(
                    '取得スタンプ $acquiredCount / $totalCount',
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1,
                  ),
                  itemCount: places.length,
                  itemBuilder: (context, index) {
                    final place = places[index];
                    return Container(
                      // color: Colors.red,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              StampDetailScreen.push(
                                  context, place.historicSpotId);
                            },
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.asset(
                                    'assets/images/oshiyama.jpg',
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                if (place.isStamped)
                                  Positioned.fill(
                                    top: 0,
                                    child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Image.asset(
                                          'assets/images/stamp.png',
                                          fit: BoxFit.contain,
                                          width: 50,
                                          height: 50,
                                        )
                                        // place.isStamped
                                        //     ? Image.asset(
                                        //         'assets/images/stamp.png',
                                        //         fit: BoxFit.contain,
                                        //         width: 50,
                                        //         height: 50,
                                        //       )
                                        //     : ColorFiltered(
                                        //         colorFilter:
                                        //             const ColorFilter.mode(
                                        //           Colors.grey,
                                        //           BlendMode.modulate,
                                        //         ),
                                        //         child: Image.asset(
                                        //           'assets/images/stamp.png',
                                        //           fit: BoxFit.contain,
                                        //           width: 50,
                                        //           height: 50,
                                        //         ),
                                        //       )
                                        ),
                                  ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            place.name,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(child: Text('エラーが発生しました: $error')),
    );
  }
}
