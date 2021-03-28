package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_Rank_NewScrewUp extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_Rank_NewScrewUp";
      
      public static const ROLENAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_Rank_NewScrewUp.roleName","roleName",3 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const LEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Rank_NewScrewUp.level","level",4 << 3 | WireType.VARINT);
      
      public static const STAGEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Rank_NewScrewUp.stageId","stageId",5 << 3 | WireType.VARINT);
      
      public static const POWER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Rank_NewScrewUp.power","power",6 << 3 | WireType.VARINT);
      
      public static const TIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Rank_NewScrewUp.time","time",7 << 3 | WireType.VARINT);
       
      
      private var roleName$field:String;
      
      private var level$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var stageId$field:uint;
      
      private var power$field:uint;
      
      private var time$field:uint;
      
      public function Dto_Rank_NewScrewUp()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_Rank_NewScrewUp.$MessageID;
      }
      
      public function clearRoleName() : void
      {
         this.roleName$field = null;
      }
      
      public function get hasRoleName() : Boolean
      {
         return this.roleName$field != null;
      }
      
      public function set roleName(param1:String) : void
      {
         this.roleName$field = param1;
      }
      
      public function get roleName() : String
      {
         return this.roleName$field;
      }
      
      public function clearLevel() : void
      {
         this.hasField$0 &= 4294967294;
         this.level$field = new uint();
      }
      
      public function get hasLevel() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set level(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.level$field = param1;
      }
      
      public function get level() : uint
      {
         return this.level$field;
      }
      
      public function clearStageId() : void
      {
         this.hasField$0 &= 4294967293;
         this.stageId$field = new uint();
      }
      
      public function get hasStageId() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set stageId(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.stageId$field = param1;
      }
      
      public function get stageId() : uint
      {
         return this.stageId$field;
      }
      
      public function clearPower() : void
      {
         this.hasField$0 &= 4294967291;
         this.power$field = new uint();
      }
      
      public function get hasPower() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set power(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.power$field = param1;
      }
      
      public function get power() : uint
      {
         return this.power$field;
      }
      
      public function clearTime() : void
      {
         this.hasField$0 &= 4294967287;
         this.time$field = new uint();
      }
      
      public function get hasTime() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set time(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.time$field = param1;
      }
      
      public function get time() : uint
      {
         return this.time$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasRoleName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,3);
            WriteUtils.write$TYPE_STRING(param1,this.roleName$field);
         }
         if(this.hasLevel)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.level$field);
         }
         if(this.hasStageId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.stageId$field);
         }
         if(this.hasPower)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.power$field);
         }
         if(this.hasTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.time$field);
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
               case 3:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Rank_NewScrewUp.roleName cannot be set twice.");
                  }
                  _loc3_++;
                  this.roleName = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 4:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Rank_NewScrewUp.level cannot be set twice.");
                  }
                  _loc4_++;
                  this.level = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Rank_NewScrewUp.stageId cannot be set twice.");
                  }
                  _loc5_++;
                  this.stageId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Rank_NewScrewUp.power cannot be set twice.");
                  }
                  _loc6_++;
                  this.power = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Rank_NewScrewUp.time cannot be set twice.");
                  }
                  _loc7_++;
                  this.time = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc8_);
                  break;
            }
         }
      }
   }
}
