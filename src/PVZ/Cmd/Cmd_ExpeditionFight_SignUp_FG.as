package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_ExpeditionFight_SignUp_FG extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_ExpeditionFight_SignUp_FG";
      
      public static const SECTIONID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExpeditionFight_SignUp_FG.sectionId","sectionId",1 << 3 | WireType.VARINT);
      
      public static const SIDEID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExpeditionFight_SignUp_FG.sideId","sideId",2 << 3 | WireType.VARINT);
      
      public static const CITYID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExpeditionFight_SignUp_FG.cityId","cityId",3 << 3 | WireType.VARINT);
      
      public static const FIRST:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_ExpeditionFight_SignUp_FG.first","first",4 << 3 | WireType.VARINT);
      
      public static const POWER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_ExpeditionFight_SignUp_FG.power","power",5 << 3 | WireType.VARINT);
       
      
      private var sectionId$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var sideId$field:uint;
      
      private var cityId$field:uint;
      
      private var first$field:Boolean;
      
      private var power$field:uint;
      
      public function Cmd_ExpeditionFight_SignUp_FG()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_ExpeditionFight_SignUp_FG.$MessageID;
      }
      
      public function clearSectionId() : void
      {
         this.hasField$0 &= 4294967294;
         this.sectionId$field = new uint();
      }
      
      public function get hasSectionId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set sectionId(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.sectionId$field = param1;
      }
      
      public function get sectionId() : uint
      {
         return this.sectionId$field;
      }
      
      public function clearSideId() : void
      {
         this.hasField$0 &= 4294967293;
         this.sideId$field = new uint();
      }
      
      public function get hasSideId() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set sideId(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.sideId$field = param1;
      }
      
      public function get sideId() : uint
      {
         return this.sideId$field;
      }
      
      public function clearCityId() : void
      {
         this.hasField$0 &= 4294967291;
         this.cityId$field = new uint();
      }
      
      public function get hasCityId() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set cityId(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.cityId$field = param1;
      }
      
      public function get cityId() : uint
      {
         return this.cityId$field;
      }
      
      public function clearFirst() : void
      {
         this.hasField$0 &= 4294967287;
         this.first$field = new Boolean();
      }
      
      public function get hasFirst() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set first(param1:Boolean) : void
      {
         this.hasField$0 |= 8;
         this.first$field = param1;
      }
      
      public function get first() : Boolean
      {
         return this.first$field;
      }
      
      public function clearPower() : void
      {
         this.hasField$0 &= 4294967279;
         this.power$field = new uint();
      }
      
      public function get hasPower() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set power(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.power$field = param1;
      }
      
      public function get power() : uint
      {
         return this.power$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasSectionId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.sectionId$field);
         }
         if(this.hasSideId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.sideId$field);
         }
         if(this.hasCityId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.cityId$field);
         }
         if(this.hasFirst)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_BOOL(param1,this.first$field);
         }
         if(this.hasPower)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.power$field);
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
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_SignUp_FG.sectionId cannot be set twice.");
                  }
                  _loc3_++;
                  this.sectionId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_SignUp_FG.sideId cannot be set twice.");
                  }
                  _loc4_++;
                  this.sideId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_SignUp_FG.cityId cannot be set twice.");
                  }
                  _loc5_++;
                  this.cityId = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_SignUp_FG.first cannot be set twice.");
                  }
                  _loc6_++;
                  this.first = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_ExpeditionFight_SignUp_FG.power cannot be set twice.");
                  }
                  _loc7_++;
                  this.power = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc8_);
                  break;
            }
         }
      }
   }
}
