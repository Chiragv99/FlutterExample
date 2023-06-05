class GetCanvasRete {

  String canvasrate;

  GetCanvasRete({required this.canvasrate});

  GetCanvasRete.fromMap(Map<String, dynamic> result)
      : canvasrate = result["canvasrate"];

  Map<String, Object> toMap() {
    return {'canvasrate': canvasrate};
  }

}