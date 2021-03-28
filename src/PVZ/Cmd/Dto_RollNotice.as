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
   
   public final class Dto_RollNotice extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_RollNotice";
      
      public static const ID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_RollNotice.id","id",1 << 3 | WireType.VARINT);
      
      public static const BEGINTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_RollNotice.beginTime","beginTime",2 << 3 | WireType.VARINT);
      
      public static const ENDTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_RollNotice.endTime","endTime",3 << 3 | WireType.VARINT);
      
      public static const SHOWINTERVAL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_RollNotice.showInterval","showInterval",4 << 3 | WireType.VARINT);
      
      public static const SHOWTIMES:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_RollNotice.showTimes","showTimes",5 << 3 | WireType.VARINT);
      
      public static const CONTENT:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_RollNotice.content","content",6 << 3 | WireType.LENGTH_DELIMITED);
      
      public static const SPLAT:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("PVZ.Cmd.Dto_RollNotice.sPlat","sPlat",7 << 3 | WireType.LENGTH_DELIMITED);
       
      
      private var id$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var beginTime$field:uint;
      
      private var endTime$field:uint;
      
      private var showInterval$field:uint;
      
      private var showTimes$field:uint;
      
      private var content$field:String;
      
      private var sPlat$field:String;
      
      public function Dto_RollNotice()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_RollNotice.$MessageID;
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
      
      public function clearBeginTime() : void
      {
         this.hasField$0 &= 4294967293;
         this.beginTime$field = new uint();
      }
      
      public function get hasBeginTime() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set beginTime(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.beginTime$field = param1;
      }
      
      public function get beginTime() : uint
      {
         return this.beginTime$field;
      }
      
      public function clearEndTime() : void
      {
         this.hasField$0 &= 4294967291;
         this.endTime$field = new uint();
      }
      
      public function get hasEndTime() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set endTime(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.endTime$field = param1;
      }
      
      public function get endTime() : uint
      {
         return this.endTime$field;
      }
      
      public function clearShowInterval() : void
      {
         this.hasField$0 &= 4294967287;
         this.showInterval$field = new uint();
      }
      
      public function get hasShowInterval() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set showInterval(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.showInterval$field = param1;
      }
      
      public function get showInterval() : uint
      {
         return this.showInterval$field;
      }
      
      public function clearShowTimes() : void
      {
         this.hasField$0 &= 4294967279;
         this.showTimes$field = new uint();
      }
      
      public function get hasShowTimes() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set showTimes(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.showTimes$field = param1;
      }
      
      public function get showTimes() : uint
      {
         return this.showTimes$field;
      }
      
      public function clearContent() : void
      {
         this.content$field = null;
      }
      
      public function get hasContent() : Boolean
      {
         return this.content$field != null;
      }
      
      public function set content(param1:String) : void
      {
         this.content$field = param1;
      }
      
      public function get content() : String
      {
         return this.content$field;
      }
      
      public function clearSPlat() : void
      {
         this.sPlat$field = null;
      }
      
      public function get hasSPlat() : Boolean
      {
         return this.sPlat$field != null;
      }
      
      public function set sPlat(param1:String) : void
      {
         this.sPlat$field = param1;
      }
      
      public function get sPlat() : String
      {
         return this.sPlat$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.id$field);
         }
         if(this.hasBeginTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.beginTime$field);
         }
         if(this.hasEndTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.endTime$field);
         }
         if(this.hasShowInterval)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.showInterval$field);
         }
         if(this.hasShowTimes)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.showTimes$field);
         }
         if(this.hasContent)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,6);
            WriteUtils.write$TYPE_STRING(param1,this.content$field);
         }
         if(this.hasSPlat)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,7);
            WriteUtils.write$TYPE_STRING(param1,this.sPlat$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc10_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         var _loc9_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc10_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc10_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_RollNotice.id cannot be set twice.");
                  }
                  _loc3_++;
                  this.id = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_RollNotice.beginTime cannot be set twice.");
                  }
                  _loc4_++;
                  this.beginTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_RollNotice.endTime cannot be set twice.");
                  }
                  _loc5_++;
                  this.endTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_RollNotice.showInterval cannot be set twice.");
                  }
                  _loc6_++;
                  this.showInterval = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_RollNotice.showTimes cannot be set twice.");
                  }
                  _loc7_++;
                  this.showTimes = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_RollNotice.content cannot be set twice.");
                  }
                  _loc8_++;
                  this.content = ReadUtils.read$TYPE_STRING(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_RollNotice.sPlat cannot be set twice.");
                  }
                  _loc9_++;
                  this.sPlat = ReadUtils.read$TYPE_STRING(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc10_);
                  break;
            }
         }
      }
   }
}
