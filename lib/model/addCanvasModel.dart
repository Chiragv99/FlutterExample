class AddCanvasModel {


  String canvas;
  String area;

  AddCanvasModel({required this.canvas,required this.area });



  AddCanvasModel.fromMap(Map<String, dynamic> result)
      : area = result["area"],
        canvas = result["canvas"];
  Map<String, Object> toMap() {
    return {
      'area': area,
      'canvas': canvas
    };
  }

}