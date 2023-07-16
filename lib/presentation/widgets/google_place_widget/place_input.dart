import 'package:flutter/material.dart'
    show  InputBorder, InputDecoration, OutlineInputBorder;
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../../../app/utils/utils.dart';
import '../../../data/providers/location_provider.dart';
import 'google_places_flutter_test.dart';
import 'model/prediction.dart';

class PlaceDetails {
  PlaceDetails(
    this.placeId,
    this.city,
    this.country,
    this.latitude,
    this.longitude,
  );

  final String placeId;
  final String city;
  final String country;
  final String latitude;
  final String longitude;
}

class PlacesInput extends FormField<Prediction> {
  PlacesInput({
    required String hintText,
    required TextEditingController controller,
    EdgeInsetsGeometry? margin,
    Color? color,
    super.onSaved,  Color? hintTextColor,  Color? borderColor,  FocusNode? focusNode,
  }) : super(
          builder: (fieldState) => PlacesInputWidget(
            hintText: hintText,
            onItemSelect: (p) => fieldState.didChange(p),
            controller: controller,
            errorText: fieldState.errorText,
            color: color,
            margin: margin,
            hintTextColor: hintTextColor,
            borderColor: borderColor,
              focusNode : focusNode
          ),
          validator: (v) => v == null ? "address required" : null,
        );
}

class PlacesInputWidget extends StatefulWidget {
  const PlacesInputWidget({
    required this.hintText,
    required this.onItemSelect,
    this.errorText,
    required this.controller,
    this.color,
    this.margin,
    super.key, this.borderColor, this.hintTextColor, this.focusNode,
  });

  final String hintText;
  final ValueChanged<Prediction> onItemSelect;
  final String? errorText;
  final TextEditingController controller;
  final Color? color;
  final EdgeInsetsGeometry? margin;
  final Color? borderColor;
  final Color? hintTextColor;
  final FocusNode? focusNode;


  @override
  State<PlacesInputWidget> createState() => _PlacesInputWidgetState();
}

class _PlacesInputWidgetState extends State<PlacesInputWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        border: Border.all(
          color: widget.borderColor ?? AppColors.hintGrey,
          width: 1.0,
        ),
      ),
      child: GooglePlaceAutoCompleteTextFieldTest(
        textEditingController: widget.controller,
        borderColor :widget.borderColor,
        googleAPIKey: ApiConfig.googleApiKey,
        textStyle: TextStyle(

            fontSize: 16,),
        inputDecoration: InputDecoration(
            contentPadding: EdgeInsets.only(top: 16,bottom: 16,left: 40,right: 16),
            border: InputBorder.none,
            hintText: widget.hintText,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: BorderSide(color: AppColors.greyF5F5F5,width: 1),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: BorderSide(color:AppColors.greyF5F5F5,width: 1),
            ),

            hintStyle: TextStyle(
                color: widget.hintTextColor ?? AppColors.hintGrey,
                fontSize: 17,)),
        debounceTime: 800,
        // default 600 ms,
        getPlaceDetailWithLatLng: (prediction) {
          if (prediction.lat != null)
            Provider.of<LocationProvider>(context, listen: false)
                .updateAddress(prediction.lat!, prediction.lng!);
        },
        itmClick: (prediction) {
          widget.controller.text = prediction.description!;
          if (prediction.lat != null)
            Provider.of<LocationProvider>(context, listen: false)
                .updateAddress(prediction.lat!, prediction.lng!);
          widget.controller.selection = TextSelection.fromPosition(
            TextPosition(offset: prediction.description!.length),
          );
          widget.onItemSelect.call(prediction);
        },
      ),
    );
  }

  @override
  void dispose() {
    widget.controller.dispose();
    super.dispose();
  }
}
