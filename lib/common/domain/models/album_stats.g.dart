// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_stats.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// coverage:ignore-file
// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, prefer_const_constructors, lines_longer_than_80_chars, require_trailing_commas, inference_failure_on_function_invocation, unnecessary_parenthesis, unnecessary_raw_strings, unnecessary_null_checks, join_return_with_assignment, prefer_final_locals, avoid_js_rounded_ints, avoid_positional_boolean_parameters, always_specify_types

extension GetAlbumStatsCollection on Isar {
  IsarCollection<AlbumStats> get albumStats => this.collection();
}

const AlbumStatsSchema = CollectionSchema(
  name: r'AlbumStats',
  id: -482331525467739696,
  properties: {
    r'albumId': PropertySchema(id: 0, name: r'albumId', type: IsarType.string),
    r'missing': PropertySchema(id: 1, name: r'missing', type: IsarType.long),
    r'owned': PropertySchema(id: 2, name: r'owned', type: IsarType.long),
    r'ownedFoil': PropertySchema(
      id: 3,
      name: r'ownedFoil',
      type: IsarType.long,
    ),
    r'progress': PropertySchema(
      id: 4,
      name: r'progress',
      type: IsarType.double,
    ),
    r'repeated': PropertySchema(id: 5, name: r'repeated', type: IsarType.long),
    r'total': PropertySchema(id: 6, name: r'total', type: IsarType.long),
    r'totalFoil': PropertySchema(
      id: 7,
      name: r'totalFoil',
      type: IsarType.long,
    ),
    r'updatedAt': PropertySchema(
      id: 8,
      name: r'updatedAt',
      type: IsarType.dateTime,
    ),
  },

  estimateSize: _albumStatsEstimateSize,
  serialize: _albumStatsSerialize,
  deserialize: _albumStatsDeserialize,
  deserializeProp: _albumStatsDeserializeProp,
  idName: r'isarId',
  indexes: {
    r'albumId': IndexSchema(
      id: -3314078833704812111,
      name: r'albumId',
      unique: false,
      replace: false,
      properties: [
        IndexPropertySchema(
          name: r'albumId',
          type: IndexType.hash,
          caseSensitive: true,
        ),
      ],
    ),
  },
  links: {},
  embeddedSchemas: {},

  getId: _albumStatsGetId,
  getLinks: _albumStatsGetLinks,
  attach: _albumStatsAttach,
  version: '3.3.0',
);

int _albumStatsEstimateSize(
  AlbumStats object,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  var bytesCount = offsets.last;
  bytesCount += 3 + object.albumId.length * 3;
  return bytesCount;
}

void _albumStatsSerialize(
  AlbumStats object,
  IsarWriter writer,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  writer.writeString(offsets[0], object.albumId);
  writer.writeLong(offsets[1], object.missing);
  writer.writeLong(offsets[2], object.owned);
  writer.writeLong(offsets[3], object.ownedFoil);
  writer.writeDouble(offsets[4], object.progress);
  writer.writeLong(offsets[5], object.repeated);
  writer.writeLong(offsets[6], object.total);
  writer.writeLong(offsets[7], object.totalFoil);
  writer.writeDateTime(offsets[8], object.updatedAt);
}

AlbumStats _albumStatsDeserialize(
  Id id,
  IsarReader reader,
  List<int> offsets,
  Map<Type, List<int>> allOffsets,
) {
  final object = AlbumStats();
  object.albumId = reader.readString(offsets[0]);
  object.isarId = id;
  object.missing = reader.readLong(offsets[1]);
  object.owned = reader.readLong(offsets[2]);
  object.ownedFoil = reader.readLong(offsets[3]);
  object.progress = reader.readDouble(offsets[4]);
  object.repeated = reader.readLong(offsets[5]);
  object.total = reader.readLong(offsets[6]);
  object.totalFoil = reader.readLong(offsets[7]);
  object.updatedAt = reader.readDateTime(offsets[8]);
  return object;
}

