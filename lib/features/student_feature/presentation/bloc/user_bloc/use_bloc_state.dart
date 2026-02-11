part of 'use_bloc_bloc.dart';

sealed class UseBlocState extends Equatable {
  const UseBlocState();
  
  @override
  List<Object> get props => [];
}

final class UseBlocInitial extends UseBlocState {}
