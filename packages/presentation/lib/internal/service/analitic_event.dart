abstract class AnalyticsEvent {
  static const tabClickedEvent = '_tab_clicked';
  static const mainScreenOpenedEvent = 'main_screen_opened';
  static const loginScreenOpenedEvent = 'login_screen_opened';

  factory AnalyticsEvent() => _AnalyticsEvent();

  String adaptEventName(String event);

  String getAnalyticsTabName(String tab);
}

class _AnalyticsEvent implements AnalyticsEvent {
  @override
  String adaptEventName(String event) {
    final characters = event.toLowerCase().split('');

    for (int i = 0; i < characters.length; i++) {
      characters[i].replaceAll("-", "_");
    }

    return characters.join();
  }

  @override
  String getAnalyticsTabName(String tab) =>
      "$tab${AnalyticsEvent.tabClickedEvent}";
}
