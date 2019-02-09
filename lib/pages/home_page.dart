import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  String title;

  var _txtCuponCodeController = TextEditingController();

  HomePage({this.title});

  @override
  Widget build(BuildContext context) {
    final String cameraIconAsset = 'images/icons8_camera.svg';
    final Widget svgCamera = SvgPicture.asset(
      cameraIconAsset,
      semanticsLabel: "Camera Logo",
      allowDrawingOutsideViewBox: true,
      height: 48,
      width: 48,
    );

    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      validator: _inputCouponValidator,
                      controller: _txtCuponCodeController,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 24, color: Colors.grey[600]),
                      textCapitalization: TextCapitalization.characters,
                      decoration: InputDecoration(
                          hintText: "Cupon Code",
                          hintStyle: TextStyle(fontSize: 18),
                          suffixIcon: IconButton(
                            onPressed: () {
                              if (_formKey.currentState.validate()) {
                                print("validated");
                              } else {
                                print("invalid");
                              }
                            },
                            icon: Icon(Icons.done),
                          ),
                          prefixIcon: IconButton(
                            icon: Icon(Icons.clear),
                            iconSize: 20,
                            onPressed: () {
                              _txtCuponCodeController.clear();
                            },
                          )),
                    ),
                  ),
                  IconButton(
                    icon: svgCamera,
                    onPressed: (){
                      // open camera
                    },
                  ),
                ],
              ),
              SizedBox(
                height: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _inputCouponValidator(String value) {
    return value.length == 12
        ? null
        : "Invalid cupon code: Should be 12 characters length.";
  }
}
