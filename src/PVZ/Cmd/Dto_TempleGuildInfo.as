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
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_TempleGuildInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_TempleGuildInfo";
      
      public static const LORDGUILDID:FieldDescriptor$TYPE_INT64 = new FieldDescriptor$TYPE_INT64("PVZ.Cmd.Dto_TempleGuildInfo.lordGuildId","lordGuildId",1 << 3 | WireType.VARINT);
      
      public static const LORDGUILDNAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_TempleGuildInfo.lordGuildName","lordGuildName",2 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const DEFENCETEAMNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_TempleGuildInfo.defenceTeamNum","defenceTeamNum",3 << 3 | WireType.VARINT);
      
      public static const DEFENCETEAMMAXNUM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_TempleGuildInfo.defenceTeamMaxNum","defenceTeamMaxNum",4 << 3 | WireType.VARINT);
      
      public static const CAPTURETIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_TempleGuildInfo.captureTime","captureTime",5 << 3 | WireType.VARINT);
      
      public static const CAPTUREREWARD:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_TempleGuildInfo.captureReward","captureReward",6 << 3 | WireType.VARINT);
      
      public static const DETECTNEEDSUBITEM:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_TempleGuildInfo.detectNeedSubItem","detectNeedSubItem",7 << 3 | WireType.VARINT);
      
      public static const MARCHTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_TempleGuildInfo.marchTime","marchTime",8 << 3 | WireType.VARINT);
       
      
      private var lordGuildId$field:Int64;
      
      private var lordGuildName$field:String;
      
      private var defenceTeamNum$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var defenceTeamMaxNum$field:uint;
      
      private var captureTime$field:uint;
      
      private var captureReward$field:uint;
      
      private var detectNeedSubItem$field:Boolean;
      
      private var marchTime$field:uint;
      
      public function Dto_TempleGuildInfo()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_TempleGuildInfo.$MessageID;
      }
      
      public function clearLordGuildId() : void
      {
         this.lordGuildId$field = null;
      }
      
      public function get hasLordGuildId() : Boolean
      {
         return this.lordGuildId$field != null;
      }
      
      public function set lordGuildId(param1:Int64) : void
      {
         this.lordGuildId$field = param1;
      }
      
      public function get lordGuildId() : Int64
      {
         return this.lordGuildId$field;
      }
      
      public function clearLordGuildName() : void
      {
         this.lordGuildName$field = null;
      }
      
      public function get hasLordGuildName() : Boolean
      {
         return this.lordGuildName$field != null;
      }
      
      public function set lordGuildName(param1:String) : void
      {
         this.lordGuildName$field = param1;
      }
      
      public function get lordGuildName() : String
      {
         return this.lordGuildName$field;
      }
      
      public function clearDefenceTeamNum() : void
      {
         this.hasField$0 &= 4294967294;
         this.defenceTeamNum$field = new uint();
      }
      
      public function get hasDefenceTeamNum() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set defenceTeamNum(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.defenceTeamNum$field = param1;
      }
      
      public function get defenceTeamNum() : uint
      {
         return this.defenceTeamNum$field;
      }
      
      public function clearDefenceTeamMaxNum() : void
      {
         this.hasField$0 &= 4294967293;
         this.defenceTeamMaxNum$field = new uint();
      }
      
      public function get hasDefenceTeamMaxNum() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set defenceTeamMaxNum(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.defenceTeamMaxNum$field = param1;
      }
      
      public function get defenceTeamMaxNum() : uint
      {
         return this.defenceTeamMaxNum$field;
      }
      
      public function clearCaptureTime() : void
      {
         this.hasField$0 &= 4294967291;
         this.captureTime$field = new uint();
      }
      
      public function get hasCaptureTime() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set captureTime(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.captureTime$field = param1;
      }
      
      public function get captureTime() : uint
      {
         return this.captureTime$field;
      }
      
      public function clearCaptureReward() : void
      {
         this.hasField$0 &= 4294967287;
         this.captureReward$field = new uint();
      }
      
      public function get hasCaptureReward() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set captureReward(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.captureReward$field = param1;
      }
      
      public function get captureReward() : uint
      {
         return this.captureReward$field;
      }
      
      public function clearDetectNeedSubItem() : void
      {
         this.hasField$0 &= 4294967279;
         this.detectNeedSubItem$field = new Boolean();
      }
      
      public function get hasDetectNeedSubItem() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set detectNeedSubItem(param1:Boolean) : void
      {
         this.hasField$0 |= 16;
         this.detectNeedSubItem$field = param1;
      }
      
      public function get detectNeedSubItem() : Boolean
      {
         return this.detectNeedSubItem$field;
      }
      
      public function clearMarchTime() : void
      {
         this.hasField$0 &= 4294967263;
         this.marchTime$field = new uint();
      }
      
      public function get hasMarchTime() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set marchTime(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.marchTime$field = param1;
      }
      
      public function get marchTime() : uint
      {
         return this.marchTime$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasLordGuildId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_INT64(param1,this.lordGuildId$field);
         }
         if(this.hasLordGuildName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_STRING(param1,this.lordGuildName$field);
         }
         if(this.hasDefenceTeamNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.defenceTeamNum$field);
         }
         if(this.hasDefenceTeamMaxNum)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.defenceTeamMaxNum$field);
         }
         if(this.hasCaptureTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.captureTime$field);
         }
         if(this.hasCaptureReward)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.captureReward$field);
         }
         if(this.hasDetectNeedSubItem)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_BOOL(param1,this.detectNeedSubItem$field);
         }
         if(this.hasMarchTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_UINT32(param1,this.marchTime$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc11_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         var _loc9_:uint = 0;
         var _loc10_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc11_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc11_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_TempleGuildInfo.lordGuildId cannot be set twice.");
                  }
                  _loc3_++;
                  this.lordGuildId = ReadUtils.read$TYPE_INT64(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_TempleGuildInfo.lordGuildName cannot be set twice.");
                  }
                  _loc4_++;
                  this.lordGuildName = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_TempleGuildInfo.defenceTeamNum cannot be set twice.");
                  }
                  _loc5_++;
                  this.defenceTeamNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_TempleGuildInfo.defenceTeamMaxNum cannot be set twice.");
                  }
                  _loc6_++;
                  this.defenceTeamMaxNum = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_TempleGuildInfo.captureTime cannot be set twice.");
                  }
                  _loc7_++;
                  this.captureTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_TempleGuildInfo.captureReward cannot be set twice.");
                  }
                  _loc8_++;
                  this.captureReward = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_TempleGuildInfo.detectNeedSubItem cannot be set twice.");
                  }
                  _loc9_++;
                  this.detectNeedSubItem = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 8:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_TempleGuildInfo.marchTime cannot be set twice.");
                  }
                  _loc10_++;
                  this.marchTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc11_);
                  break;
            }
         }
      }
   }
}
