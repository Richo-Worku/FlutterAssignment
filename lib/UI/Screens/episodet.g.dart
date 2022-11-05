// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'episodet.dart';

// **************************************************************************
// DriftDatabaseGenerator
// **************************************************************************

// ignore_for_file: type=lint
class EpisodeData extends DataClass implements Insertable<EpisodeData> {
  final int firstid;
  final int id;
  final String name;
  final String episode;
  const EpisodeData(
      {required this.firstid,
      required this.id,
      required this.name,
      required this.episode});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['firstid'] = Variable<int>(firstid);
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['episode'] = Variable<String>(episode);
    return map;
  }

  EpisodeCompanion toCompanion(bool nullToAbsent) {
    return EpisodeCompanion(
      firstid: Value(firstid),
      id: Value(id),
      name: Value(name),
      episode: Value(episode),
    );
  }

  factory EpisodeData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return EpisodeData(
      firstid: serializer.fromJson<int>(json['firstid']),
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      episode: serializer.fromJson<String>(json['episode']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'firstid': serializer.toJson<int>(firstid),
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'episode': serializer.toJson<String>(episode),
    };
  }

  EpisodeData copyWith(
          {int? firstid, int? id, String? name, String? episode}) =>
      EpisodeData(
        firstid: firstid ?? this.firstid,
        id: id ?? this.id,
        name: name ?? this.name,
        episode: episode ?? this.episode,
      );
  @override
  String toString() {
    return (StringBuffer('EpisodeData(')
          ..write('firstid: $firstid, ')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('episode: $episode')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(firstid, id, name, episode);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is EpisodeData &&
          other.firstid == this.firstid &&
          other.id == this.id &&
          other.name == this.name &&
          other.episode == this.episode);
}

class EpisodeCompanion extends UpdateCompanion<EpisodeData> {
  final Value<int> firstid;
  final Value<int> id;
  final Value<String> name;
  final Value<String> episode;
  const EpisodeCompanion({
    this.firstid = const Value.absent(),
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.episode = const Value.absent(),
  });
  EpisodeCompanion.insert({
    this.firstid = const Value.absent(),
    required int id,
    required String name,
    required String episode,
  })  : id = Value(id),
        name = Value(name),
        episode = Value(episode);
  static Insertable<EpisodeData> custom({
    Expression<int>? firstid,
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? episode,
  }) {
    return RawValuesInsertable({
      if (firstid != null) 'firstid': firstid,
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (episode != null) 'episode': episode,
    });
  }

  EpisodeCompanion copyWith(
      {Value<int>? firstid,
      Value<int>? id,
      Value<String>? name,
      Value<String>? episode}) {
    return EpisodeCompanion(
      firstid: firstid ?? this.firstid,
      id: id ?? this.id,
      name: name ?? this.name,
      episode: episode ?? this.episode,
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
    if (episode.present) {
      map['episode'] = Variable<String>(episode.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('EpisodeCompanion(')
          ..write('firstid: $firstid, ')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('episode: $episode')
          ..write(')'))
        .toString();
  }
}

class Episode extends Table with TableInfo<Episode, EpisodeData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  Episode(this.attachedDatabase, [this._alias]);
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
  final VerificationMeta _episodeMeta = const VerificationMeta('episode');
  late final GeneratedColumn<String> episode = GeneratedColumn<String>(
      'episode', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      $customConstraints: 'NOT NULL');
  @override
  List<GeneratedColumn> get $columns => [firstid, id, name, episode];
  @override
  String get aliasedName => _alias ?? 'episode';
  @override
  String get actualTableName => 'episode';
  @override
  VerificationContext validateIntegrity(Insertable<EpisodeData> instance,
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
    if (data.containsKey('episode')) {
      context.handle(_episodeMeta,
          episode.isAcceptableOrUnknown(data['episode']!, _episodeMeta));
    } else if (isInserting) {
      context.missing(_episodeMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {firstid};
  @override
  EpisodeData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return EpisodeData(
      firstid: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}firstid'])!,
      id: attachedDatabase.options.types
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      episode: attachedDatabase.options.types
          .read(DriftSqlType.string, data['${effectivePrefix}episode'])!,
    );
  }

  @override
  Episode createAlias(String alias) {
    return Episode(attachedDatabase, alias);
  }

  @override
  bool get dontWriteConstraints => true;
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(e);
  late final Episode episode = Episode(this);
  @override
  Iterable<TableInfo<Table, dynamic>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [episode];
}
