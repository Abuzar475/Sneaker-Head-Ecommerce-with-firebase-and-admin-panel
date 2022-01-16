import 'dart:math';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sneaker_head/Custom/CustomTextField.dart';
import 'package:sneaker_head/FireBase_Service/Store.dart';
import 'package:sneaker_head/Models/Product.dart';

class AddProduct extends StatefulWidget {
  static String id = 'AddProduct';

  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  PickedFile _image;
  String _uploadedFileURL;

  String _name, _price, _description, _category, _imageLocation;

  final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  final _store = Store();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomPadding: false,
      body: Center(
        child: Form(
          key: _globalKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CustomTextField(
                  hint: 'Product Name',
                  onClick: (value) {
                    _name = value;
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  onClick: (value) {
                    _price = value;
                  },
                  hint: 'Product Price',
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  onClick: (value) {
                    _description = value;
                  },
                  hint: 'Product Description',
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  onClick: (value) {
                    _category = value;
                  },
                  hint: 'Product Category',
                ),
                SizedBox(
                  height: 10,
                ),

                ElevatedButton(
                    onPressed: () {
                      chooseImage();
                      var snackBar =
                          SnackBar(content: Text('Image is choosen'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    child: Text('choose Image')),
                ElevatedButton(
                    onPressed: () {
                      uploadImage();
                      var snackBar = SnackBar(
                          content: Text('Image Uploaded successfully'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    },
                    child: Text('Upload Image')),
                // CustomTextField(
                //   onClick: (value) {
                //     _imageLocation = value;
                //   },
                //   hint: 'Product Location',
                // ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    // uploadImage();

                    if (_globalKey.currentState.validate()) {
                      _globalKey.currentState.save();

                      _store.addProduct(Product(
                          pName: _name,
                          pPrice: _price,
                          pDescription: _description,
                          pLocation: _uploadedFileURL,
                          pCategory: _category));

                      var snackBar =
                          SnackBar(content: Text('Products are uploaded'));
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                      return Text('Please Fill the form correctly');
                    }
                  },
                  child: Text('Add Product'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future chooseImage() async {
    await ImagePicker.platform
        .pickImage(source: ImageSource.gallery)
        .then((image) {
      _image = image;
    });
  }

  Future uploadImage() async {
    print(_image.path);
    final imageFile = File(_image.path);
    bool isExist = await imageFile.exists();
    if (isExist) {
      print("file is exsit");
    } else {
      print("file is not exist");
      //return
    }
    int randomNumber = Random().nextInt(100000);
    Reference storageReference =
        FirebaseStorage.instance.ref().child('images/images$randomNumber.jpg');
    UploadTask uploadTask = storageReference.putFile(File(_image.path));
    await uploadTask.whenComplete(() => {print('successfully uploaded')});
    print('File Uploaded');
    storageReference.getDownloadURL().then((fileURL) {
      _uploadedFileURL = fileURL;
    });
  }
}
