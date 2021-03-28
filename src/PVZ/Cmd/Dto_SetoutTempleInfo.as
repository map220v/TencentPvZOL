package PVZ.Cmd
{
   import com.tencent.protobuf.Int64;
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_INT64;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_SetoutTempleInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_SetoutTempleInfo";
      
      public static const TEMPLEID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_SetoutTempleInfo.templeId","templeId",1 << 3 | WireType.VARINT);
      
      public static const GUILDNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_SetoutTempleInfo.guildName","guildName",2 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const DEFENDTEAMNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_SetoutTempleInfo.defendTeamNum","defendTeamNum",3 << 3 | WireType.VARINT);
      
      public static const TEMPLESTATE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_SetoutTempleInfo.templeState","templeState",4 << 3 | WireType.VARINT);
      
      public static const SETOUTTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_SetoutTempleInfo.setoutTime","setoutTime",5 << 3 | WireType.VARINT);
       
      
      private var templeId$field:Int64;
      
      private var guildName$field:String;
      
      private var defendTeamNum$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var templeState$field:uint;
      
      private var setoutTime$field:uint;
      
      public function Dto_SetoutTempleInfo()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_SetoutTempleInfo.$MessageID;
      }
      
      public function clearTempleId() : void
      {
         this.templeId$field = null;
      }
      
      public function get hasTempleId() : Boolean
      {
         return this.templeId$field != null;
      }
      
      public function set templeId(param1:Int64) : void
      {
         this.templeId$field = param1;
      }
      
      public function get templeId() : Int64
      {
         return this.templeId$field;
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
      
      public function clearDefendTeamNum() : void
      {
         this.hasField$0 &= 4294967294;
         this.defendTeamNum$field = new uint();
      }
      
      public function get hasDefendTeamNum() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set defendTeamNum(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.defendTeamNum$field = param1;
      }
      
      public function get defendTeamNum() : uint
      {
         return this.defendTeamNum$field;
      }
      
      public function clearTempleState() : void
      {
         this.hasField$0 &= 4294967293;
         this.templeState$field = new uint();
      }
      
      public function get hasTempleState() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set templeState(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.templeState$field = param1;
      }
      
      public function get templeState() : uint
      {
         return this.templeState$field;
      }
      
      public function clearSetoutTime() : void
      {
         this.hasField$0 &= 4294967291;
         this.setoutTime$field = new uint();
      }
      
      public function get hasSetoutTime() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set setoutTime(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.setoutTime$field = param1;
      }
      
      public function get setoutTime() : uint
      {
         return this.setoutTime$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasTempleId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT64(param1,this.templeId$field);
         }
         if(this.hasGuildName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_STRING(param1,this.guildName$field);
         }
         if(this.hasDefendTeamNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.defendTeamNum$field);
         }
         if(this.hasTempleState)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.templeState$field);
         }
         if(this.hasSetoutTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.setoutTime$field);
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
                     throw new IOError("Bad data format: Dto_SetoutTempleInfo.templeId cannot be set twice.");
                  }
                  _loc3_++;
                  this.templeId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_SetoutTempleInfo.guildName cannot be set twice.");
                  }
                  _loc4_++;
                  this.guildName = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_SetoutTempleInfo.defendTeamNum cannot be set twice.");
                  }
                  _loc5_++;
                  this.defendTeamNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_SetoutTempleInfo.templeState cannot be set twice.");
                  }
                  _loc6_++;
                  this.templeState = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_SetoutTempleInfo.setoutTime cannot be set twice.");
                  }
                  _loc7_++;
                  this.setoutTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc8_);
                  break;
            }
         }
      }
   }
}
