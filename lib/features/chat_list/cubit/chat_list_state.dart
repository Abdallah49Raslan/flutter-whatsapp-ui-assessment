part of 'chat_list_cubit.dart';

sealed class ChatListState extends Equatable {
  const ChatListState();

  @override
  List<Object> get props => [];
}

final class ChatListInitial extends ChatListState {}
