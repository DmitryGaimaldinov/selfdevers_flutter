// import 'package:dio/dio.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:selfdevers/feed/note.dart';
// import 'package:selfdevers/search/search_notes_state.dart';
//
//
// // TODO: Сделать отдельный класс, который будет просто кэнселить
// // токен при новом запросе
//
// class AutocancellableCallWrapper<Result> {
//   CancelToken? _cancelToken;
//
//   Future<dynamic> call({
//     required Future<Result> Function(CancelToken cancelToken) requestCall,
//     required void Function(Result result) onSuccess,
//     required void Function(DioError e) onError,
//   }) async {
//     _cancelToken?.cancel();
//
//     try {
//       final result = await requestCall();
//       onSuccess(result);
//     } on DioError catch (e) {
//       onError(e);
//       // А тут как ошибки обрабатывать?
//     } finally {
//       _cancelToken = null;
//     }
//   }
// }
//
// class SearchPostsNotifier extends StateNotifier<SearchNotesState> {
//   String _query = '';
//   CancelToken? _cancelToken;
//   final List<Note> _notes = [];
//   final call = AutocancellableCallWrapper();
//
//   SearchPostsNotifier() : super(SearchNotesState.loading());
//
//   Future<void> searchIfNeeded(String query) async {
//     query = query.trim();
//     if (query != _query) {
//       _query = query;
//       _cancelToken?.cancel();
//       try {
//         // _cancelToken = await _search(query);
//       } on DioError catch (e) {
//
//       } finally {
//         _cancelToken = null;
//       }
//     }
//   }
//
//   @protected
//   Future<void> _search(String query) async {
//     await call(
//         requestCall: ,
//         onError: (DioError e)
//     );
//
//     // TODO: Проверять state на то, что оно SearchPostsState.loaded
//     // state.when(loaded: )
//     // if (state.)
//     // state = SearchNotesState.loaded(
//     //   isLoadingMore: true,
//     // );
//     // // Api.searchPosts();
//     // state = SearchNotesState.loaded(
//     //   isLoadingMore: false,
//     // )
//     // _cancelToken = null;
//   }
// }
