


import 'package:bloc/bloc.dart';
import 'package:calculator/screens/cart/presenation/manager/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/data/models/CartReponse.dart';
import '../../data/data_sources/dto.dart';
import '../../data/repositories/cart_data_repo.dart';
import '../../domain/repositories/cart_domain_repo.dart';
import '../../domain/use_cases/get_cart_use_case.dart';

class CartCubit extends Cubit<CartStates> {
  CartDto cartDto;


  CartCubit(this.cartDto) : super(CartInitStates());

  static CartCubit get(context) => BlocProvider.of(context);
  List<Data?> cartResponse = [];

  void update(String id, int count) async {
    CartDomainRepo cartDomainRepo = CartDataRepo(cartDto);
    CartUseCase cartUseCase = CartUseCase(cartDomainRepo);
    var result = await cartUseCase.update(id, count);
    result.fold((l) {
      print(l.message);
      emit(CartDeleteItemErrorStates(l));
    }, (r) {
      emit(CartSuccessStates(r));
    });
  }

  void deleteItem(String id) async {
    CartDomainRepo cartDomainRepo = CartDataRepo(cartDto);
    CartUseCase cartUseCase = CartUseCase(cartDomainRepo);
    var result = await cartUseCase.delete(id);
    result.fold((l) {
      print(l.message);
      emit(CartDeleteItemErrorStates(l));
    }, (r) {
      emit(CartSuccessStates(r));
    });
  }

  void getCart() async {
    CartDomainRepo cartDomainRepo = CartDataRepo(cartDto);
    CartUseCase cartUseCase = CartUseCase(cartDomainRepo);
    var result = await cartUseCase.call();
    result.fold((l) {
      print(l.message);
      emit(CartErrorStates(l));
    }, (r) {
      cartResponse.add(r.data) ;
      emit(CartSuccessStates(r));
    });
  }
}
