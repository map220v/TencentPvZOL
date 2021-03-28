package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_ItemInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_ItemInfo";
      
      public static const UID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_ItemInfo.Uid","uid",1 << 3 | WireType.VARINT);
      
      public static const ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ItemInfo.id","id",2 << 3 | WireType.VARINT);
      
      public static const NUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_ItemInfo.num","num",3 << 3 | WireType.VARINT);
      
      public static const EQUIP:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_ItemInfo.equip","equip",4 << 3 | WireType.LENGTH_DELIMITED,Dto_EquipInfo);
      
      public static const TABLEINFO:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_ItemInfo.tableInfo","tableInfo",5 << 3 | WireType.LENGTH_DELIMITED,Dto_ItemTableInfo);
       
      
      private var Uid$field:Int64;
      
      private var id$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var num$field:uint;
      
      private var equip$field:Dto_EquipInfo;
      
      private var tableInfo$field:Dto_ItemTableInfo;
      
      public function Dto_ItemInfo()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_ItemInfo.$MessageID;
      }
      
      public function clearUid() : void
      {
         this.Uid$field = null;
      }
      
      public function get hasUid() : Boolean
      {
         return this.Uid$field != null;
      }
      
      public function set uid(param1:Int64) : void
      {
         this.Uid$field = param1;
      }
      
      public function get uid() : Int64
      {
         return this.Uid$field;
      }
      
      public function clearId() : void
      {
         this.hasField$0 &= 4294967294;
         this.id$field = new uint();
      }
      
      public function get hasId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set id(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.id$field = param1;
      }
      
      public function get id() : uint
      {
         return this.id$field;
      }
      
      public function clearNum() : void
      {
         this.hasField$0 &= 4294967293;
         this.num$field = new uint();
      }
      
      public function get hasNum() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set num(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.num$field = param1;
      }
      
      public function get num() : uint
      {
         return this.num$field;
      }
      
      public function clearEquip() : void
      {
         this.equip$field = null;
      }
      
      public function get hasEquip() : Boolean
      {
         return this.equip$field != null;
      }
      
      public function set equip(param1:Dto_EquipInfo) : void
      {
         this.equip$field = param1;
      }
      
      public function get equip() : Dto_EquipInfo
      {
         return this.equip$field;
      }
      
      public function clearTableInfo() : void
      {
         this.tableInfo$field = null;
      }
      
      public function get hasTableInfo() : Boolean
      {
         return this.tableInfo$field != null;
      }
      
      public function set tableInfo(param1:Dto_ItemTableInfo) : void
      {
         this.tableInfo$field = param1;
      }
      
      public function get tableInfo() : Dto_ItemTableInfo
      {
         return this.tableInfo$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasUid)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT64(param1,this.Uid$field);
         }
         if(this.hasId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.id$field);
         }
         if(this.hasNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.num$field);
         }
         if(this.hasEquip)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.equip$field);
         }
         if(this.hasTableInfo)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,5);
            WriteUtils.write$TYPE_MESSAGE(param1,this.tableInfo$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc8_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc8_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc8_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ItemInfo.uid cannot be set twice.");
                  }
                  _loc3_++;
                  this.uid = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ItemInfo.id cannot be set twice.");
                  }
                  _loc4_++;
                  this.id = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ItemInfo.num cannot be set twice.");
                  }
                  _loc5_++;
                  this.num = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ItemInfo.equip cannot be set twice.");
                  }
                  _loc6_++;
                  this.equip = new Dto_EquipInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.equip);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_ItemInfo.tableInfo cannot be set twice.");
                  }
                  _loc7_++;
                  this.tableInfo = new Dto_ItemTableInfo();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.tableInfo);
                  break;
               default:
                  super.readUnknown(param1,_loc8_);
                  break;
            }
         }
      }
   }
}
