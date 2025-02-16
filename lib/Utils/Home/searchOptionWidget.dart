import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stockproject/Bloc/getSearchData_Bloc.dart';
import '../../Themes/themeData.dart';

class SearchOptionWidget extends StatelessWidget {
  final TextEditingController searchTextController;
  const SearchOptionWidget({super.key, required this.searchTextController});

  @override
  Widget build(BuildContext context) {
    return  TextField(
      textInputAction: TextInputAction.done,
      autofocus: true,
      onSubmitted: (val){
        if(val.isNotEmpty) {
          context.read<GetSearchDataBloc>().add(GetSearchDataEventRequested(symbol: val));
        }else{
          FocusScope.of(context).unfocus();
        }
      },
      controller: searchTextController,
      cursorColor: AppTheme().textColor,
      decoration: InputDecoration(
        fillColor: AppTheme().primaryColor,
        filled: true,
        prefixIcon: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: AppTheme().textColor,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius:
          BorderRadius.all(Radius.circular(20)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppTheme().primaryColor,
          ),
          borderRadius:
          BorderRadius.all(Radius.circular(18)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppTheme().primaryColor,
          ),
          borderRadius:
          BorderRadius.all(Radius.circular(20)),
        ),
      ),
      style: TextStyle(color: AppTheme().textColor),
    );
  }
}
