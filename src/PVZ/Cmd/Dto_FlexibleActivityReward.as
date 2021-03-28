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
   
   public final class Dto_FlexibleActivityReward extends Message
   {
      
      public static const $MessageID:String = "PVZ.Cmd.Dto_FlexibleActivityReward";
      
      public static const ITEMS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_FlexibleActivityReward.items","items",1 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const CANTAKE:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_FlexibleActivityReward.canTake","canTake",2 << 3 | WireType.VARINT);
      
      public static const TAKETIME:FieldDescriptor$TYPE_UINT32 = new FieldDescriptor$TYPE_UINT32("PVZ.Cmd.Dto_FlexibleActivityReward.takeTime","takeTime",3 << 3 | WireType.VARINT);
      
      public static const PRIVILEGES:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("PVZ.Cmd.Dto_FlexibleActivityReward.privileges","privileges",4 << 3 | WireType.LENGTH_DELIMITED,Dto_IdNum);
      
      public static const CANSIGN:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("PVZ.Cmd.Dto_FlexibleActivityReward.canSign","canSign",5 << 3 | WireType.VARINT);
       
      
      public var items:Array;
      
      private var canTake$field:Boolean;
      
      private var hasField$0:uint = 0;
      
      private var takeTime$field:uint;
      
      public var privileges:Array;
      
      private var canSign$field:Boolean;
      
      public function Dto_FlexibleActivityReward()
      {
         this.items = [];
         this.privileges = [];
         super();
      }
      
      override public function get $messageID() : String
      {
         return Dto_FlexibleActivityReward.$MessageID;
      }
      
      public function clearCanTake() : void
      {
         this.hasField$0 &= 4294967294;
         this.canTake$field = new Boolean();
      }
      
      public function get hasCanTake() : Boolean
      {
         return (this.hasField$0 & 1) != 0;
      }
      
      public function set canTake(param1:Boolean) : void
      {
         this.hasField$0 |= 1;
         this.canTake$field = param1;
      }
      
      public function get canTake() : Boolean
      {
         return this.canTake$field;
      }
      
      public function clearTakeTime() : void
      {
         this.hasField$0 &= 4294967293;
         this.takeTime$field = new uint();
      }
      
      public function get hasTakeTime() : Boolean
      {
         return (this.hasField$0 & 2) != 0;
      }
      
      public function set takeTime(param1:uint) : void
      {
         this.hasField$0 |= 2;
         this.takeTime$field = param1;
      }
      
      public function get takeTime() : uint
      {
         return this.takeTime$field;
      }
      
      public function clearCanSign() : void
      {
         this.hasField$0 &= 4294967291;
         this.canSign$field = new Boolean();
      }
      
      public function get hasCanSign() : Boolean
      {
         return (this.hasField$0 & 4) != 0;
      }
      
      public function set canSign(param1:Boolean) : void
      {
         this.hasField$0 |= 4;
         this.canSign$field = param1;
      }
      
      public function get canSign() : Boolean
      {
         return this.canSign$field;
      }
      
      override public final function writeToBuffer(param1:WritingBuffer) : void
      {
         var _loc4_:* = undefined;
         var _loc2_:uint = 0;
         while(_loc2_ < this.items.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,1);
            WriteUtils.write$TYPE_MESSAGE(param1,this.items[_loc2_]);
            _loc2_++;
         }
         if(this.hasCanTake)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,2);
            WriteUtils.write$TYPE_BOOL(param1,this.canTake$field);
         }
         if(this.hasTakeTime)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,3);
            WriteUtils.write$TYPE_UINT32(param1,this.takeTime$field);
         }
         var _loc3_:uint = 0;
         while(_loc3_ < this.privileges.length)
         {
            WriteUtils.writeTag(param1,WireType.LENGTH_DELIMITED,4);
            WriteUtils.write$TYPE_MESSAGE(param1,this.privileges[_loc3_]);
            _loc3_++;
         }
         if(this.hasCanSign)
         {
            WriteUtils.writeTag(param1,WireType.VARINT,5);
            WriteUtils.write$TYPE_BOOL(param1,this.canSign$field);
         }
         for(_loc4_ in this)
         {
            super.writeUnknown(param1,_loc4_);
         }
      }
      
      override public final function readFromSlice(param1:IDataInput, param2:uint) : void
      {
         var _loc6_:uint = 0;
         var _loc3_:uint = 0;
         var _loc4_:uint = 0;
         var _loc5_:uint = 0;
         while(param1.bytesAvailable > param2)
         {
            _loc6_ = ReadUtils.read$TYPE_UINT32(param1);
            switch(_loc6_ >> 3)
            {
               case 1:
                  this.items.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               case 2:
                  if(_loc3_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityReward.canTake cannot be set twice.");
                  }
                  _loc3_++;
                  this.canTake = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               case 3:
                  if(_loc4_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityReward.takeTime cannot be set twice.");
                  }
                  _loc4_++;
                  this.takeTime = ReadUtils.read$TYPE_UINT32(param1);
                  break;
               case 4:
                  this.privileges.push(ReadUtils.read$TYPE_MESSAGE(param1,new Dto_IdNum()));
                  break;
               case 5:
                  if(_loc5_ != 0)
                  {
                     throw new IOError("Bad data format: Dto_FlexibleActivityReward.canSign cannot be set twice.");
                  }
                  _loc5_++;
                  this.canSign = ReadUtils.read$TYPE_BOOL(param1);
                  break;
               default:
                  super.readUnknown(param1,_loc6_);
                  break;
            }
         }
      }
   }
}
