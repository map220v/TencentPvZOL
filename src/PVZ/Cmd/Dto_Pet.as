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
   
   public final class Dto_Pet extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_Pet";
      
      public static const PETID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Pet.petid","petid",1 << 3 | WireType.VARINT);
      
      public static const OWNED:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_Pet.owned","owned",2 << 3 | WireType.VARINT);
      
      public static const FOREVER:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_Pet.forever","forever",3 << 3 | WireType.VARINT);
      
      public static const EXPIRETIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Pet.expiretime","expiretime",4 << 3 | WireType.VARINT);
      
      public static const STARTWORKTIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Pet.startworktime","startworktime",5 << 3 | WireType.VARINT);
      
      public static const INUSE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_Pet.inuse","inuse",6 << 3 | WireType.VARINT);
      
      public static const DAYPRICE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Pet.dayprice","dayprice",7 << 3 | WireType.VARINT);
      
      public static const FOREVERPRICE:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_Pet.foreverprice","foreverprice",8 << 3 | WireType.VARINT);
       
      
      private var petid$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var owned$field:Boolean;
      
      private var forever$field:Boolean;
      
      private var expiretime$field:uint;
      
      private var startworktime$field:uint;
      
      private var inuse$field:Boolean;
      
      private var dayprice$field:uint;
      
      private var foreverprice$field:uint;
      
      public function Dto_Pet()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_Pet.$MessageID;
      }
      
      public function clearPetid() : void
      {
         this.hasField$0 &= 4294967294;
         this.petid$field = new uint();
      }
      
      public function get hasPetid() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set petid(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.petid$field = param1;
      }
      
      public function get petid() : uint
      {
         return this.petid$field;
      }
      
      public function clearOwned() : void
      {
         this.hasField$0 &= 4294967293;
         this.owned$field = new Boolean();
      }
      
      public function get hasOwned() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set owned(param1:Boolean) : void
      {
         this.hasField$0 |= 2;
         this.owned$field = param1;
      }
      
      public function get owned() : Boolean
      {
         return this.owned$field;
      }
      
      public function clearForever() : void
      {
         this.hasField$0 &= 4294967291;
         this.forever$field = new Boolean();
      }
      
      public function get hasForever() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set forever(param1:Boolean) : void
      {
         this.hasField$0 |= 4;
         this.forever$field = param1;
      }
      
      public function get forever() : Boolean
      {
         return this.forever$field;
      }
      
      public function clearExpiretime() : void
      {
         this.hasField$0 &= 4294967287;
         this.expiretime$field = new uint();
      }
      
      public function get hasExpiretime() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set expiretime(param1:uint) : void
      {
         this.hasField$0 |= 8;
         this.expiretime$field = param1;
      }
      
      public function get expiretime() : uint
      {
         return this.expiretime$field;
      }
      
      public function clearStartworktime() : void
      {
         this.hasField$0 &= 4294967279;
         this.startworktime$field = new uint();
      }
      
      public function get hasStartworktime() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set startworktime(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.startworktime$field = param1;
      }
      
      public function get startworktime() : uint
      {
         return this.startworktime$field;
      }
      
      public function clearInuse() : void
      {
         this.hasField$0 &= 4294967263;
         this.inuse$field = new Boolean();
      }
      
      public function get hasInuse() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set inuse(param1:Boolean) : void
      {
         this.hasField$0 |= 32;
         this.inuse$field = param1;
      }
      
      public function get inuse() : Boolean
      {
         return this.inuse$field;
      }
      
      public function clearDayprice() : void
      {
         this.hasField$0 &= 4294967231;
         this.dayprice$field = new uint();
      }
      
      public function get hasDayprice() : Boolean
      {
         return (this.hasField$0 & 64) != 0;
      }
      
      public function set dayprice(param1:uint) : void
      {
         this.hasField$0 |= 64;
         this.dayprice$field = param1;
      }
      
      public function get dayprice() : uint
      {
         return this.dayprice$field;
      }
      
      public function clearForeverprice() : void
      {
         this.hasField$0 &= 4294967167;
         this.foreverprice$field = new uint();
      }
      
      public function get hasForeverprice() : Boolean
      {
         return (this.hasField$0 & 128) != 0;
      }
      
      public function set foreverprice(param1:uint) : void
      {
         this.hasField$0 |= 128;
         this.foreverprice$field = param1;
      }
      
      public function get foreverprice() : uint
      {
         return this.foreverprice$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasPetid)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.petid$field);
         }
         if(this.hasOwned)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_BOOL(param1,this.owned$field);
         }
         if(this.hasForever)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_BOOL(param1,this.forever$field);
         }
         if(this.hasExpiretime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.expiretime$field);
         }
         if(this.hasStartworktime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.startworktime$field);
         }
         if(this.hasInuse)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_BOOL(param1,this.inuse$field);
         }
         if(this.hasDayprice)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.dayprice$field);
         }
         if(this.hasForeverprice)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_UINT32(param1,this.foreverprice$field);
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
                     throw new IOError("Bad data format: Dto_Pet.petid cannot be set twice.");
                  }
                  _loc3_++;
                  this.petid = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Pet.owned cannot be set twice.");
                  }
                  _loc4_++;
                  this.owned = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 3:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Pet.forever cannot be set twice.");
                  }
                  _loc5_++;
                  this.forever = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 4:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Pet.expiretime cannot be set twice.");
                  }
                  _loc6_++;
                  this.expiretime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Pet.startworktime cannot be set twice.");
                  }
                  _loc7_++;
                  this.startworktime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Pet.inuse cannot be set twice.");
                  }
                  _loc8_++;
                  this.inuse = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 7:
                  if(_loc9_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Pet.dayprice cannot be set twice.");
                  }
                  _loc9_++;
                  this.dayprice = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 8:
                  if(_loc10_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_Pet.foreverprice cannot be set twice.");
                  }
                  _loc10_++;
                  this.foreverprice = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc11_);
                  break;
            }
         }
      }
   }
}
