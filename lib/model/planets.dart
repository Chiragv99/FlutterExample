class Planets {
  late final String area;
  late final String canvas;


  Planets({
    required this.area,
    required this.canvas,
  });

  Planets.fromMap(Map<String, dynamic> result)
      : area = result["area"],
        canvas = result["canvas"];
  Map<String, Object> toMap() {
    return {
      'area': area,
      'canvas': canvas
    };
  }
}
