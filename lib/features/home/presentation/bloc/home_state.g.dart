// GENERATED CODE - DO NOT MODIFY BY HAND

part of home_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$HomeState extends HomeState {
  @override
  final List<Todo> todos;
  @override
  final bool isAddSuccess;
  @override
  final bool isLoading;
  @override
  final bool success;
  @override
  final String error;

  factory _$HomeState([void Function(HomeStateBuilder) updates]) =>
      (new HomeStateBuilder()..update(updates)).build();

  _$HomeState._(
      {this.todos, this.isAddSuccess, this.isLoading, this.success, this.error})
      : super._() {
    if (isAddSuccess == null) {
      throw new BuiltValueNullFieldError('HomeState', 'isAddSuccess');
    }
    if (isLoading == null) {
      throw new BuiltValueNullFieldError('HomeState', 'isLoading');
    }
    if (success == null) {
      throw new BuiltValueNullFieldError('HomeState', 'success');
    }
    if (error == null) {
      throw new BuiltValueNullFieldError('HomeState', 'error');
    }
  }

  @override
  HomeState rebuild(void Function(HomeStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  HomeStateBuilder toBuilder() => new HomeStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is HomeState &&
        todos == other.todos &&
        isAddSuccess == other.isAddSuccess &&
        isLoading == other.isLoading &&
        success == other.success &&
        error == other.error;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc($jc($jc(0, todos.hashCode), isAddSuccess.hashCode),
                isLoading.hashCode),
            success.hashCode),
        error.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('HomeState')
          ..add('todos', todos)
          ..add('isAddSuccess', isAddSuccess)
          ..add('isLoading', isLoading)
          ..add('success', success)
          ..add('error', error))
        .toString();
  }
}

class HomeStateBuilder implements Builder<HomeState, HomeStateBuilder> {
  _$HomeState _$v;

  List<Todo> _todos;
  List<Todo> get todos => _$this._todos;
  set todos(List<Todo> todos) => _$this._todos = todos;

  bool _isAddSuccess;
  bool get isAddSuccess => _$this._isAddSuccess;
  set isAddSuccess(bool isAddSuccess) => _$this._isAddSuccess = isAddSuccess;

  bool _isLoading;
  bool get isLoading => _$this._isLoading;
  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  bool _success;
  bool get success => _$this._success;
  set success(bool success) => _$this._success = success;

  String _error;
  String get error => _$this._error;
  set error(String error) => _$this._error = error;

  HomeStateBuilder();

  HomeStateBuilder get _$this {
    if (_$v != null) {
      _todos = _$v.todos;
      _isAddSuccess = _$v.isAddSuccess;
      _isLoading = _$v.isLoading;
      _success = _$v.success;
      _error = _$v.error;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(HomeState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$HomeState;
  }

  @override
  void update(void Function(HomeStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$HomeState build() {
    final _$result = _$v ??
        new _$HomeState._(
            todos: todos,
            isAddSuccess: isAddSuccess,
            isLoading: isLoading,
            success: success,
            error: error);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
