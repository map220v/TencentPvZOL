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
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Mine_GetInfo_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Mine_GetInfo_SC";
      
      public static const MINEPOS:FieldDescriptor$TYPE_MESSAGE = new FieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Mine_GetInfo_SC.minePos","minePos",1 << 3 | WireType.LENGTH_DELIMITED,Dto_WorldMap_Pos);
      
      public static const HOLDSTATE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Mine_GetInfo_SC.holdState","holdState",2 << 3 | WireType.VARINT);
      
      public static const GUILDID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Cmd_Mine_GetInfo_SC.guildId","guildId",3 << 3 | WireType.VARINT);
      
      public static const GUILDNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Cmd_Mine_GetInfo_SC.guildName","guildName",4 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const HOLDERINFO:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Mine_GetInfo_SC.holderInfo","holderInfo",5 << 3 | WireType.LENGTH_DELIMITED,Dto_MineHolderInfo);
      
      public static const REMAINMINECAR:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Mine_GetInfo_SC.remainMineCar","remainMineCar",6 << 3 | WireType.VARINT);
      
      public static const TOTALMINECAR:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Mine_GetInfo_SC.totalMineCar","totalMineCar",7 << 3 | WireType.VARINT);
       
      
      private var minePos$field:Dto_WorldMap_Pos;
      
      private var holdState$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var guildId$field:Int64;
      
      private var guildName$field:String;
      
      public var holderInfo:Array;
      
      private var remainMineCar$field:uint;
      
      private var totalMineCar$field:uint;
      
      public function Cmd_Mine_GetInfo_SC()
      {
         this.holderInfo = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Mine_GetInfo_SC.$MessageID;
      }
      
      public function clearMinePos() : void
      {
         this.minePos$field = null;
      }
      
      public function get hasMinePos() : Boolean
      {
         return this.minePos$field != null;
      }
      
      public function set minePos(param1:Dto_WorldMap_Pos) : void
      {
         this.minePos$field = param1;
      }
      
      public function get minePos() : Dto_WorldMap_Pos
      {
         return this.minePos$field;
      }
      
      public function clearHoldState() : void
      {
         this.hasField$0 &= 4294967294;
         this.holdState$field = new uint();
      }
      
      public function get hasHoldState() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set holdState(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.holdState$field = param1;
      }
      
      public function get holdState() : uint
      {
         return this.holdState$field;
      }
      
      public function clearGuildId() : void
      {
         this.guildId$field = null;
      }
      
      public function get hasGuildId() : Boolean
      {
         return this.guildId$field != null;
      }
      
      public function set guildId(param1:Int64) : void
      {
         this.guildId$field = param1;
      }
      
      public function get guildId() : Int64
      {
         return this.guildId$field;
      }
      
      public function clearGuildName() : void
      {
         this.guildName$field = null;
      }
      
      public function get hasGuildName() : Boolean
      {
         return this.guildName$field != null;
      }
      
      public function set guildName(param1:String) : void
      {
         this.guildName$field = param1;
      }
      
      public function get guildName() : String
      {
         return this.guildName$field;
      }
      
      public function clearRemainMineCar() : void
      {
         this.hasField$0 &= 4294967293;
         this.remainMineCar$field = new uint();
      }
      
      public function get hasRemainMineCar() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set remainMineCar(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.remainMineCar$field = param1;
      }
      
      public function get remainMineCar() : uint
      {
         return this.remainMineCar$field;
      }
      
      public function clearTotalMineCar() : void
      {
         this.hasField$0 &= 4294967291;
         this.totalMineCar$field = new uint();
      }
      
      public function get hasTotalMineCar() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set totalMineCar(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.totalMineCar$field = param1;
      }
      
      public function get totalMineCar() : uint
      {
         return this.totalMineCar$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc3_:* = undefined;
         if(this.hasMinePos)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.minePos$field);
         }
         if(this.hasHoldState)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.holdState$field);
         }
         if(this.hasGuildId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_INT64(param1,this.guildId$field);
         }
         if(this.hasGuildName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_STRING(param1,this.guildName$field);
         }
         var _loc2_:uint = 0;
         while(_loc2_ < this.holderInfo.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,5);
            WriteUtils.write$TYPE_MESSAGE(param1,this.holderInfo[_loc2_]);
            _loc2_++;
         }
         if(this.hasRemainMineCar)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.remainMineCar$field);
         }
         if(this.hasTotalMineCar)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.totalMineCar$field);
         }
         for(_loc3_ in this)
         {
            super.writeUnknown(param1,_loc3_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc9_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc9_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc9_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Mine_GetInfo_SC.minePos cannot be set twice.");
                  }
                  _loc3_++;
                  this.minePos = new Dto_WorldMap_Pos();
                  ReadUtils.read$TYPE_MESSAGE(param1,this.minePos);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Mine_GetInfo_SC.holdState cannot be set twice.");
                  }
                  _loc4_++;
                  this.holdState = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Mine_GetInfo_SC.guildId cannot be set twice.");
                  }
                  _loc5_++;
                  this.guildId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Mine_GetInfo_SC.guildName cannot be set twice.");
                  }
                  _loc6_++;
                  this.guildName = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 5:
                  this.holderInfo.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_MineHolderInfo()));
                  break;
               case 6:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Mine_GetInfo_SC.remainMineCar cannot be set twice.");
                  }
                  _loc7_++;
                  this.remainMineCar = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Mine_GetInfo_SC.totalMineCar cannot be set twice.");
                  }
                  _loc8_++;
                  this.totalMineCar = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc9_);
                  break;
            }
         }
      }
   }
}
