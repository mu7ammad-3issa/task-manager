// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tasks_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TasksState<T> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TasksState<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TasksState<$T>()';
}


}

/// @nodoc
class $TasksStateCopyWith<T,$Res>  {
$TasksStateCopyWith(TasksState<T> _, $Res Function(TasksState<T>) __);
}


/// Adds pattern-matching-related methods to [TasksState].
extension TasksStatePatterns<T> on TasksState<T> {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _TasksInitial<T> value)?  tasksInitial,TResult Function( TasksLoading<T> value)?  tasksLoading,TResult Function( TasksSuccess<T> value)?  tasksSuccess,TResult Function( TasksError<T> value)?  tasksError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TasksInitial() when tasksInitial != null:
return tasksInitial(_that);case TasksLoading() when tasksLoading != null:
return tasksLoading(_that);case TasksSuccess() when tasksSuccess != null:
return tasksSuccess(_that);case TasksError() when tasksError != null:
return tasksError(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _TasksInitial<T> value)  tasksInitial,required TResult Function( TasksLoading<T> value)  tasksLoading,required TResult Function( TasksSuccess<T> value)  tasksSuccess,required TResult Function( TasksError<T> value)  tasksError,}){
final _that = this;
switch (_that) {
case _TasksInitial():
return tasksInitial(_that);case TasksLoading():
return tasksLoading(_that);case TasksSuccess():
return tasksSuccess(_that);case TasksError():
return tasksError(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _TasksInitial<T> value)?  tasksInitial,TResult? Function( TasksLoading<T> value)?  tasksLoading,TResult? Function( TasksSuccess<T> value)?  tasksSuccess,TResult? Function( TasksError<T> value)?  tasksError,}){
final _that = this;
switch (_that) {
case _TasksInitial() when tasksInitial != null:
return tasksInitial(_that);case TasksLoading() when tasksLoading != null:
return tasksLoading(_that);case TasksSuccess() when tasksSuccess != null:
return tasksSuccess(_that);case TasksError() when tasksError != null:
return tasksError(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  tasksInitial,TResult Function()?  tasksLoading,TResult Function( List<TaskModel> allTasks,  List<CategoryModel> categories)?  tasksSuccess,TResult Function( String error)?  tasksError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TasksInitial() when tasksInitial != null:
return tasksInitial();case TasksLoading() when tasksLoading != null:
return tasksLoading();case TasksSuccess() when tasksSuccess != null:
return tasksSuccess(_that.allTasks,_that.categories);case TasksError() when tasksError != null:
return tasksError(_that.error);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  tasksInitial,required TResult Function()  tasksLoading,required TResult Function( List<TaskModel> allTasks,  List<CategoryModel> categories)  tasksSuccess,required TResult Function( String error)  tasksError,}) {final _that = this;
switch (_that) {
case _TasksInitial():
return tasksInitial();case TasksLoading():
return tasksLoading();case TasksSuccess():
return tasksSuccess(_that.allTasks,_that.categories);case TasksError():
return tasksError(_that.error);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  tasksInitial,TResult? Function()?  tasksLoading,TResult? Function( List<TaskModel> allTasks,  List<CategoryModel> categories)?  tasksSuccess,TResult? Function( String error)?  tasksError,}) {final _that = this;
switch (_that) {
case _TasksInitial() when tasksInitial != null:
return tasksInitial();case TasksLoading() when tasksLoading != null:
return tasksLoading();case TasksSuccess() when tasksSuccess != null:
return tasksSuccess(_that.allTasks,_that.categories);case TasksError() when tasksError != null:
return tasksError(_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _TasksInitial<T> implements TasksState<T> {
  const _TasksInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TasksInitial<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TasksState<$T>.tasksInitial()';
}


}




/// @nodoc


class TasksLoading<T> implements TasksState<T> {
  const TasksLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TasksLoading<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TasksState<$T>.tasksLoading()';
}


}




/// @nodoc


class TasksSuccess<T> implements TasksState<T> {
  const TasksSuccess(final  List<TaskModel> allTasks, final  List<CategoryModel> categories): _allTasks = allTasks,_categories = categories;
  

 final  List<TaskModel> _allTasks;
 List<TaskModel> get allTasks {
  if (_allTasks is EqualUnmodifiableListView) return _allTasks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_allTasks);
}

 final  List<CategoryModel> _categories;
 List<CategoryModel> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}


/// Create a copy of TasksState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TasksSuccessCopyWith<T, TasksSuccess<T>> get copyWith => _$TasksSuccessCopyWithImpl<T, TasksSuccess<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TasksSuccess<T>&&const DeepCollectionEquality().equals(other._allTasks, _allTasks)&&const DeepCollectionEquality().equals(other._categories, _categories));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_allTasks),const DeepCollectionEquality().hash(_categories));

@override
String toString() {
  return 'TasksState<$T>.tasksSuccess(allTasks: $allTasks, categories: $categories)';
}


}

/// @nodoc
abstract mixin class $TasksSuccessCopyWith<T,$Res> implements $TasksStateCopyWith<T, $Res> {
  factory $TasksSuccessCopyWith(TasksSuccess<T> value, $Res Function(TasksSuccess<T>) _then) = _$TasksSuccessCopyWithImpl;
@useResult
$Res call({
 List<TaskModel> allTasks, List<CategoryModel> categories
});




}
/// @nodoc
class _$TasksSuccessCopyWithImpl<T,$Res>
    implements $TasksSuccessCopyWith<T, $Res> {
  _$TasksSuccessCopyWithImpl(this._self, this._then);

  final TasksSuccess<T> _self;
  final $Res Function(TasksSuccess<T>) _then;

/// Create a copy of TasksState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? allTasks = null,Object? categories = null,}) {
  return _then(TasksSuccess<T>(
null == allTasks ? _self._allTasks : allTasks // ignore: cast_nullable_to_non_nullable
as List<TaskModel>,null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<CategoryModel>,
  ));
}


}

/// @nodoc


class TasksError<T> implements TasksState<T> {
  const TasksError(this.error);
  

 final  String error;

/// Create a copy of TasksState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TasksErrorCopyWith<T, TasksError<T>> get copyWith => _$TasksErrorCopyWithImpl<T, TasksError<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TasksError<T>&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'TasksState<$T>.tasksError(error: $error)';
}


}

/// @nodoc
abstract mixin class $TasksErrorCopyWith<T,$Res> implements $TasksStateCopyWith<T, $Res> {
  factory $TasksErrorCopyWith(TasksError<T> value, $Res Function(TasksError<T>) _then) = _$TasksErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class _$TasksErrorCopyWithImpl<T,$Res>
    implements $TasksErrorCopyWith<T, $Res> {
  _$TasksErrorCopyWithImpl(this._self, this._then);

  final TasksError<T> _self;
  final $Res Function(TasksError<T>) _then;

/// Create a copy of TasksState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(TasksError<T>(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
