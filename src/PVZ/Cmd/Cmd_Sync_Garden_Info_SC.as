package PVZ.Cmd
{
   import com.tencent.protobuf.Message;
   import com.tencent.protobuf.ReadUtils;
   import com.tencent.protobuf.WireType;
   import com.tencent.protobuf.WriteUtils;
   import com.tencent.protobuf.WritingBuffer;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_BOOL;
   import com.tencent.protobuf.fieldDescriptors.FieldDescriptor$TYPE_UINT32;
   import com.tencent.protobuf.fieldDescriptors.RepeatedFieldDescriptor$TYPE_MESSAGE;
   import flash.errors.IOError;
   import flash.utils.IDataInput;
   
   public final class Cmd_Sync_Garden_Info_SC extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Cmd_Sync_Garden_Info_SC";
      
      public static const FIELDS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Sync_Garden_Info_SC.fields","fields",1 << 3 | WireType.LENGTH_DELIMITED,Dto_Field);
      
      public static const PETS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Cmd_Sync_Garden_Info_SC.pets","pets",2 << 3 | WireType.LENGTH_DELIMITED,Dto_Pet);
      
      public static const EXP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Sync_Garden_Info_SC.exp","exp",3 << 3 | WireType.VARINT);
      
      public static const BEAN:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Sync_Garden_Info_SC.bean","bean",4 << 3 | WireType.VARINT);
      
      public static const AUTOFERTILIZER:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Sync_Garden_Info_SC.autofertilizer","autofertilizer",5 << 3 | WireType.VARINT);
      
      public static const AUTOUSE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Cmd_Sync_Garden_Info_SC.autouse","autouse",6 << 3 | WireType.VARINT);
      
      public static const KETTLELIMIT:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Sync_Garden_Info_SC.kettlelimit","kettlelimit",7 << 3 | WireType.VARINT);
      
      public static const PETEXP:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Cmd_Sync_Garden_Info_SC.petExp","petExp",8 << 3 | WireType.VARINT);
       
      
      public var fields:Array;
      
      public var pets:Array;
      
      private var exp$field:uint;
      
      private var hasField$0:uint = 0;
      
      private var bean$field:uint;
      
      private var autofertilizer$field:uint;
      
      private var autouse$field:Boolean;
      
      private var kettlelimit$field:uint;
      
      private var petExp$field:uint;
      
      public function Cmd_Sync_Garden_Info_SC()
      {
         this.fields = [];
         this.pets = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Cmd_Sync_Garden_Info_SC.$MessageID;
      }
      
      public function clearExp() : void
      {
         this.hasField$0 &= 4294967294;
         this.exp$field = new uint();
      }
      
      public function get hasExp() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set exp(param1:uint) : void
      {
         this.hasField$0 |= 1;
         this.exp$field = param1;
      }
      
      public function get exp() : uint
      {
         return this.exp$field;
      }
      
      public function clearBean() : void
      {
         this.hasField$0 &= 4294967293;
         this.bean$field = new uint();
      }
      
      public function get hasBean() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set bean(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.bean$field = param1;
      }
      
      public function get bean() : uint
      {
         return this.bean$field;
      }
      
      public function clearAutofertilizer() : void
      {
         this.hasField$0 &= 4294967291;
         this.autofertilizer$field = new uint();
      }
      
      public function get hasAutofertilizer() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set autofertilizer(param1:uint) : void
      {
         this.hasField$0 |= 4;
         this.autofertilizer$field = param1;
      }
      
      public function get autofertilizer() : uint
      {
         return this.autofertilizer$field;
      }
      
      public function clearAutouse() : void
      {
         this.hasField$0 &= 4294967287;
         this.autouse$field = new Boolean();
      }
      
      public function get hasAutouse() : Boolean
      {
         return (this.hasField$0 & 8) != 0;
      }
      
      public function set autouse(param1:Boolean) : void
      {
         this.hasField$0 |= 8;
         this.autouse$field = param1;
      }
      
      public function get autouse() : Boolean
      {
         return this.autouse$field;
      }
      
      public function clearKettlelimit() : void
      {
         this.hasField$0 &= 4294967279;
         this.kettlelimit$field = new uint();
      }
      
      public function get hasKettlelimit() : Boolean
      {
         return (this.hasField$0 & 16) != 0;
      }
      
      public function set kettlelimit(param1:uint) : void
      {
         this.hasField$0 |= 16;
         this.kettlelimit$field = param1;
      }
      
      public function get kettlelimit() : uint
      {
         return this.kettlelimit$field;
      }
      
      public function clearPetExp() : void
      {
         this.hasField$0 &= 4294967263;
         this.petExp$field = new uint();
      }
      
      public function get hasPetExp() : Boolean
      {
         return (this.hasField$0 & 32) != 0;
      }
      
      public function set petExp(param1:uint) : void
      {
         this.hasField$0 |= 32;
         this.petExp$field = param1;
      }
      
      public function get petExp() : uint
      {
         return this.petExp$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc4_:* = undefined;
         var _loc2_:uint = 0;
         while(_loc2_ < this.fields.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.fields[_loc2_]);
            _loc2_++;
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.pets.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,2);
            WriteUtils.write$TYPE_MESSAGE(param1,this.pets[_loc3_]);
            _loc3_++;
         }
         if(this.hasExp)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.exp$field);
         }
         if(this.hasBean)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,4);
            WriteUtils.write$TYPE_UINT32(param1,this.bean$field);
         }
         if(this.hasAutofertilizer)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_UINT32(param1,this.autofertilizer$field);
         }
         if(this.hasAutouse)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,6);
            WriteUtils.write$TYPE_BOOL(param1,this.autouse$field);
         }
         if(this.hasKettlelimit)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,7);
            WriteUtils.write$TYPE_UINT32(param1,this.kettlelimit$field);
         }
         if(this.hasPetExp)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,8);
            WriteUtils.write$TYPE_UINT32(param1,this.petExp$field);
         }
         for(_loc4_ in this)
         {
            super.writeUnknown(param1,_loc4_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc9_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         var _loc6_:uint = 0;
         var _loc7_:uint = 0;
         var _loc8_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc9_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc9_ >> 3)
            {
               case 1:
                  this.fields.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_Field()));
                  break;
               case 2:
                  this.pets.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_Pet()));
                  break;
               case 3:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Sync_Garden_Info_SC.exp cannot be set twice.");
                  }
                  _loc3_++;
                  this.exp = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Sync_Garden_Info_SC.bean cannot be set twice.");
                  }
                  _loc4_++;
                  this.bean = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 5:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Sync_Garden_Info_SC.autofertilizer cannot be set twice.");
                  }
                  _loc5_++;
                  this.autofertilizer = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 6:
                  if(_loc6_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Sync_Garden_Info_SC.autouse cannot be set twice.");
                  }
                  _loc6_++;
                  this.autouse = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 7:
                  if(_loc7_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Sync_Garden_Info_SC.kettlelimit cannot be set twice.");
                  }
                  _loc7_++;
                  this.kettlelimit = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 8:
                  if(_loc8_ != 0)
                  {
                     throw new IOError("Bad data format: Cmd_Sync_Garden_Info_SC.petExp cannot be set twice.");
                  }
                  _loc8_++;
                  this.petExp = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc9_);
                  break;
            }
         }
      }
   }
}
