import 'package:dartz/dartz.dart';
import 'package:demo/core/errors/failure.dart';
import 'package:demo/features/student_feature/domain/entities/student_entity.dart';
import 'package:demo/features/student_feature/domain/repos/student_repo.dart';

class AddStudentUseCase {
  final StudentRepository repository;

  AddStudentUseCase(this.repository);

  Future<Either<Failure, void>> call(StudentEntity student) async {
    return await repository.addStudent(student);
  }
}
