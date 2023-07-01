part of 'pariwisata_detail_bloc.dart';

@immutable
abstract class PariwisataDetailEvent {}

class GetDetailPariwisataEvent extends PariwisataDetailEvent {
  int id;

  GetDetailPariwisataEvent({
    required this.id,
  });
}
