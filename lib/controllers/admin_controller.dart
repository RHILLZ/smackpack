import 'dart:io';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smackpack/controllers/controller_exporter.dart';
import 'package:smackpack/core/styles.dart';
import 'package:smackpack/data/firebase/futures.dart';
import 'package:smackpack/data/firebase/streams.dart';
import 'package:smackpack/data/firebase/strorage.dart';
import 'package:smackpack/data/models/contact.dart';
import 'package:smackpack/data/models/product.dart';

class AdminController extends GetxController {
  final RxList<Product> _products = <Product>[].obs;
  final Rx<Contact> _contact = Contact(
    cashAppTag: '',
    deliveryInfo: '',
    deliveryFee: '',
    pickUpLocation: '',
    contact: '',
  ).obs;
  final _doneLoading = false.obs;
  final Location _location = Get.find<AppController>().location;
  final ImagePicker _picker = ImagePicker();
  final RxString _strainName = ''.obs;
  final _strainType = RxnString();
  String? _strainImageURL;
  final RxString _thcLevel = ''.obs;
  final RxString _cbdLevel = ''.obs;
  final RxString _quarterDonation = ''.obs;
  final RxString _halfDonation = ''.obs;
  final RxString _ozDonation = ''.obs;
  final RxDouble _effectLevel = 0.0.obs;
  final RxDouble _updatedEffectLevel = 0.0.obs;
  final _imageFile = File('').obs;
  final _isValidated = false.obs;
  final _isProcessing = false.obs;

  // getters
  get strainName => _strainName.value;
  get strainType => _strainType.value;
  get strainImageURL => _strainImageURL;
  get thcLevel => _thcLevel.value;
  get cbdLevel => _cbdLevel.value;
  get quarterDonation => _quarterDonation.value;
  get halfDonation => _halfDonation.value;
  get ozDonation => _ozDonation.value;
  get effectLevel => _effectLevel.value;
  get updatedEffectLevel => _updatedEffectLevel.value;
  get imageFile => _imageFile.value;
  get isProcessing => _isProcessing.value;
  get isValidated => _isValidated.value;
  get doneLoading => _doneLoading.value;
  get products => _products;
  get contact => _contact.value;

  //setters
  set strainName(value) => _strainName.value = value;
  set strainType(value) => _strainType.value = value;
  set thcLevel(value) => _thcLevel.value = value;
  set cbdLevel(value) => _cbdLevel.value = value;
  set quarterDonation(value) => _quarterDonation.value = value;
  set halfDonation(value) => _halfDonation.value = value;
  set ozDonation(value) => _ozDonation.value = value;
  set effectLevel(value) => _effectLevel.value = value;
  set updatedEffectLevel(value) => _updatedEffectLevel.value = value;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  //log out of admin
  exit() async {
    await Get.find<AuthController>().logOut();
    Get.offNamed('/auth_view');
  }

  //fetch data
  Future<void> fetchData() async {
    _products.bindStream(FirebaseStreams().streamAdminProducts(_location));

    _contact.value = await FirebaseFutures().getContactInfo(_location);

    _doneLoading.value = true;
  }

  //set Location
  // void setLocation(Location local) => _location = local;

  //image selector
  void selectImage() async {
    final image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      _imageFile.value = File(image.path);
    }
  }

  //Image upload and url getting
  Future<String?> processImage() async {
    String? url;
    assert(strainName != '');
    final isUploaded =
        await Storage().uploadImage(_imageFile.value, strainName, _location);
    if (isUploaded) {
      final imageName = _imageFile.value.path.split('/').last;
      url = await Storage().getDownloadURL(_location, imageName, strainName);
    }
    return url;
  }

//submit new product
  submit() async {
    _isProcessing.toggle();
    String? imageURL;
    if (isValidated) {
      if (_imageFile.value.path != '') {
        imageURL = await processImage();
      }

      final product = Product(
          strainName: strainName,
          strainType: strainType,
          strainImageURL: imageURL,
          effectLevel: effectLevel,
          thcLevel: thcLevel,
          cbdLevel: cbdLevel,
          quarterPrice: quarterDonation,
          halfPrice: halfDonation,
          ozPrice: ozDonation,
          isInStock: true);
      final isSuccessful =
          await FirebaseFutures().createProduct(product, _location);
      if (isSuccessful) {
        _isProcessing.toggle();
        Get.snackbar('Submission successful.', 'product is ready for view.',
            colorText: errorTextColor, backgroundColor: smackGreen);
      } else {
        _isProcessing.toggle();
        Get.snackbar(
            'Please try again.', 'There was a problem with submission.',
            colorText: errorTextColor, backgroundColor: errorColor);
      }
    } else {
      _isProcessing.toggle();
      Get.snackbar('Incomplete form',
          'Please make sure all fields are filled before submission.',
          colorText: errorTextColor, backgroundColor: errorColor);
    }
  }

// validate info
  void validateForm() {
    if (strainName == '') {
      return;
    }
    if (strainType == '') {
      return;
    }
    if (effectLevel == 0.0) {
      return;
    }
    if (thcLevel == '') {
      return;
    }
    if (cbdLevel == '') {
      return;
    }
    if (quarterDonation == '') {
      return;
    }
    if (halfDonation == '') {
      return;
    }
    if (ozDonation == '') {
      return;
    }

    _isValidated.value = true;
  }

  //toggle stock
  toggleStock(Product product, bool inStock) async {
    final prod = product.toJson();
    prod['isInStock'] = inStock;
    await FirebaseFutures().updateProduct(Product.fromJson(prod), _location);
  }

  // update product in firebase
  updateProduct(Product product) async {
    _isProcessing.toggle();
    String? imageURL;
    final prod = product.toJson();
    if (_imageFile.value.path != '') {
      imageURL = await processImage();
      prod['strainImageURL'] = imageURL;
    }

    final isUpdated = await FirebaseFutures()
        .updateProduct(Product.fromJson(prod), _location);
    if (isUpdated) {
      _isProcessing.toggle();
      Get.back();
      Get.snackbar('Update complete.', 'product was successfully updated.',
          colorText: errorTextColor, backgroundColor: smackGreen);
    } else {
      _isProcessing.toggle();
      Get.snackbar(
          'Update error.', 'Something went wrong with update. Try again.',
          colorText: errorTextColor, backgroundColor: errorColor);
    }
  }

  //delete product
  deleteProduct(context, product) async {
    AwesomeDialog(
            context: context,
            dialogType: DialogType.QUESTION,
            title: 'Delete product',
            desc: 'Are you sure',
            btnCancelOnPress: () => Get.back(),
            btnOkOnPress: () async =>
                await FirebaseFutures().deleteProduct(product, _location),
            btnCancelColor: smackPink,
            btnOkText: 'yep!',
            btnOkColor: smackBlue)
        .show();
  }
}
