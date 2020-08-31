import 'package:flutter/material.dart';

class RouteObserverRewrite<R extends Route<dynamic>> extends NavigatorObserver {
  final Map<R, Set<RouteAware>> _listeners = <R, Set<RouteAware>>{};

  /// Subscribe [routeAware] to be informed about changes to [route].
  ///
  /// Going forward, [routeAware] will be informed about qualifying changes
  /// to [route], e.g. when [route] is covered by another route or when [route]
  /// is popped off the [Navigator] stack.
  void subscribe(RouteAware routeAware, R route) {
    assert(routeAware != null);
    assert(route != null);
    final Set<RouteAware> subscribers = _listeners.putIfAbsent(route, () => <RouteAware>{});
    if (subscribers.add(routeAware)) {
      routeAware.didPush();
    }
  }

  /// Unsubscribe [routeAware].
  ///
  /// [routeAware] is no longer informed about changes to its route. If the given argument was
  /// subscribed to multiple types, this will unregister it (once) from each type.
  void unsubscribe(RouteAware routeAware) {
    assert(routeAware != null);
    for (final R route in _listeners.keys) {
      final Set<RouteAware> subscribers = _listeners[route];
      subscribers?.remove(routeAware);
    }
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic> previousRoute) {
    if (route is R && previousRoute is R) {
      final List<RouteAware> subscribers = _listeners[route]?.toList();

      if (subscribers != null) {
        for (final RouteAware routeAware in subscribers) {
          routeAware.didPop();
        }
      }

      final List<RouteAware> previousSubscribers = _listeners[previousRoute]?.toList();

      if (previousSubscribers != null) {
        for (final RouteAware routeAware in previousSubscribers) {
          routeAware.didPopNext();
        }
      }

    }
  }

  @override
  void didPush(Route<dynamic> route, Route<dynamic> previousRoute) {
    if (route is R && previousRoute is R) {
      final Set<RouteAware> previousSubscribers = _listeners[previousRoute];

      if (previousSubscribers != null) {
        for (final RouteAware routeAware in previousSubscribers) {
          routeAware.didPushNext();
        }
      }
    }
  }
}