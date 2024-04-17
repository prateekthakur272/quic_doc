import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:models/models.dart';
import 'package:quic_doc/src/repositories/doctor_repository.dart';

enum HomeStatus { initial, loading, loaded, error }

class HomeState extends Equatable {
  final HomeStatus status;
  final List<DoctorCategory> doctorCategories;
  final List<Doctor> nearbyDoctors;
  final List myAppointments;

  const HomeState({
    this.status = HomeStatus.initial,
    this.doctorCategories = const <DoctorCategory>[],
    this.nearbyDoctors = const <Doctor>[],
    this.myAppointments = const [],
  });

  @override
  List<Object?> get props =>
      [status, doctorCategories, nearbyDoctors, myAppointments];

  HomeState copyWith({
    HomeStatus? status,
    List<DoctorCategory>? doctorCategories,
    List<Doctor>? nearbyDoctors,
    List? myAppointments,
  }) {
    return HomeState(
      status: status ?? this.status,
      doctorCategories: doctorCategories ?? this.doctorCategories,
      nearbyDoctors: nearbyDoctors ?? this.nearbyDoctors,
      myAppointments: myAppointments ?? this.myAppointments,
    );
  }
}

sealed class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  List<Object?> get props => [];
}

class LoadHomeEvent extends HomeEvent {}

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final DoctorRepository _doctorRepository;
  HomeBloc({required DoctorRepository doctorRepository})
      : _doctorRepository = doctorRepository,
        super(const HomeState()) {
    on<LoadHomeEvent>((event, emit) async {
      emit(state.copyWith(status: HomeStatus.loading));
      try {
        final categoriesFuture = _doctorRepository.fetchDoctorCategories();
        final doctorsFuture = _doctorRepository.fetchDoctors();

        final response = await Future.wait([
          categoriesFuture,
          doctorsFuture,
        ]);

        final categories = response[0] as List<DoctorCategory>;
        final doctors = response[1] as List<Doctor>;

        emit(
          state.copyWith(
            status: HomeStatus.loaded,
            doctorCategories: categories,
            nearbyDoctors: doctors,
          ),
        );
      } catch (e) {
        emit(state.copyWith(status: HomeStatus.error));
      }
    });
  }
}
