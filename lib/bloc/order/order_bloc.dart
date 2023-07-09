import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nike_shop/bloc/order/order_event.dart';
import 'package:nike_shop/bloc/order/order_state.dart';
import 'package:nike_shop/data/repositories/order_repository.dart';
import 'package:nike_shop/models/order.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  final IOrderRepository _repository;

  OrderBloc(this._repository) : super(InitOrderState()) {
    on<GetOrdersEvent>((event, emit) {
      List<Order> orderList = _repository.getOrders();
      emit(orderList.isEmpty
          ? EmptyOrderState('خریدی انجام ندادید')
          : CompletedOrderState(orderList));
    });

    on<AddOrderEvent>((event, emit) async {
      await _repository.addOrder(event.order);
    });
  }
}
