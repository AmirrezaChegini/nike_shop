import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_shop/bloc/cart/cart_event.dart';
import 'package:nike_shop/bloc/cart/cart_state.dart';
import 'package:nike_shop/data/repositories/cart_repository.dart';
import 'package:nike_shop/utils/shared_pref.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final ICartRepository _repository;

  CartBloc(this._repository) : super(InitCartState()) {
    on<GetAllCartEvent>((event, emit) async {
      if (SharedPref.getString(key: 'token').isEmpty) {
        emit(UnAuthCartState('لطفا وارد حساب کاربری خود شوید'));
        return;
      }

      var either = await _repository.getCarts();

      either.fold((l) {
        emit(FailedCartState(l));
      }, (r) {
        r.isEmpty
            ? emit(EmptyCartState('سبد خرید خالی می باشد'))
            : emit(DataCartState(r));
      });
    });

    on<AddCartEvent>((event, emit) async {
      if (SharedPref.getString(key: 'token').isEmpty) {
        emit(UnAuthCartState('لطفا وارد حساب کاربری خود شوید'));
        return;
      }

      await _repository.addCart(productId: event.productId);
      var either = await _repository.getCarts();

      either.fold((l) {
        emit(FailedCartState(l));
      }, (r) {
        r.isEmpty
            ? emit(EmptyCartState('سبد خرید خالی می باشد'))
            : emit(DataCartState(r));
      });
    });

    on<RemoveCartEvent>((event, emit) async {
      if (SharedPref.getString(key: 'token').isEmpty) {
        emit(UnAuthCartState('لطفا وارد حساب کاربری خود شوید'));
        return;
      }

      await _repository.removeCart(cartId: event.cartId);
      var either = await _repository.getCarts();

      either.fold((l) {
        emit(FailedCartState(l));
      }, (r) {
        r.isEmpty
            ? emit(EmptyCartState('سبد خرید خالی می باشد'))
            : emit(DataCartState(r));
      });
    });

    on<ChangeCountCartEvent>((event, emit) async {
      if (SharedPref.getString(key: 'token').isEmpty) {
        emit(UnAuthCartState('لطفا وارد حساب کاربری خود شوید'));
        return;
      }

      await _repository.changeCountCart(
          cartId: event.cartId, count: event.count);
      var either = await _repository.getCarts();

      either.fold((l) {
        emit(FailedCartState(l));
      }, (r) {
        r.isEmpty
            ? emit(EmptyCartState('سبد خرید خالی می باشد'))
            : emit(DataCartState(r));
      });
    });
  }
}
