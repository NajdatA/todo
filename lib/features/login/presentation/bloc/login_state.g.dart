// GENERATED CODE - DO NOT MODIFY BY HAND

part of login_state;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

class _$LoginState extends LoginState {
  @override
  final bool isLoading;
  @override
  final bool success;
  @override
  final String error;
  @override
  final bool fail;

  factory _$LoginState([void Function(LoginStateBuilder) updates]) =>
      (new LoginStateBuilder()..update(updates)).build();

  _$LoginState._({this.isLoading, this.success, this.error, this.fail})
      : super._() {
    if (isLoading == null) {
      throw new BuiltValueNullFieldError('LoginState', 'isLoading');
    }
    if (success == null) {
      throw new BuiltValueNullFieldError('LoginState', 'success');
    }
    if (error == null) {
      throw new BuiltValueNullFieldError('LoginState', 'error');
    }
    if (fail == null) {
      throw new BuiltValueNullFieldError('LoginState', 'fail');
    }
  }

  @override
  LoginState rebuild(void Function(LoginStateBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  LoginStateBuilder toBuilder() => new LoginStateBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is LoginState &&
        isLoading == other.isLoading &&
        success == other.success &&
        error == other.error &&
        fail == other.fail;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, isLoading.hashCode), success.hashCode), error.hashCode),
        fail.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('LoginState')
          ..add('isLoading', isLoading)
          ..add('success', success)
          ..add('error', error)
          ..add('fail', fail))
        .toString();
  }
}

class LoginStateBuilder implements Builder<LoginState, LoginStateBuilder> {
  _$LoginState _$v;

  bool _isLoading;
  bool get isLoading => _$this._isLoading;
  set isLoading(bool isLoading) => _$this._isLoading = isLoading;

  bool _success;
  bool get success => _$this._success;
  set success(bool success) => _$this._success = success;

  String _error;
  String get error => _$this._error;
  set error(String error) => _$this._error = error;

  bool _fail;
  bool get fail => _$this._fail;
  set fail(bool fail) => _$this._fail = fail;

  LoginStateBuilder();

  LoginStateBuilder get _$this {
    if (_$v != null) {
      _isLoading = _$v.isLoading;
      _success = _$v.success;
      _error = _$v.error;
      _fail = _$v.fail;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(LoginState other) {
    if (other == null) {
      throw new ArgumentError.notNull('other');
    }
    _$v = other as _$LoginState;
  }

  @override
  void update(void Function(LoginStateBuilder) updates) {
    if (updates != null) updates(this);
  }

  @override
  _$LoginState build() {
    final _$result = _$v ??
        new _$LoginState._(
            isLoading: isLoading, success: success, error: error, fail: fail);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
