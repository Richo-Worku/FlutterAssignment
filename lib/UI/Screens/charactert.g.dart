// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'charactert.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class CharacterData extends DataClass implements Insertable<CharacterData> {
  final int firstid;
  final int id;
  final String name;
  final String gender;
  const CharacterData(
      {required this.firstid,
      required this.id,
      required this.name,
      required this.gender});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['firstid'] = Variable<int>(firstid);
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['gender'] = Variable<String>(gender);
    return map;
  }

  CharacterCompanion toCompanion(bool nullToAbsent) {
    return CharacterCompanion(
      firstid: Value(firstid),
      id: Value(id),
      name: Value(name),
      gender: Value(gender),
    );
  }

  factory CharacterData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CharacterData(
      firstid: serializer.fromJson<int>(json['firstid']),
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      gender: serializer.fromJson<String>(json['gender']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'firstid': serializer.toJson<int>(firstid),
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'gender': serializer.toJson<String>(gender),
    };
  }

  CharacterData copyWith(
          {int? firstid, int? id, String? name, String? gender}) =>
      CharacterData(
        firstid: firstid ?? this.firstid,
        id: id ?? this.id,
        name: name ?? this.name,
        gender: gender ?? this.gender,
      );
  @override
  String toString() {
    return (StringBuffer('CharacterData(')
          ..write('firstid: $firstid, ')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('gender: $gender')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(firstid, id, name, gender);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CharacterData &&
          other.firstid == this.firstid &&
          other.id == this.id &&
          other.name == this.name &&
          other.gender == this.gender);
}

class CharacterCompanion extends UpdateCompanion<CharacterData> {
  final Value<int> firstid;
  final Value<int> id;
  final Value<String> name;
  final Value<String> gender;
  const CharacterCompanion({
    this.firstid = const Value.absent(),
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.gender = const Value.absent(),
  });
  CharacterCompanion.insert({
    this.firstid = const Value.absent(),
    required int id,
    required String name,
    required String gender,
  })  : id = Value(id),
        name = Value(name),
        gender = Value(gender);
  static Insertable<CharacterData> custom({
    Expression<int>? firstid,
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? gender,
  }) {
    return RawValuesInsertable({
      if (firstid != null) 'firstid': firstid,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (gender != null) 'gender': gender,
    });
  }

  CharacterCompanion copyWith(
      {Value<int>? firstid,
      Value<int>? id,
      Value<String>? name,
      Value<String>? gender}) {
    return CharacterCompanion(
      firstid: firstid ?? this.firstid,
      id: id ?? this.id,
      name: name ?? this.name,
      gender: gender ?? this.gender,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (firstid.present) {
      map['firstid'] = Variable<int>(firstid.value);
    }
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (gender.present) {
      map['gender'] = Variable<String>(gender.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CharacterCompanion(')
          ..write('firstid: $firstid, ')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('gender: $gender')
          ..write(')'))
        .toString();
  }
}

class Character extends Table with TableInfo<Character, CharacterData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Character(this.attachedDatabase, [this._alias]);
  final VerificationMeta _firstidMeta = const VerificationMeta('firstid');
  late final GeneratedColumn<int> firstid = GeneratedColumn<int>(
      'firstid', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      $customConstraints: 'NOT NULL PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _idMeta = const VerificationMeta('id');
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _nameMeta = const VerificationMeta('name');
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  final VerificationMeta _genderMeta = const VerificationMeta('gender');
  late final GeneratedColumn<String> gender = GeneratedColumn<String>(
      'gender', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [firstid, id, name, gender];
  @override
  String get aliasedName => _alias ?? 'Character';
  @override
  String get actualTableName => 'Character';
  @override
  VerificationContext validateIntegrity(Insertable<CharacterData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('firstid')) {
      context.handle(_firstidMeta,
          firstid.isAcceptableOrUnknown(data['firstid']!, _firstidMeta));
    }
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('gender')) {
      context.handle(_genderMeta,
          gender.isAcceptableOrUnknown(data['gender']!, _genderMeta));
    } else if (isInserting) {
      context.missing(_genderMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {firstid};
  @override
  CharacterData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CharacterData(
      firstid: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}firstid'])!,
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      gender: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}gender'])!,
    );
  }

  @override
  Character createAlias(String alias) {
    return Character(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  late final Character character = Character(this);
  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [character];
}
