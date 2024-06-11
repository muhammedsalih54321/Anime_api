part of 'anime_bloc.dart';

@immutable
sealed class AnimeState {}

final class AnimeInitial extends AnimeState {}
class Animeblocloading extends AnimeState {}
class Animeblocloaded extends AnimeState {}
class Animeblocerror extends AnimeState {}
