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
   
   public final class Dto_Outpost_AllyTeam extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_Outpost_AllyTeam";
      
      public static const ALLYID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_Outpost_AllyTeam.allyId","allyId",1 << 3 | WireType.VARINT);
      
      public static const ALLYNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_Outpost_AllyTeam.allyName","allyName",2 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const ALLYTEAMID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Outpost_AllyTeam.allyTeamId","allyTeamId",3 << 3 | WireType.VARINT);
      
      public static const RETURNREMAINTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Outpost_AllyTeam.returnRemainTime","returnRemainTime",4 << 3 | WireType.VARINT);
       
      
      private var allyId$field:Int64;
      
      private var allyName$field:String;
      
      private var allyTeamId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var returnRemainTime$field:uint;
      
      public function Dto_Outpost_AllyTeam()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_Outpost_AllyTeam.$MessageID;
      }
      
      public function clearAllyId() : void
      {
         this.allyId$field = null;
      }
      
      public function get hasAllyId() : Boolean
      {
         return this.allyId$field != null;
      }
      
      public function set allyId(param1:Int64) : void
      {
         this.allyId$field = param1;
      }
      
      public function get allyId() : Int64
      {
         return this.allyId$field;
      }
      
      public function clearAllyName() : void
      {
         this.allyName$field = null;
      }
      
      public function get hasAllyName() : Boolean
      {
         return this.allyName$field != null;
      }
      
      public function set allyName(param1:String) : void
      {
         this.allyName$field = param1;
      }
      
      public function get allyName() : String
      {
         return this.allyName$field;
      }
      
      public function clearAllyTeamId() : void
      {
         this.hasField$0 &= 4294967294;
         this.allyTeamId$field = new uint();
      }
      
      public function get hasAllyTeamId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set allyTeamId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.allyTeamId$field = param1;
      }
      
      public function get allyTeamId() : uint
      {
         return this.allyTeamId$field;
      }
      
      public function clearReturnRemainTime() : void
      {
         this.hasField$0 &= 4294967293;
         this.returnRemainTime$field = new uint();
      }
      
      public function get hasReturnRemainTime() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set returnRemainTime(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.returnRemainTime$field = param1;
      }
      
      public function get returnRemainTime() : uint
      {
         return this.returnRemainTime$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasAllyId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT64(param1,this.allyId$field);
         }
         if(this.hasAllyName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_STRING(param1,this.allyName$field);
         }
         if(this.hasAllyTeamId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.allyTeamId$field);
         }
         if(this.hasReturnRemainTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.returnRemainTime$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
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
                     throw new IOError("Bad data format: Dto_Outpost_AllyTeam.allyId cannot be set twice.");
                  }
                  _loc3_++;
                  this.allyId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Outpost_AllyTeam.allyName cannot be set twice.");
                  }
                  _loc4_++;
                  this.allyName = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Outpost_AllyTeam.allyTeamId cannot be set twice.");
                  }
                  _loc5_++;
                  this.allyTeamId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Outpost_AllyTeam.returnRemainTime cannot be set twice.");
                  }
                  _loc6_++;
                  this.returnRemainTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc7_);
                  break;
            }
         }
      }
   }
}
