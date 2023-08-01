import 'package:toptop/screens/select_address/address_model.dart';

class AddressCached{
  //const AddressCached._();

  // final sampleData = {
  //   'provinces': {
  //     '0': { == Province level
  //       'model': AddressModel(),
  //       'districts': {
  //          '0': { == District level
  //              'model': AddressMode(),
  //              'wards': <AddressModel>[],
  //          },
  //       }
  //     }
  //   },
  // };
  final Map<String,Map<String,dynamic>> cache = {};

  void addProvinces(List<AddressModel> list){
    if(cache.isEmpty) cache['provinces'] = {};
    for(int i = 0 ;i<list.length;i++){
      cache['provinces']!.putIfAbsent('$i', () => {
        'model': list[i],
        'districts' : {},
      });
    }
  }
  void addDistrict(int provinceId, List<AddressModel> list){
    if (cache['provinces']?['$provinceId']?['districts'] != null)  return;
    for(int i = 0; i< list.length; i++){
      cache['provinces']!['$provinceId']!['districts'].putIfAbsent(
        '$i', ()=> {
          'model': list[i],
          'wards': <AddressModel>[],
      }
      );
    }
  }
  // void addWard(int provinceId,int districtId, List<AddressModel> list){
  //   if (cache['provinces'] == null ||
  //       cache['provinces']?['$provinceId'] != null ||
  //       cache['provinces']?['$provinceId']?['districts'] != null ||
  //       cache['provinces']?['$provinceId']?['districts']['$districtId'] != null
  //   ) {
  //     return;
  //   }
  //   for(int i = 0; i< list.length; i++){
  //     cache['provinces']!['$provinceId']!['districts'].putIfAbsent(
  //         '$i', ()=> {
  //       'model': list[i],
  //       'wards': <AddressModel>[],
  //     }
  //     );
  //   }
  // }
}