import 'package:cha_qaqc_department_mobile_app/presentation/view/global.dart';
import 'package:cha_qaqc_department_mobile_app/presentation/widgets/constant.dart';

import 'package:flutter_textfield_autocomplete/flutter_textfield_autocomplete.dart';
import 'package:flutter/material.dart';

class AutocompleteTextfieldMachine extends StatelessWidget {
  TextEditingController textEditingController = TextEditingController();
  final List<String> _itemsList;
  AutocompleteTextfieldMachine(this._itemsList, {Key? key}) : super(key: key);
  final GlobalKey<TextFieldAutoCompleteState<String>>
      _textFieldAutoCompleteKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 0.24,
      height: SizeConfig.screenheight * 0.0664,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFieldAutoComplete(
        clearOnSubmit: false,
        itemSubmitted: (String item) {
          Global.qcReport.machineId = item;
          print(Global.qcReport);
        },
        key: _textFieldAutoCompleteKey,
        controller: textEditingController,
        suggestions: _itemsList,
        style: TextStyle(color: Colors.black, fontSize: 17),
        decoration: InputDecoration(
          hintText: 'Nhập',
          hintStyle: TextStyle(fontSize: 16),
          contentPadding:
              EdgeInsets.only(left: SizeConfig.screenWidth * 0.0881),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: Colors.black, width: 2)),
        ),
        itemFilter: (String item, query) {
          return item.toLowerCase().startsWith(query.toLowerCase());
        },
        itemSorter: (String a, String b) {
          return a.compareTo(b);
        },
        itemBuilder: (context, String item) {
          return Container(
            padding: EdgeInsets.all(20.0),
            child: Row(
              children: <Widget>[
                Text(
                  item,
                  style: TextStyle(color: Colors.black, fontSize: 17),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

// moldId
class AutocompleteTextfieldMold extends StatelessWidget {
  TextEditingController textEditingController = TextEditingController();
  final List<String> _itemsList;
  AutocompleteTextfieldMold(this._itemsList, {Key? key}) : super(key: key);
  final GlobalKey<TextFieldAutoCompleteState<String>>
      _textFieldAutoCompleteKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.screenWidth * 0.24,
      height: SizeConfig.screenheight * 0.0664,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextFieldAutoComplete(
        clearOnSubmit: false,
        itemSubmitted: (String item) {
          Global.qcReport.moldId = item;
          print(Global.qcReport.moldId);
        },
        key: _textFieldAutoCompleteKey,
        controller: textEditingController,
        suggestions: _itemsList,
        style: TextStyle(color: Colors.black, fontSize: 17),
        decoration: InputDecoration(
            hintText: 'Nhập',
            hintStyle: TextStyle(fontSize: 16),
            contentPadding:
                EdgeInsets.only(left: SizeConfig.screenWidth * 0.0881),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(2),
                borderSide: BorderSide(color: Colors.black, width: 2))),
        itemFilter: (String item, query) {
          return item.toLowerCase().startsWith(query.toLowerCase());
        },
        itemSorter: (String a, String b) {
          return a.compareTo(b);
        },
        itemBuilder: (context, String item) {
          return Container(
            padding: EdgeInsets.all(20.0),
            child: Row(
              children: <Widget>[
                Text(
                  item,
                  style: TextStyle(color: Colors.black),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