P _albumStatsDeserializeProp<P>(
  IsarReader reader,
  int propertyId,
  int offset,
  Map<Type, List<int>> allOffsets,
) {
  switch (propertyId) {
    case 0:
      return (reader.readString(offset)) as P;
    case 1:
      return (reader.readLong(offset)) as P;
    case 2:
      return (reader.readLong(offset)) as P;
    case 3:
      return (reader.readLong(offset)) as P;
    case 4:
      return (reader.readDouble(offset)) as P;
    case 5:
      return (reader.readLong(offset)) as P;
    case 6:
      return (reader.readLong(offset)) as P;
    case 7:
      return (reader.readLong(offset)) as P;
    case 8:
      return (reader.readDateTime(offset)) as P;
    default:
      throw IsarError('Unknown property with id $propertyId');
  }
}

Id _albumStatsGetId(AlbumStats object) {
  return object.isarId;
}

List<IsarLinkBase<dynamic>> _albumStatsGetLinks(AlbumStats object) {
  return [];
}

void _albumStatsAttach(IsarCollection<dynamic> col, Id id, AlbumStats object) {
  object.isarId = id;
}

extension AlbumStatsQueryWhereSort
    on QueryBuilder<AlbumStats, AlbumStats, QWhere> {
  QueryBuilder<AlbumStats, AlbumStats, QAfterWhere> anyIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(const IdWhereClause.any());
    });
  }
}

extension AlbumStatsQueryWhere
    on QueryBuilder<AlbumStats, AlbumStats, QWhereClause> {
  QueryBuilder<AlbumStats, AlbumStats, QAfterWhereClause> isarIdEqualTo(
    Id isarId,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(lower: isarId, upper: isarId),
      );
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterWhereClause> isarIdNotEqualTo(
    Id isarId,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            )
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            );
      } else {
        return query
            .addWhereClause(
              IdWhereClause.greaterThan(lower: isarId, includeLower: false),
            )
            .addWhereClause(
              IdWhereClause.lessThan(upper: isarId, includeUpper: false),
            );
      }
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterWhereClause> isarIdGreaterThan(
    Id isarId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.greaterThan(lower: isarId, includeLower: include),
      );
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterWhereClause> isarIdLessThan(
    Id isarId, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.lessThan(upper: isarId, includeUpper: include),
      );
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterWhereClause> isarIdBetween(
    Id lowerIsarId,
    Id upperIsarId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IdWhereClause.between(
          lower: lowerIsarId,
          includeLower: includeLower,
          upper: upperIsarId,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterWhereClause> albumIdEqualTo(
    String albumId,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addWhereClause(
        IndexWhereClause.equalTo(indexName: r'albumId', value: [albumId]),
      );
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterWhereClause> albumIdNotEqualTo(
    String albumId,
  ) {
    return QueryBuilder.apply(this, (query) {
      if (query.whereSort == Sort.asc) {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'albumId',
                lower: [],
                upper: [albumId],
                includeUpper: false,
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'albumId',
                lower: [albumId],
                includeLower: false,
                upper: [],
              ),
            );
      } else {
        return query
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'albumId',
                lower: [albumId],
                includeLower: false,
                upper: [],
              ),
            )
            .addWhereClause(
              IndexWhereClause.between(
                indexName: r'albumId',
                lower: [],
                upper: [albumId],
                includeUpper: false,
              ),
            );
      }
    });
  }
}

