class AvailabilityR {
  final String morning;
  final String evening;
  final String morningStartSlot;
  final String morningEndSlot;
  final String eveningStartSlot;
  final String eveningEndSlot;
  final String consultationTime;

  AvailabilityR(
    this.morning,
    this.evening,
    this.morningStartSlot,
    this.morningEndSlot,
    this.eveningStartSlot,
    this.eveningEndSlot,
    this.consultationTime,
  );
  Map toJson() => {
        'morning_start_time': morningStartSlot + "AM",
        'morning_end_time': morningEndSlot + "AM",
        'evening_hour_starts': eveningStartSlot + "PM",
        'evening_hour_ends': eveningEndSlot + "PM",
        "consultation_duration": consultationTime,
      };
}
