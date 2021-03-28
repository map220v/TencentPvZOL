package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_MESSAGE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Temple_GetTempleInfo_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Temple_GetTempleInfo_SC";
      
      public static const POS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Temple_GetTempleInfo_SC.pos","pos",1 << 3 | WireType.LENGTH_DELIMITED,Dto_WorldMap_Pos);
      
      public static const AREA:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Temple_GetTempleInfo_SC.area","area",2 << 3 | WireType.VARINT);
      
      public static const ISTEMPLEWARSTART:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_Temple_GetTempleInfo_SC.isTempleWarStart","isTempleWarStart",3 << 3 | WireType.VARINT);
      
      public static const GUILDINFO:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Temple_GetTempleInfo_SC.guildInfo","guildInfo",4 << 3 | WireType.LENGTH_DELIMITED,Dto_TempleGuildInfo);
      
      public static const CURRLORDGUILDID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Cmd_Temple_GetTempleInfo_SC.currLordGuildId","currLordGuildId",5 << 3 | WireType.VARINT);
       
      
      private var pos$field:Dto_WorldMap_Pos;
      
      private var area$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var isTempleWarStart$field:Boolean;
      
      public var guildInfo:Array;
      
      private var currLordGuildId$field:Int64;
      
      public function Cmd_Temple_GetTempleInfo_SC()
      {
         this.guildInfo = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Temple_GetTempleInfo_SC.$MessageID;
      }
      
      public function clearPos() : void
      {
         this.pos$field = null;
      }
      
      public function get hasPos() : Boolean
      {
         return this.pos$field != null;
      }
      
      public function set pos(param1:Dto_WorldMap_Pos) : void
      {
         this.pos$field = param1;
      }
      
      public function get pos() : Dto_WorldMap_Pos
      {
         return this.pos$field;
      }
      
      public function clearArea() : void
      {
         this.hasField$0 &= 4294967294;
         this.area$field = new uint();
      }
      
      public function get hasArea() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set area(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.area$field = param1;
      }
      
      public function get area() : uint
      {
         return this.area$field;
      }
      
      public function clearIsTempleWarStart() : void
      {
         this.hasField$0 &= 4294967293;
         this.isTempleWarStart$field = new Boolean();
      }
      
      public function get hasIsTempleWarStart() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set isTempleWarStart(param1:Boolean) : void
      {
         this.hasField$0 |= 2;
         this.isTempleWarStart$field = param1;
      }
      
      public function get isTempleWarStart() : Boolean
      {
         return this.isTempleWarStart$field;
      }
      
      public function clearCurrLordGuildId() : void
      {
         this.currLordGuildId$field = null;
      }
      
      public function get hasCurrLordGuildId() : Boolean
      {
         return this.currLordGuildId$field != null;
      }
      
      public function set currLordGuildId(param1:Int64) : void
      {
         this.currLordGuildId$field = param1;
      }
      
      public function get currLordGuildId() : Int64
      {
         return this.currLordGuildId$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasPos)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.pos$field);
         }
         if(this.hasArea)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.area$field);
         }
         if(this.hasIsTempleWarStart)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_BOOL(param1,this.isTempleWarStart$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.guildInfo.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.guildInfo[_loc2_]);
            _loc2_++;
         }
         if(this.hasCurrLordGuildId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_INT64(param1,this.currLordGuildId$field);
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc7_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc7_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc7_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Temple_GetTempleInfo_SC.pos cannot be set twice.");
                  }
                  _loc3_++;
                  this.pos = new Dto_WorldMap_Pos();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.pos);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Temple_GetTempleInfo_SC.area cannot be set twice.");
                  }
                  _loc4_++;
                  this.area = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Temple_GetTempleInfo_SC.isTempleWarStart cannot be set twice.");
                  }
                  _loc5_++;
                  this.isTempleWarStart = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 4:
                  this.guildInfo.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_TempleGuildInfo()));
                  break;
               case 5:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Temple_GetTempleInfo_SC.currLordGuildId cannot be set twice.");
                  }
                  _loc6_++;
                  this.currLordGuildId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
