import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'selected_event_url_provider.g.dart';

@Riverpod(keepAlive: true)
class SelectedEventUrl extends _$SelectedEventUrl {
  @override
  String build() {
    return '';
  }

  void setUrl(String url) {
    state = url;
  }
}
