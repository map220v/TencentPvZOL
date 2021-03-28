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
   
   public final class Cmd_Garden_BuyPet_CS extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Garden_BuyPet_CS";
      
      public static const PETID:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Garden_BuyPet_CS.petid","petid",1 << 3 | WireType.VARINT);
      
      public static const FOREVER:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_Garden_BuyPet_CS.forever","forever",2 << 3 | WireType.VARINT);
       
      
      private var petid$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var forever$field:Boolean;
      
      public function Cmd_Garden_BuyPet_CS()
      {
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Garden_BuyPet_CS.$MessageID;
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
      
      public function clearForever() : void
      {
         this.hasField$0 &= 4294967293;
         this.forever$field = new Boolean();
      }
      
      public function get hasForever() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set forever(param1:Boolean) : void
      {
         this.hasField$0 |= 2;
         this.forever$field = param1;
      }
      
      public function get forever() : Boolean
      {
         return this.forever$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc2_:* = undefined;
         if(this.hasPetid)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,1);
            WriteUtils.write$TYPE_UINT32(param1,this.petid$field);
         }
         if(this.hasForever)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_BOOL(param1,this.forever$field);
         }
         for(_loc2_ in this)
         {
            super.writeUnknown(param1,_loc2_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc5_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc5_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc5_ >> 3)
            {
               case 1:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Garden_BuyPet_CS.petid cannot be set twice.");
                  }
                  _loc3_++;
                  this.petid = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 2:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Garden_BuyPet_CS.forever cannot be set twice.");
                  }
                  _loc4_++;
                  this.forever = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc5_);
                  break;
            }
         }
      }
   }
}
