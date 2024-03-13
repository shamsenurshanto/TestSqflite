// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'date_list.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DateListAdapter extends TypeAdapter<DateList> {
  @override
  final int typeId = 10;

  @override
  DateList read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DateList()
      ..employeeList = (fields[0] as List?)?.cast<dynamic>()
      ..employeeListStatus = (fields[1] as List?)?.cast<dynamic>();
  }

  @override
  void write(BinaryWriter writer, DateList obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.employeeList)
      ..writeByte(1)
      ..write(obj.employeeListStatus);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) => identical(this, other) || other is DateListAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
}
