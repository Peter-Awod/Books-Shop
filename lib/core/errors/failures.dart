import 'package:dio/dio.dart';

abstract class Failure {
  final String errorMessage;

  const Failure(this.errorMessage);
}

class ServerFailure extends Failure {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
        // TODO: Handle this case.
        return ServerFailure('Connection timeout with API server');
      case DioExceptionType.sendTimeout:
        // TODO: Handle this case.
        return ServerFailure('Send timeout with API server');
      case DioExceptionType.receiveTimeout:
        // TODO: Handle this case.
        return ServerFailure('Receive timeout with API server');
      case DioExceptionType.badCertificate:
        // TODO: Handle this case.
        return ServerFailure('Bad certificate, Please try later!');
      case DioExceptionType.badResponse:
        // TODO: Handle this case.
        return ServerFailure.fromResponse(
            dioException.response!.statusCode, dioException.response!.data);
      case DioExceptionType.cancel:
        // TODO: Handle this case.
        return ServerFailure('Request to API server was canceled');
      case DioExceptionType.connectionError:
        // TODO: Handle this case.
        return ServerFailure('Oops bad internet connection, Please try again');
      case DioExceptionType.unknown:
        if (dioException.message!.contains('SocketException')) {
          return ServerFailure('No internet connection, Please try again');
        }
        return ServerFailure('Unexpected error, Please try again');
      // TODO: Handle this case.
      default:
        return ServerFailure('Oops there was an error, Please try again');
    }
  }

  factory ServerFailure.fromResponse(int? statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      return ServerFailure(response['error']['message']);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found, Please try later!');
    } else if (statusCode == 500) {
      return ServerFailure('Internal server error, Please try later!');
    } else {
      return ServerFailure('Oops there was an error, Please try again');
    }
  }
}
