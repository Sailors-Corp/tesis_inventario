// import 'package:apk_dispensarizacion/src/core/assets/assets.gen.dart';
// import 'package:apk_dispensarizacion/src/core/utils/date_time_utils.dart';
// import 'package:apk_dispensarizacion/src/features/address/data/datasources/local/daos/provinces_dao.dart';
// import 'package:apk_dispensarizacion/src/features/address/data/datasources/local/entities/between_streets.dart';
// import 'package:apk_dispensarizacion/src/features/address/data/datasources/local/entities/entities.dart';
// import 'package:apk_dispensarizacion/src/features/address/data/datasources/local/entities/home_addresses.dart';
// import 'package:apk_dispensarizacion/src/features/address/data/datasources/local/entities/streets.dart';
// import 'package:apk_dispensarizacion/src/features/citizen/citizen.dart';
// import 'package:apk_dispensarizacion/src/features/family_health_record/data/datasources/local/daos/family_health_record_dao.dart';
// import 'package:apk_dispensarizacion/src/features/family_health_record/data/datasources/local/entities/family_health_records.dart';
// import 'package:apk_dispensarizacion/src/features/family_health_record/domain/enums/enums.dart';
// import 'package:apk_dispensarizacion/src/features/frontal_sheet/data/datasources/local/daos/frontal_sheets_dao.dart';
// import 'package:apk_dispensarizacion/src/features/frontal_sheet/data/datasources/local/daos/occupations_dao.dart';
// import 'package:apk_dispensarizacion/src/features/frontal_sheet/data/datasources/local/entities/entities.dart';
// import 'package:apk_dispensarizacion/src/features/frontal_sheet/domain/enums/enums.dart';
// import 'package:apk_dispensarizacion/src/features/history/data/datasources/local/entities/entities.dart';
// import 'package:apk_dispensarizacion/src/features/icd/data/datasources/local/daos/daos.dart';
// import 'package:apk_dispensarizacion/src/features/icd/data/datasources/local/entities/entities.dart';
// import 'package:apk_dispensarizacion/src/features/risks/data/datasources/local/daos/daos.dart';
// import 'package:apk_dispensarizacion/src/features/risks/data/datasources/local/entities/entities.dart';
// import 'package:apk_dispensarizacion/src/features/risks/domain/enums/enums.dart';
// import 'package:apk_dispensarizacion/src/features/surgical_history/data/datasources/local/entities/entities.dart';
// import 'package:csv/csv.dart';
// import 'package:drift/drift.dart';
// import 'package:flutter/services.dart';
// import 'package:uuid/uuid.dart';

// part 'database.g.dart';

// const uuid = Uuid();

// @DriftDatabase(
//   tables: [
//     PersonalPathologicalHistories,
//     Histories,
//     Addresses,
//     Citizens,
//     FrontalSheets,
//     IcdDiagnostics,
//     IcdProcedures,
//     Occupations,
//     FamilyHealthRecords,
//     Risks,
//     RisksInFrontalSheet,
//     SurgicalHistories,
//     SurgicalInterventions,
//     Provinces,
//     Municipalities,
//     Streets,
//     BetweenStreets,
//     HomeAddresses,
//   ],
//   daos: [
//     CitizensDao,
//     FamilyHealthRecordDao,
//     FrontalSheetsDao,
//     IcdDiagnosticsDao,
//     IcdProceduresDao,
//     OccupationsDao,
//     RisksDao,
//     RisksInFrontalSheetDao,
//     ProvincesDao,
//   ],
// )

// class SharedDatabase extends _$SharedDatabase {
//   SharedDatabase(super.e);

//   @override
//   int get schemaVersion => 1;

//   @override
//   MigrationStrategy get migration => MigrationStrategy(
//         onCreate: (migrator) async {
//           await migrator.createAll();
//           await _insertCitizens();
//           await _insertOccupations();
//           await _insertRisks();
//         },
//         beforeOpen: (details) async {
//           await customStatement('PRAGMA foreign_keys = ON');
//         },
//       );

//   Future<void> _insertOccupations() async {
//     final dataString = await rootBundle.loadString(Assets.csv.ocupaciones);
//     final rows = const CsvToListConverter(shouldParseNumbers: false)
//         .convert(dataString)
//         .toSet();

//     final data = <OccupationsCompanion>[];

//     for (final row in rows) {
//       final [String code, String description] = row;

//       data.add(
//         OccupationsCompanion.insert(
//           code: code,
//           description: description,
//         ),
//       );
//     }

//     await occupations.insertAll(data);
//   }



//   Future<void> _insertRisks() async {
//     final dataString =
//         await rootBundle.loadString(Assets.csv.riesgosCondiciones);
//     final fields = const CsvToListConverter().convert(dataString);

