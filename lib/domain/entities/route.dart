import 'package:freezed_annotation/freezed_annotation.dart';

import '../../core/constants.dart';

part 'route.freezed.dart';

/// A calculated navigation route between waypoints.
///
/// Contains the full path geometry, turn-by-turn instructions,
/// elevation profile, and metadata.
@freezed
class Route with _$Route {
  const factory Route({
    required String id,
    required List<Waypoint> waypoints,
    required List<RouteSegment> segments,
    required RouteSummary summary,
    required ElevationProfile elevation,
    TransportMode? mode,
    DateTime? calculatedAt,
  }) = _Route;

  const Route._();

  /// Total distance in meters
  double get totalDistanceMeters => summary.totalDistanceMeters;

  /// Estimated duration
  Duration get estimatedDuration => summary.estimatedDuration;

  /// Starting point
  Waypoint get origin => waypoints.first;

  /// Destination
  Waypoint get destination => waypoints.last;
}

/// A single point along a route with optional metadata.
@freezed
class Waypoint with _$Waypoint {
  const factory Waypoint({
    required double latitude,
    required double longitude,
    String? name,
    String? address,
    WaypointType? type,
  }) = _Waypoint;
}

/// Types of waypoints
enum WaypointType {
  origin,
  destination,
  via,
  poi,
}

/// A segment of a route between two consecutive waypoints.
@freezed
class RouteSegment with _$RouteSegment {
  const factory RouteSegment({
    required int index,
    required String instruction,
    required double distanceMeters,
    required Duration duration,
    required ManeuverType maneuver,
    String? streetName,
    double? heading,
  }) = _RouteSegment;
}

/// Types of navigation maneuvers
enum ManeuverType {
  straight,
  turnSlightLeft,
  turnLeft,
  turnSharpLeft,
  turnSlightRight,
  turnRight,
  turnSharpRight,
  uturn,
  roundabout,
  arrive,
  depart,
  merge,
  ramp,
}

/// Summary statistics for a calculated route.
@freezed
class RouteSummary with _$RouteSummary {
  const factory RouteSummary({
    required double totalDistanceMeters,
    required Duration estimatedDuration,
    required double boundsMinLat,
    required double boundsMinLng,
    required double boundsMaxLat,
    required double boundsMaxLng,
  }) = _RouteSummary;
}

/// Elevation profile for a route.
@freezed
class ElevationProfile with _$ElevationProfile {
  const factory ElevationProfile({
    required List<ElevationPoint> points,
    required double totalAscentMeters,
    required double totalDescentMeters,
    required double minElevationMeters,
    required double maxElevationMeters,
  }) = _ElevationProfile;
}

/// A single point in an elevation profile.
@freezed
class ElevationPoint with _$ElevationPoint {
  const factory ElevationPoint({
    required double distanceFromStartMeters,
    required double elevationMeters,
  }) = _ElevationPoint;
}