extension AlbumStatsQueryFilter
    on QueryBuilder<AlbumStats, AlbumStats, QFilterCondition> {
  QueryBuilder<AlbumStats, AlbumStats, QAfterFilterCondition> albumIdEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'albumId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterFilterCondition>
  albumIdGreaterThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'albumId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterFilterCondition> albumIdLessThan(
    String value, {
    bool include = false,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'albumId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterFilterCondition> albumIdBetween(
    String lower,
    String upper, {
    bool includeLower = true,
    bool includeUpper = true,
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'albumId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterFilterCondition> albumIdStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.startsWith(
          property: r'albumId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterFilterCondition> albumIdEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.endsWith(
          property: r'albumId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterFilterCondition> albumIdContains(
    String value, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.contains(
          property: r'albumId',
          value: value,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterFilterCondition> albumIdMatches(
    String pattern, {
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.matches(
          property: r'albumId',
          wildcard: pattern,
          caseSensitive: caseSensitive,
        ),
      );
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterFilterCondition> albumIdIsEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'albumId', value: ''),
      );
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterFilterCondition>
  albumIdIsNotEmpty() {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(property: r'albumId', value: ''),
      );
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterFilterCondition> isarIdEqualTo(
    Id value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'isarId', value: value),
      );
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterFilterCondition> isarIdGreaterThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'isarId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterFilterCondition> isarIdLessThan(
    Id value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'isarId',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterFilterCondition> isarIdBetween(
    Id lower,
    Id upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'isarId',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterFilterCondition> missingEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'missing', value: value),
      );
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterFilterCondition>
  missingGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'missing',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterFilterCondition> missingLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'missing',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterFilterCondition> missingBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'missing',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterFilterCondition> ownedEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'owned', value: value),
      );
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterFilterCondition> ownedGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'owned',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterFilterCondition> ownedLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'owned',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterFilterCondition> ownedBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'owned',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterFilterCondition> ownedFoilEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'ownedFoil', value: value),
      );
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterFilterCondition>
  ownedFoilGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'ownedFoil',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterFilterCondition> ownedFoilLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'ownedFoil',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterFilterCondition> ownedFoilBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'ownedFoil',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterFilterCondition> progressEqualTo(
    double value, {
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(
          property: r'progress',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterFilterCondition>
  progressGreaterThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'progress',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterFilterCondition> progressLessThan(
    double value, {
    bool include = false,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'progress',
          value: value,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterFilterCondition> progressBetween(
    double lower,
    double upper, {
    bool includeLower = true,
    bool includeUpper = true,
    double epsilon = Query.epsilon,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'progress',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,

          epsilon: epsilon,
        ),
      );
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterFilterCondition> repeatedEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'repeated', value: value),
      );
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterFilterCondition>
  repeatedGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'repeated',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterFilterCondition> repeatedLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'repeated',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterFilterCondition> repeatedBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'repeated',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterFilterCondition> totalEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'total', value: value),
      );
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterFilterCondition> totalGreaterThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'total',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterFilterCondition> totalLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'total',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterFilterCondition> totalBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'total',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterFilterCondition> totalFoilEqualTo(
    int value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'totalFoil', value: value),
      );
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterFilterCondition>
  totalFoilGreaterThan(int value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'totalFoil',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterFilterCondition> totalFoilLessThan(
    int value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'totalFoil',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterFilterCondition> totalFoilBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'totalFoil',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterFilterCondition> updatedAtEqualTo(
    DateTime value,
  ) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.equalTo(property: r'updatedAt', value: value),
      );
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterFilterCondition>
  updatedAtGreaterThan(DateTime value, {bool include = false}) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.greaterThan(
          include: include,
          property: r'updatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterFilterCondition> updatedAtLessThan(
    DateTime value, {
    bool include = false,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.lessThan(
          include: include,
          property: r'updatedAt',
          value: value,
        ),
      );
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterFilterCondition> updatedAtBetween(
    DateTime lower,
    DateTime upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addFilterCondition(
        FilterCondition.between(
          property: r'updatedAt',
          lower: lower,
          includeLower: includeLower,
          upper: upper,
          includeUpper: includeUpper,
        ),
      );
    });
  }
}

extension AlbumStatsQueryObject
    on QueryBuilder<AlbumStats, AlbumStats, QFilterCondition> {}

extension AlbumStatsQueryLinks
    on QueryBuilder<AlbumStats, AlbumStats, QFilterCondition> {}

