import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../styles/icon_broken.dart';
import '../../widgets/headline_text.dart';
import '../../widgets/my_button.dart';
import '../../widgets/my_form_field.dart';

class AddStoreScreen extends StatelessWidget {
   AddStoreScreen({Key? key}) : super(key: key);
  var newStoreNameController = TextEditingController();
   var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title:const HeadLineText(text:'New Store',fontSize: 24,),
        leading: IconButton(
          onPressed: (){
          Navigator.pop(context);
        },
          icon: const Icon(IconBroken.Arrow___Left_2),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
              padding:  EdgeInsets.all(16.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                [
                  MyFormField(
                    prefix: Icons.storefront_outlined,
                    hintText: 'Store Name',
                    borderColor:  const Color(0xffE5E5E5),
                    controller: newStoreNameController,
                    validateText:'this files must not be empty',
                    maxLines: 1,
                    autofocus: true,
                    inputType: TextInputType.name,
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  MyButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                      }
                    },
                    text: 'Add',
                    isUpper: false,
                    //borderRadius: 18.r,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
