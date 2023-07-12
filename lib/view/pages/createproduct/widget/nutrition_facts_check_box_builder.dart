import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qrmenu/core/extension/context_extension.dart';
import 'package:qrmenu/product/utility/page_padding.dart';
import 'package:qrmenu/product/widget/text_field.dart';

class NutritionFactsCheckBoxBuilder extends StatelessWidget {
  const NutritionFactsCheckBoxBuilder({
    super.key,
    required this.title,
   
   
    this.hintText,
 
  
    this.onChangedField,
  });
  final String title;


  final String? hintText;
  final void Function(String)? onChangedField;




  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: PagePadding.allMin(),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(title),
        trailing: SizedBox(
            width: context.width / 5,
            child: CommonTextField(
          
             
              hintText: hintText ?? "0",
              onChanged: onChangedField,
              textAlign: TextAlign.center,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            )),
      ),
    );
  }
}
