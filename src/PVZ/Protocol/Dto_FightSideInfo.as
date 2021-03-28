package PVZ.Protocol
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_DOUBLE;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_STRING;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_FightSideInfo extends Message
   {
      
      public static const $MessageID:String = "PVZ.Protocol.Dto_FightSideInfo";
      
      public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Protocol.Dto_FightSideInfo.name","name",1 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const UIN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Protocol.Dto_FightSideInfo.uin","uin",2 << 3 | WireType.VARINT);
      
      public static const ROLELEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Protocol.Dto_FightSideInfo.roleLevel","roleLevel",3 << 3 | WireType.VARINT);
      
      public static const AASRATE:FieldDescriptor$TYPE_DOUBLE = new FieldDescriptor$TYPE_DOUBLE("PVZ.Protocol.Dto_FightSideInfo.aasRate","aasRate",4 << 3 | WireType.FIXED_64_BIT);
      
      public static const QQFACEURL:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Protocol.Dto_FightSideInfo.qqFaceURL","qqFaceURL",5 << 3 | WireType.LENGTH_DELIMITED);
       
      
      private var name$field:String;
      
      private var uin$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var roleLevel$field:uint;
      
      private var aasRate$field:Number;
      
      private var qqFaceURL$field:String;
      
      public function Dto_FightSideInfo()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_FightSideInfo.$MessageID;
      }
      
      public function clearName() : void
      {
         this.name$field = null;
      }
      
      public function get hasName() : Boolean
      {
         return this.name$field != null;
      }
      
      public function set name(param1:String) : void
      {
         this.name$field = param1;
      }
      
      public function get name() : String
      {
         return this.name$field;
      }
      
      public function clearUin() : void
      {
         this.hasField$0 &= 4294967294;
         this.uin$field = new uint();
      }
      
      public function get hasUin() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set uin(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.uin$field = param1;
      }
      
      public function get uin() : uint
      {
         return this.uin$field;
      }
      
      public function clearRoleLevel() : void
      {
         this.hasField$0 &= 4294967293;
         this.roleLevel$field = new uint();
      }
      
      public function get hasRoleLevel() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set roleLevel(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.roleLevel$field = param1;
      }
      
      public function get roleLevel() : uint
      {
         return this.roleLevel$field;
      }
      
      public function clearAasRate() : void
      {
         this.hasField$0 &= 4294967291;
         this.aasRate$field = new Number();
      }
      
      public function get hasAasRate() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set aasRate(param1:Number) : void
      {
         this.hasField$0 |= 4;
         this.aasRate$field = param1;
      }
      
      public function get aasRate() : Number
      {
         return this.aasRate$field;
      }
      
      public function clearQqFaceURL() : void
      {
         this.qqFaceURL$field = null;
      }
      
      public function get hasQqFaceURL() : Boolean
      {
         return this.qqFaceURL$field != null;
      }
      
      public function set qqFaceURL(param1:String) : void
      {
         this.qqFaceURL$field = param1;
      }
      
      public function get qqFaceURL() : String
      {
         return this.qqFaceURL$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasName)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_STRING(param1,this.name$field);
         }
         if(this.hasUin)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.uin$field);
         }
         if(this.hasRoleLevel)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.roleLevel$field);
         }
         if(this.hasAasRate)
         {
            WriteUtils.writeTag(param1,WireType.FIXED_64_BIT,4);
            WriteUtils.write$TYPE_DOUBLE(param1,this.aasRate$field);
         }
         if(this.hasQqFaceURL)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,5);
            WriteUtils.write$TYPE_STRING(param1,this.qqFaceURL$field);
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
                     throw new IOError("Bad data format: Dto_FightSideInfo.name cannot be set twice.");
                  }
                  _loc3_++;
                  this.name = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightSideInfo.uin cannot be set twice.");
                  }
                  _loc4_++;
                  this.uin = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightSideInfo.roleLevel cannot be set twice.");
                  }
                  _loc5_++;
                  this.roleLevel = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightSideInfo.aasRate cannot be set twice.");
                  }
                  _loc6_++;
                  this.aasRate = ReadUtils.read$TYPE_DOUBLE(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FightSideInfo.qqFaceURL cannot be set twice.");
                  }
                  _loc7_++;
                  this.qqFaceURL = ReadUtils.read$TYPE_STRING(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc8_);
                  break;
            }
         }
      }
   }
}
