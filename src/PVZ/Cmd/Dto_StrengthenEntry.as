package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_ENUM;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Dto_StrengthenEntry extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_StrengthenEntry";
      
      public static const ENTRYID:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("PVZ.Cmd.Dto_StrengthenEntry.entryId","entryId",1 << 3 | WireType.VARINT,E_StrengthenEntryId);
      
      public static const PARAM:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_StrengthenEntry.param","param",2 << 3 | WireType.VARINT);
      
      public static const PARAM2:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_StrengthenEntry.param2","param2",3 << 3 | WireType.VARINT);
      
      public static const PARAM3:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_StrengthenEntry.param3","param3",4 << 3 | WireType.VARINT);
      
      public static const ISOPEN:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_StrengthenEntry.isOpen","isOpen",5 << 3 | WireType.VARINT);
      
      public static const OPENLEVEL:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_StrengthenEntry.openLevel","openLevel",6 << 3 | WireType.VARINT);
      
      public static const OPENLEFTSECONDS:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_StrengthenEntry.openLeftSeconds","openLeftSeconds",7 << 3 | WireType.VARINT);
       
      
      private var entryId$field:int;
      
      private var hasField$0:uint = 0;
      
      private var param$field:uint;
      
      private var param2$field:uint;
      
      private var param3$field:uint;
      
      private var isOpen$field:Boolean;
      
      private var openLevel$field:uint;
      
      private var openLeftSeconds$field:uint;
      
      public function Dto_StrengthenEntry()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_StrengthenEntry.$MessageID;
      }
      
      public function clearEntryId() : void
      {
         this.hasField$0 &= 4294967294;
         this.entryId$field = new int();
      }
      
      public function get hasEntryId() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set entryId(param1:int) : void
      {
         this.hasField$0 |= 1;
         this.entryId$field = param1;
      }
      
      public function get entryId() : int
      {
         return this.entryId$field;
      }
      
      public function clearParam() : void
      {
         this.hasField$0 &= 4294967293;
         this.param$field = new uint();
      }
      
      public function get hasParam() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set param(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.param$field = param1;
      }
      
      public function get param() : uint
      {
         return this.param$field;
      }
      
      public function clearParam2() : void
      {
         this.hasField$0 &= 4294967291;
         this.param2$field = new uint();
      }
      
      public function get hasParam2() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set param2(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.param2$field = param1;
      }
      
      public function get param2() : uint
      {
         return this.param2$field;
      }
      
      public function clearParam3() : void
      {
         this.hasField$0 &= 4294967287;
         this.param3$field = new uint();
      }
      
      public function get hasParam3() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set param3(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.param3$field = param1;
      }
      
      public function get param3() : uint
      {
         return this.param3$field;
      }
      
      public function clearIsOpen() : void
      {
         this.hasField$0 &= 4294967279;
         this.isOpen$field = new Boolean();
      }
      
      public function get hasIsOpen() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set isOpen(param1:Boolean) : void
      {
         this.hasField$0 |= 16;
         this.isOpen$field = param1;
      }
      
      public function get isOpen() : Boolean
      {
         return this.isOpen$field;
      }
      
      public function clearOpenLevel() : void
      {
         this.hasField$0 &= 4294967263;
         this.openLevel$field = new uint();
      }
      
      public function get hasOpenLevel() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set openLevel(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.openLevel$field = param1;
      }
      
      public function get openLevel() : uint
      {
         return this.openLevel$field;
      }
      
      public function clearOpenLeftSeconds() : void
      {
         this.hasField$0 &= 4294967231;
         this.openLeftSeconds$field = new uint();
      }
      
      public function get hasOpenLeftSeconds() : Boolean
      {
         return (this.hasField$0 & 64) != 0;
      }
      
      public function set openLeftSeconds(param1:uint) : void
      {
         this.hasField$0 |= 64;
         this.openLeftSeconds$field = param1;
      }
      
      public function get openLeftSeconds() : uint
      {
         return this.openLeftSeconds$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasEntryId)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_ENUM(param1,this.entryId$field);
         }
         if(this.hasParam)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_UINT32(param1,this.param$field);
         }
         if(this.hasParam2)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.param2$field);
         }
         if(this.hasParam3)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.param3$field);
         }
         if(this.hasIsOpen)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_BOOL(param1,this.isOpen$field);
         }
         if(this.hasOpenLevel)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_UINT32(param1,this.openLevel$field);
         }
         if(this.hasOpenLeftSeconds)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.openLeftSeconds$field);
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
                     throw new IOError("Bad data format: Dto_StrengthenEntry.entryId cannot be set twice.");
                  }
                  _loc3_++;
                  this.entryId = ReadUtils.read$TYPE_ENUM(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_StrengthenEntry.param cannot be set twice.");
                  }
                  _loc4_++;
                  this.param = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_StrengthenEntry.param2 cannot be set twice.");
                  }
                  _loc5_++;
                  this.param2 = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_StrengthenEntry.param3 cannot be set twice.");
                  }
                  _loc6_++;
                  this.param3 = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_StrengthenEntry.isOpen cannot be set twice.");
                  }
                  _loc7_++;
                  this.isOpen = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_StrengthenEntry.openLevel cannot be set twice.");
                  }
                  _loc8_++;
                  this.openLevel = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_StrengthenEntry.openLeftSeconds cannot be set twice.");
                  }
                  _loc9_++;
                  this.openLeftSeconds = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc10_);
                  break;
            }
         }
      }
   }
}
