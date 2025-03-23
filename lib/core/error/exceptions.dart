import 'package:freezed_annotation/freezed_annotation.dart';

part 'exceptions.freezed.dart';

@freezed
sealed class AppException with _$AppException {
  const factory AppException.server(String message) = ServerException;
  const factory AppException.cache(String message) = CacheException;
  const factory AppException.network(String message) = NetworkException;
  const factory AppException.auth(String message) = AuthException;
  const factory AppException.validation(String message) = ValidationException;
  const factory AppException.storage(String message) = StorageException;
}