extension AlbumStatsQuerySortBy
    on QueryBuilder<AlbumStats, AlbumStats, QSortBy> {
  QueryBuilder<AlbumStats, AlbumStats, QAfterSortBy> sortByAlbumId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'albumId', Sort.asc);
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterSortBy> sortByAlbumIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'albumId', Sort.desc);
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterSortBy> sortByMissing() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'missing', Sort.asc);
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterSortBy> sortByMissingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'missing', Sort.desc);
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterSortBy> sortByOwned() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'owned', Sort.asc);
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterSortBy> sortByOwnedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'owned', Sort.desc);
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterSortBy> sortByOwnedFoil() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownedFoil', Sort.asc);
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterSortBy> sortByOwnedFoilDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownedFoil', Sort.desc);
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterSortBy> sortByProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progress', Sort.asc);
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterSortBy> sortByProgressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progress', Sort.desc);
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterSortBy> sortByRepeated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repeated', Sort.asc);
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterSortBy> sortByRepeatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repeated', Sort.desc);
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterSortBy> sortByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.asc);
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterSortBy> sortByTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.desc);
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterSortBy> sortByTotalFoil() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalFoil', Sort.asc);
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterSortBy> sortByTotalFoilDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalFoil', Sort.desc);
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterSortBy> sortByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterSortBy> sortByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension AlbumStatsQuerySortThenBy
    on QueryBuilder<AlbumStats, AlbumStats, QSortThenBy> {
  QueryBuilder<AlbumStats, AlbumStats, QAfterSortBy> thenByAlbumId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'albumId', Sort.asc);
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterSortBy> thenByAlbumIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'albumId', Sort.desc);
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterSortBy> thenByIsarId() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.asc);
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterSortBy> thenByIsarIdDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'isarId', Sort.desc);
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterSortBy> thenByMissing() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'missing', Sort.asc);
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterSortBy> thenByMissingDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'missing', Sort.desc);
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterSortBy> thenByOwned() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'owned', Sort.asc);
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterSortBy> thenByOwnedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'owned', Sort.desc);
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterSortBy> thenByOwnedFoil() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownedFoil', Sort.asc);
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterSortBy> thenByOwnedFoilDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'ownedFoil', Sort.desc);
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterSortBy> thenByProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progress', Sort.asc);
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterSortBy> thenByProgressDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'progress', Sort.desc);
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterSortBy> thenByRepeated() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repeated', Sort.asc);
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterSortBy> thenByRepeatedDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'repeated', Sort.desc);
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterSortBy> thenByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.asc);
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterSortBy> thenByTotalDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'total', Sort.desc);
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterSortBy> thenByTotalFoil() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalFoil', Sort.asc);
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterSortBy> thenByTotalFoilDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'totalFoil', Sort.desc);
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterSortBy> thenByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.asc);
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QAfterSortBy> thenByUpdatedAtDesc() {
    return QueryBuilder.apply(this, (query) {
      return query.addSortBy(r'updatedAt', Sort.desc);
    });
  }
}

extension AlbumStatsQueryWhereDistinct
    on QueryBuilder<AlbumStats, AlbumStats, QDistinct> {
  QueryBuilder<AlbumStats, AlbumStats, QDistinct> distinctByAlbumId({
    bool caseSensitive = true,
  }) {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'albumId', caseSensitive: caseSensitive);
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QDistinct> distinctByMissing() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'missing');
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QDistinct> distinctByOwned() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'owned');
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QDistinct> distinctByOwnedFoil() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'ownedFoil');
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QDistinct> distinctByProgress() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'progress');
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QDistinct> distinctByRepeated() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'repeated');
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QDistinct> distinctByTotal() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'total');
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QDistinct> distinctByTotalFoil() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'totalFoil');
    });
  }

  QueryBuilder<AlbumStats, AlbumStats, QDistinct> distinctByUpdatedAt() {
    return QueryBuilder.apply(this, (query) {
      return query.addDistinctBy(r'updatedAt');
    });
  }
}

extension AlbumStatsQueryProperty
    on QueryBuilder<AlbumStats, AlbumStats, QQueryProperty> {
  QueryBuilder<AlbumStats, int, QQueryOperations> isarIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'isarId');
    });
  }

  QueryBuilder<AlbumStats, String, QQueryOperations> albumIdProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'albumId');
    });
  }

  QueryBuilder<AlbumStats, int, QQueryOperations> missingProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'missing');
    });
  }

  QueryBuilder<AlbumStats, int, QQueryOperations> ownedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'owned');
    });
  }

  QueryBuilder<AlbumStats, int, QQueryOperations> ownedFoilProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'ownedFoil');
    });
  }

  QueryBuilder<AlbumStats, double, QQueryOperations> progressProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'progress');
    });
  }

  QueryBuilder<AlbumStats, int, QQueryOperations> repeatedProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'repeated');
    });
  }

  QueryBuilder<AlbumStats, int, QQueryOperations> totalProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'total');
    });
  }

  QueryBuilder<AlbumStats, int, QQueryOperations> totalFoilProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'totalFoil');
    });
  }

  QueryBuilder<AlbumStats, DateTime, QQueryOperations> updatedAtProperty() {
    return QueryBuilder.apply(this, (query) {
      return query.addPropertyName(r'updatedAt');
    });
  }
}
