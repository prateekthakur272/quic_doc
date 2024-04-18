import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';
import 'package:quic_doc/src/repositories/doctor_repository.dart';

enum DoctorDetailsStatus { initial, loading, loaded, error }

class DoctorDetailsState extends Equatable {
  final DoctorDetailsStatus status;
  final Doctor? doctor;

  const DoctorDetailsState(
      {this.status = DoctorDetailsStatus.initial, this.doctor});

  DoctorDetailsState copyWith({DoctorDetailsStatus? status, Doctor? doctor}) {
    return DoctorDetailsState(
        status: status ?? this.status, doctor: doctor ?? this.doctor);
  }

  @override
  List<Object?> get props => [status, doctor];
}

sealed class DoctorDetailsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoadDoctorDetails extends DoctorDetailsEvent {
  final String doctorId;
  LoadDoctorDetails({required this.doctorId});

  @override
  List<Object?> get props => [doctorId];
}

class DoctorDetailsBloc extends Bloc<DoctorDetailsEvent, DoctorDetailsState> {
  final DoctorRepository _doctorRepository;
  DoctorDetailsBloc(DoctorRepository doctorRepository)
      : _doctorRepository = doctorRepository,
        super(const DoctorDetailsState()) {
    on<LoadDoctorDetails>((event, emit) async {
      emit(state.copyWith(status: DoctorDetailsStatus.loading));
      try {
        final doctor = await _doctorRepository.fetchDoctorById(event.doctorId);
        if (doctor == null) {
          emit(state.copyWith(status: DoctorDetailsStatus.error));
        } else {
          emit(
            state.copyWith(
              status: DoctorDetailsStatus.loaded,
              doctor: doctor,
            ),
          );
        }
      } catch (err) {
        emit(state.copyWith(status: DoctorDetailsStatus.error));
      }
    });
  }
}