//     final risksToInsert = <RisksCompanion>[];

//     for (final field in fields) {
//       final [
//         int incideCode,
//         _,
//         String description,
//         int dispensaryGroup,
//         maleOnly,
//         femaleOnly,
//         minAge,
//         maxAge
//       ] = field;

//       risksToInsert.add(
//         RisksCompanion(
//           code: Value(incideCode.toString()),
//           description: Value(description),
//           dispensaryGroup:
//               Value(DispensaryGroup.values.elementAt(dispensaryGroup)),
//           maleOnly: Value(maleOnly.toString() == '1'),
//           femaleOnly: Value(femaleOnly.toString() == '1'),
//           minAge: Value(int.tryParse(minAge.toString())),
//           maxAge: Value(int.tryParse(maxAge.toString())),
//         ),
//       );
//     }

//     await risks.insertAll(risksToInsert);
//   }

//   Future<void> _insertCitizens() async {
//     final dataString = await rootBundle.loadString(Assets.csv.ciudadanosMock);
//     final fields =
//         const CsvToListConverter(shouldParseNumbers: false).convert(dataString);

//     final citizensToInsert = <CitizensCompanion>[];

//     for (final field in fields) {
//       final [
//         String identityCard,
//         String name,
//         String firstLastName,
//         String secondLastName,
//         String skinColor,
//         String civilStatus,
//         String sex,
//       ] = field;

//       citizensToInsert.add(
//         CitizensCompanion.insert(
//           identityCard: identityCard,
//           birthday: getBirthdayByIdentityCard(identityCard),
//           name: name,
//           firstLastName: firstLastName,
//           secondLastName: secondLastName,
//           skinColor: SkinColor.values.elementAt(int.parse(skinColor)),
//           civilStatus: CivilStatus.values.elementAt(int.parse(civilStatus)),
//           sex: Sex.values.firstWhere((e) => e.toString() == sex),
//         ),
//       );
//     }

//     await citizens.insertAll(citizensToInsert);
//   }
// }

// class FamilyHealthProblemListConverter
//     extends TypeConverter<List<FamilyHealthProblem>, String> {
//   const FamilyHealthProblemListConverter();

//   @override
//   List<FamilyHealthProblem> fromSql(String fromDb) {
//     if (fromDb.isEmpty) return [];

//     final indexes = fromDb.split('#');
//     final problems = <FamilyHealthProblem>[];
//     for (final index in indexes) {
//       final problem = FamilyHealthProblem.getByIndex(int.parse(index));
//       problems.add(problem);
//     }

//     return problems;
//   }

//   @override
//   String toSql(List<FamilyHealthProblem> value) {
//     if (value.isEmpty) return '';

//     final stringBuffer = StringBuffer()
//       ..writeAll(
//         value.map((e) => FamilyHealthProblem.values.indexOf(e)),
//         '#',
//       );

//     return stringBuffer.toString();
//   }
// }

// class FamilyInterventionMannerListConverter
//     extends TypeConverter<List<FamilyInterventionManner>, String> {
//   const FamilyInterventionMannerListConverter();

//   @override
//   List<FamilyInterventionManner> fromSql(String fromDb) {
//     if (fromDb.isEmpty) return [];

//     final indexes = fromDb.split('#');
//     final elements = <FamilyInterventionManner>[];
//     for (final index in indexes) {
//       final element =
//           FamilyInterventionManner.values.elementAt(int.parse(index));
//       elements.add(element);
//     }

//     return elements;
//   }

//   @override
//   String toSql(List<FamilyInterventionManner> value) {
//     if (value.isEmpty) return '';

//     final stringBuffer = StringBuffer()
//       ..writeAll(
//         value.map((e) => FamilyInterventionManner.values.indexOf(e)),
//         '#',
//       );

//     return stringBuffer.toString();
//   }
// }

// // class EnumListTypeConverter<T extends Enum>
// //     extends TypeConverter<List<T>, String> {
// //   const EnumListTypeConverter();

// //   @override
// //   List<T> fromSql(String fromDb) {
// //     if (fromDb.isEmpty) return [];

// //     final indexes = fromDb.split('#');
// //     final problems = <T>[];
// //     for (final index in indexes) {
// //       final problem = T.
// //       problems.add(problem);
// //     }

// //     return problems;
// //   }

// //   @override
// //   String toSql(List<T> value) {
// //     if (value.isEmpty) return '';

// //     final stringBuffer = StringBuffer()
// //       ..writeAll(
// //         value.map((e) => T.values.indexOf(e)),
// //         '#',
// //       );

// //     return stringBuffer.toString();
// //   }
// // }
